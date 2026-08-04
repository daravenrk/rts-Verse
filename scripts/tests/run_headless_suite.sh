#!/bin/zsh

set -u

SCRIPT_DIR="${0:A:h}"
REPO_ROOT="${SCRIPT_DIR:h:h}"
GODOT_EXECUTABLE="${GODOT_BIN:-/Applications/Godot.app/Contents/MacOS/godot}"
TEST_LOG_DIR="${RTS_TEST_LOG_DIR:-/tmp/rts-verse-headless-suite}"
DUEL_SCENE="res://scenes/core/FirstDuelMap.tscn"
FAILURES=0
PASSES=0

mkdir -p "$TEST_LOG_DIR"

if [[ ! -x "$GODOT_EXECUTABLE" ]]; then
	print -u2 "[Suite] Godot executable not found or not executable: $GODOT_EXECUTABLE"
	exit 2
fi

log_has_runtime_failure() {
	local log_path="$1"
	grep -Eq 'SCRIPT ERROR|Parse Error|Invalid call|pass=false|FAIL|FAILED' "$log_path"
}

run_duel_case() {
	local case_name="$1"
	local test_flag="$2"
	local expected_pattern="$3"
	local log_path="$TEST_LOG_DIR/${case_name}.log"
	local console_path="$TEST_LOG_DIR/${case_name}.console.log"

	"$GODOT_EXECUTABLE" --headless --log-file "$log_path" --quit --path "$REPO_ROOT" "$DUEL_SCENE" -- "$test_flag" --duel-test-auto-exit >"$console_path" 2>&1
	local exit_code=$?
	if (( exit_code != 0 )); then
		print -u2 "[Suite] FAIL case=$case_name reason=exit_code value=$exit_code log=$log_path"
		FAILURES=$((FAILURES + 1))
		return
	fi
	if log_has_runtime_failure "$log_path"; then
		print -u2 "[Suite] FAIL case=$case_name reason=runtime_or_assertion_failure log=$log_path"
		FAILURES=$((FAILURES + 1))
		return
	fi
	if ! grep -F "$expected_pattern" "$log_path" | grep -Fq 'pass=true'; then
		print -u2 "[Suite] FAIL case=$case_name reason=missing_passing_summary expected=$expected_pattern log=$log_path"
		FAILURES=$((FAILURES + 1))
		return
	fi

	print "[Suite] PASS case=$case_name"
	PASSES=$((PASSES + 1))
}

run_startup_case() {
	local log_path="$TEST_LOG_DIR/startup_to_duel.log"
	local console_path="$TEST_LOG_DIR/startup_to_duel.console.log"

	"$GODOT_EXECUTABLE" --headless --log-file "$log_path" --path "$REPO_ROOT" -- \
		--startup-test-auto-skirmish --skirmish-test-auto-start \
		--duel-test-f32-interaction --duel-test-auto-exit >"$console_path" 2>&1
	local exit_code=$?
	if (( exit_code != 0 )); then
		print -u2 "[Suite] FAIL case=startup_to_duel reason=exit_code value=$exit_code log=$log_path"
		FAILURES=$((FAILURES + 1))
		return
	fi
	if log_has_runtime_failure "$log_path" || ! grep -Fq '[F32] Summary' "$log_path" || ! grep -Fq 'pass=true' "$log_path"; then
		print -u2 "[Suite] FAIL case=startup_to_duel reason=missing_or_failed_flow log=$log_path"
		FAILURES=$((FAILURES + 1))
		return
	fi

	print "[Suite] PASS case=startup_to_duel"
	PASSES=$((PASSES + 1))
}

# Each mutable duel flow runs in a fresh process. Combining these flags in one
# scene makes results depend on hook order and shared state from earlier flows.
run_duel_case "f24_visual_baseline" "--duel-test-f24" "[F24] Summary"
run_duel_case "f32_interaction" "--duel-test-f32-interaction" "[F32] Summary"
run_duel_case "f33_blocker" "--duel-test-f33-blocker" "[F33] Summary"
run_duel_case "f35_gather" "--duel-test-f35-gather" "[F35] Summary"
run_duel_case "f36_build" "--duel-test-f36-build" "[F36] Summary"
run_duel_case "f37_combat" "--duel-test-f37-combat" "[F37] Summary"
run_duel_case "f38_production" "--duel-test-f38-production" "[F38] Summary"
run_duel_case "f40_world_events" "--duel-test-f40-world-events" "[F40] Summary"
run_duel_case "f61_enemy_ai" "--duel-test-f61-enemy-ai" "[F61] Summary"
run_duel_case "f77_player_endgame" "--duel-test-f77-tether-endgame" "[F77] Summary"
run_duel_case "f78_enemy_endgame" "--duel-test-f78-enemy-tether-endgame" "[F78] Summary"
run_startup_case

print "[Suite] Summary passes=$PASSES failures=$FAILURES logs=$TEST_LOG_DIR"
if (( FAILURES > 0 )); then
	exit 1
fi
exit 0
