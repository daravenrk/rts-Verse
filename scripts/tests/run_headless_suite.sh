#!/usr/bin/env bash

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
DUEL_SCENE="res://scenes/core/FirstDuelMap.tscn"
TEST_TIMEOUT_SECONDS="${RTS_TEST_TIMEOUT_SECONDS:-30}"
FAILURES=0
PASSES=0

resolve_godot_executable() {
	if [[ -n "${GODOT_BIN:-}" ]]; then
		printf '%s\n' "$GODOT_BIN"
		return
	fi
	if command -v godot4 >/dev/null 2>&1; then
		command -v godot4
		return
	fi
	if command -v godot >/dev/null 2>&1; then
		command -v godot
		return
	fi
	if [[ -x /Applications/Godot.app/Contents/MacOS/godot ]]; then
		printf '%s\n' /Applications/Godot.app/Contents/MacOS/godot
		return
	fi
	return 1
}

GODOT_EXECUTABLE="$(resolve_godot_executable || true)"
if [[ -z "$GODOT_EXECUTABLE" || ! -x "$GODOT_EXECUTABLE" ]]; then
	printf '[Suite] Godot executable not found. Set GODOT_BIN or install godot4/godot on PATH.\n' >&2
	exit 2
fi

GODOT_VERSION="$("$GODOT_EXECUTABLE" --version 2>&1 | head -n 1)"
if [[ ! "$GODOT_VERSION" =~ ^4\.([5-9]|[1-9][0-9])\. && ! "$GODOT_VERSION" =~ ^[5-9]\. ]]; then
	printf '[Suite] Unsupported Godot version: %s (project requires 4.5+)\n' "$GODOT_VERSION" >&2
	exit 2
fi

if [[ -n "${RTS_TEST_LOG_DIR:-}" ]]; then
	mkdir -p "$RTS_TEST_LOG_DIR"
	RUN_LOG_DIR="$(mktemp -d "$RTS_TEST_LOG_DIR/run.XXXXXX")"
else
	RUN_LOG_DIR="$(mktemp -d "${TMPDIR:-/tmp}/rts-verse-headless-suite.XXXXXX")"
fi

normalize_known_environment_noise() {
	awk '
		/^ERROR: Condition "ret != noErr" is true\. Returning: ""$/ {
			pending_ca_error = $0
			next
		}
		pending_ca_error != "" {
			if ($0 ~ /get_system_ca_certificates/) {
				pending_ca_error = ""
				next
			}
			print pending_ca_error
			pending_ca_error = ""
		}
		{ print }
		END {
			if (pending_ca_error != "") print pending_ca_error
		}
	' "$1"
}

output_has_runtime_failure() {
	local output_path="$1"
	normalize_known_environment_noise "$output_path" | \
		grep -Eq '(^|[[:space:]])ERROR:|SCRIPT ERROR|Parse Error|Invalid call|Failed loading|push_error|pass=false|FAIL|FAILED'
}

run_with_watchdog() {
	local marker_path="$1"
	shift
	"$@" &
	local process_id=$!
	(
		sleep "$TEST_TIMEOUT_SECONDS"
		if kill -0 "$process_id" >/dev/null 2>&1; then
			: >"$marker_path"
			kill -TERM "$process_id" >/dev/null 2>&1 || true
			sleep 1
			kill -KILL "$process_id" >/dev/null 2>&1 || true
		fi
	) &
	local watchdog_id=$!

	wait "$process_id"
	local exit_code=$?
	kill "$watchdog_id" >/dev/null 2>&1 || true
	wait "$watchdog_id" >/dev/null 2>&1 || true
	if [[ -f "$marker_path" ]]; then
		return 124
	fi
	return "$exit_code"
}

validate_outputs() {
	local case_name="$1"
	local log_path="$2"
	local console_path="$3"

	if [[ ! -s "$log_path" ]]; then
		printf '[Suite] FAIL case=%s reason=missing_fresh_godot_log log=%s\n' "$case_name" "$log_path" >&2
		return 1
	fi
	if output_has_runtime_failure "$log_path" || output_has_runtime_failure "$console_path"; then
		printf '[Suite] FAIL case=%s reason=unexpected_engine_or_runtime_error log=%s console=%s\n' "$case_name" "$log_path" "$console_path" >&2
		return 1
	fi
	return 0
}

