# Godot Testing Environment

This repository's authoritative automated check is:

```sh
scripts/tests/run_headless_suite.sh
```

## Requirements

- Godot 4.5 or newer.
- Bash.
- A writable temporary directory.
- No editor session or display server is required.

The runner resolves Godot in this order:

1. `GODOT_BIN` environment override.
2. `godot4` on `PATH`.
3. `godot` on `PATH`.
4. `/Applications/Godot.app/Contents/MacOS/godot` on macOS.

Example override:

```sh
GODOT_BIN=/opt/godot/godot scripts/tests/run_headless_suite.sh
```

## Environment Controls

- `RTS_TEST_TIMEOUT_SECONDS`: per-process watchdog timeout; default `30`.
- `RTS_TEST_LOG_DIR`: parent directory for unique per-run log folders.
- `GODOT_BIN`: explicit Godot executable.

Every run creates a unique log directory and prints its path. Every case receives a
fresh engine log, console log, timeout marker, and test-only input-profile path.

## Reliability Contract

The suite fails when any of the following occurs:

- Godot is missing, is not executable, or is older than 4.5.
- A process exceeds the watchdog timeout.
- Godot returns a nonzero exit code.
- A fresh nonempty engine log is not created.
- Engine or script output contains an unexpected `ERROR:`, script or parse error,
  invalid call, failed load, explicit failure marker, or `pass=false`.
- The expected summary is missing, duplicated, malformed, or lacks `pass=true`.
- Startup does not route the deterministic Helion-versus-Veyari matchup.

Godot on macOS currently emits a certificate lookup diagnostic in headless mode:

```text
ERROR: Condition "ret != noErr" is true. Returning: ""
   at: get_system_ca_certificates (...)
```

Only this exact paired diagnostic is filtered. Other engine errors remain fatal.

## Isolation Rules

- Mutable duel flows run in separate Godot processes.
- Tests use `--test-input-profile=<temporary path>` and do not read or overwrite the
  developer's `user://input_profile.cfg`.
- Startup uses explicit player and enemy faction overrides.
- Direct duel tests do not use engine `--quit`; the scene test exit is protected by
  an external watchdog so asynchronous tests can advance frames safely.
- Core scripts pass a `--check-only` parse gate before gameplay cases begin.

## Current Gate Set

The default suite covers project parsing, selection and movement, gathering, HUD
match states, primitive visual baselines, map baselines, live interaction, blocker
rejection, construction, combat, production, stockpiles, forced world-event
application, drag selection, camera UI, enemy AI, both endgame directions, and the
full startup-to-duel route.

Deterministic design simulations are intentionally not all part of the default live
smoke gate. Their passing output does not imply the associated gameplay system is
player-reachable.

## Known Limitation

Individual Godot hooks still communicate most assertion failures through structured
summary text, and Godot may return exit code zero for some engine load failures. Run
the suite rather than treating a raw Godot process exit code as authoritative. The
suite validates both output streams and the required summary contract.
