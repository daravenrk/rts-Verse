#!/usr/bin/env bash

set -u

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
	printf '[GodotSafe] Godot executable not found. Set GODOT_BIN or install godot4/godot on PATH.\n' >&2
	exit 2
fi

SAFE_LOG_ROOT="${RTS_TEST_LOG_DIR:-${TMPDIR:-/tmp}}"
mkdir -p "$SAFE_LOG_ROOT"
SAFE_RUN_DIR="$(mktemp -d "$SAFE_LOG_ROOT/rts-verse-godot.XXXXXX")"
SAFE_LOG_PATH="$SAFE_RUN_DIR/godot.log"

printf '[GodotSafe] log=%s\n' "$SAFE_LOG_PATH"
"$GODOT_EXECUTABLE" --log-file "$SAFE_LOG_PATH" "$@"