validate_single_summary() {
	local case_name="$1"
	local log_path="$2"
	local expected_prefix="$3"
	local matching_count
	matching_count="$(grep -Fc "$expected_prefix" "$log_path" || true)"
	if [[ "$matching_count" -ne 1 ]]; then
		printf '[Suite] FAIL case=%s reason=expected_one_summary count=%s prefix=%s log=%s\n' \
			"$case_name" "$matching_count" "$expected_prefix" "$log_path" >&2
		return 1
	fi
	if ! grep -F "$expected_prefix" "$log_path" | grep -Eq '(^|[[:space:]])pass=true([[:space:]]|$)'; then
		printf '[Suite] FAIL case=%s reason=summary_not_passing prefix=%s log=%s\n' \
			"$case_name" "$expected_prefix" "$log_path" >&2
		return 1
	fi
	return 0
}

record_failure() {
	FAILURES=$((FAILURES + 1))
}

record_pass() {
	printf '[Suite] PASS case=%s\n' "$1"
	PASSES=$((PASSES + 1))
}

run_project_parse_gate() {
	local case_name="project_parse"
	local script_path relative_path safe_name log_path console_path timeout_marker exit_code
	for script_path in "$REPO_ROOT"/scripts/core/*.gd; do
		relative_path="res://${script_path#"$REPO_ROOT"/}"
		safe_name="$(basename "$script_path" .gd)"
		log_path="$RUN_LOG_DIR/${case_name}_${safe_name}.log"
		console_path="$RUN_LOG_DIR/${case_name}_${safe_name}.console.log"
		timeout_marker="$RUN_LOG_DIR/${case_name}_${safe_name}.timeout"
		: >"$log_path"
		: >"$console_path"

		run_with_watchdog "$timeout_marker" \
			"$GODOT_EXECUTABLE" --headless --check-only --log-file "$log_path" --path "$REPO_ROOT" --script "$relative_path" \
			>"$console_path" 2>&1
		exit_code=$?
		if [[ "$exit_code" -eq 124 ]]; then
			printf '[Suite] FAIL case=%s script=%s reason=timeout seconds=%s\n' "$case_name" "$relative_path" "$TEST_TIMEOUT_SECONDS" >&2
			record_failure
			return
		fi
		if [[ "$exit_code" -ne 0 ]]; then
			printf '[Suite] FAIL case=%s script=%s reason=exit_code value=%s log=%s\n' "$case_name" "$relative_path" "$exit_code" "$log_path" >&2
			record_failure
			return
		fi
		if ! validate_outputs "${case_name}_${safe_name}" "$log_path" "$console_path"; then
			record_failure
			return
		fi
	done
	record_pass "$case_name"
}

run_duel_case() {
	local case_name="$1"
	local test_flag="$2"
	local expected_prefix="$3"
	local log_path="$RUN_LOG_DIR/${case_name}.log"
	local console_path="$RUN_LOG_DIR/${case_name}.console.log"
	local timeout_marker="$RUN_LOG_DIR/${case_name}.timeout"
	local profile_path="$RUN_LOG_DIR/${case_name}.input_profile.cfg"
	: >"$log_path"
	: >"$console_path"

	run_with_watchdog "$timeout_marker" \
		"$GODOT_EXECUTABLE" --headless --log-file "$log_path" --path "$REPO_ROOT" "$DUEL_SCENE" -- \
		"$test_flag" --duel-test-auto-exit "--test-input-profile=$profile_path" \
		>"$console_path" 2>&1
	local exit_code=$?
	if [[ "$exit_code" -eq 124 ]]; then
		printf '[Suite] FAIL case=%s reason=timeout seconds=%s log=%s\n' "$case_name" "$TEST_TIMEOUT_SECONDS" "$log_path" >&2
		record_failure
		return
	fi
	if [[ "$exit_code" -ne 0 ]]; then
		printf '[Suite] FAIL case=%s reason=exit_code value=%s log=%s\n' "$case_name" "$exit_code" "$log_path" >&2
		record_failure
		return
	fi
	if ! validate_outputs "$case_name" "$log_path" "$console_path"; then
		record_failure
		return
	fi
	if ! validate_single_summary "$case_name" "$log_path" "$expected_prefix"; then
		record_failure
		return
	fi
	record_pass "$case_name"
}

run_startup_case() {
	local case_name="startup_to_duel"
	local log_path="$RUN_LOG_DIR/${case_name}.log"
	local console_path="$RUN_LOG_DIR/${case_name}.console.log"
	local timeout_marker="$RUN_LOG_DIR/${case_name}.timeout"
	local profile_path="$RUN_LOG_DIR/${case_name}.input_profile.cfg"
	: >"$log_path"
	: >"$console_path"

	run_with_watchdog "$timeout_marker" \
		"$GODOT_EXECUTABLE" --headless --log-file "$log_path" --path "$REPO_ROOT" -- \
		--startup-test-auto-skirmish --skirmish-test-auto-start \
		--skirmish-test-player-faction=helion --skirmish-test-enemy-faction=veyari \
		--duel-test-f32-interaction --duel-test-auto-exit "--test-input-profile=$profile_path" \
		>"$console_path" 2>&1
	local exit_code=$?
	if [[ "$exit_code" -eq 124 ]]; then
		printf '[Suite] FAIL case=%s reason=timeout seconds=%s log=%s\n' "$case_name" "$TEST_TIMEOUT_SECONDS" "$log_path" >&2
		record_failure
		return
	fi
	if [[ "$exit_code" -ne 0 ]]; then
		printf '[Suite] FAIL case=%s reason=exit_code value=%s log=%s\n' "$case_name" "$exit_code" "$log_path" >&2
		record_failure
		return
	fi
	if ! validate_outputs "$case_name" "$log_path" "$console_path"; then
		record_failure
		return
	fi
	if ! grep -Fq '[Skirmish] Start pressed: player=helion enemy=veyari' "$log_path"; then
		printf '[Suite] FAIL case=%s reason=incorrect_or_missing_faction_route log=%s\n' "$case_name" "$log_path" >&2
		record_failure
		return
	fi
	if ! validate_single_summary "$case_name" "$log_path" '[F32] Summary'; then
		record_failure
		return
	fi
	record_pass "$case_name"
}

printf '[Suite] Godot=%s version=%s\n' "$GODOT_EXECUTABLE" "$GODOT_VERSION"
printf '[Suite] Run logs=%s timeout_seconds=%s\n' "$RUN_LOG_DIR" "$TEST_TIMEOUT_SECONDS"

run_project_parse_gate

# Authoritative live/runtime gates. Each mutable duel flow runs in a fresh process.
run_duel_case "f01_f02_selection_movement" "--duel-test-f01f02" "[F01/F02] Summary"
run_duel_case "f03_gather_simulation" "--duel-test-f03" "[F03] Summary"
run_duel_case "f04_match_hud" "--duel-test-f04" "[F04] Summary"
run_duel_case "f24_visual_baseline" "--duel-test-f24" "[F24] Summary"
run_duel_case "map_baseline" "--duel-test-map-baseline" "[MapBaseline] Summary"
run_duel_case "f32_interaction" "--duel-test-f32-interaction" "[F32] Summary"
run_duel_case "f33_blocker" "--duel-test-f33-blocker" "[F33] Summary"
run_duel_case "f35_gather" "--duel-test-f35-gather" "[F35] Summary"
run_duel_case "f36_build" "--duel-test-f36-build" "[F36] Summary"
run_duel_case "f37_combat" "--duel-test-f37-combat" "[F37] Summary"
run_duel_case "f38_production" "--duel-test-f38-production" "[F38] Summary"
run_duel_case "f39_stockpile" "--duel-test-f39-stockpile" "[F39] Summary"
run_duel_case "f40_world_events" "--duel-test-f40-world-events" "[F40] Summary"
run_duel_case "f60_drag_selection" "--duel-test-f60-drag-select" "[F60] Summary"
run_duel_case "camera_ui" "--duel-test-camera-ui" "[CameraUI] Summary"
run_duel_case "f61_enemy_ai" "--duel-test-f61-enemy-ai" "[F61] Summary"
run_duel_case "f77_player_endgame" "--duel-test-f77-tether-endgame" "[F77] Summary"
run_duel_case "f78_enemy_endgame" "--duel-test-f78-enemy-tether-endgame" "[F78] Summary"
run_startup_case

printf '[Suite] Summary passes=%s failures=%s logs=%s\n' "$PASSES" "$FAILURES" "$RUN_LOG_DIR"
if (( FAILURES > 0 )); then
	exit 1
fi
exit 0
