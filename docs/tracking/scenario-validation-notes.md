# Scenario Validation Notes

Track scenario-level evidence for map and flow validation runs.

## 2026-06-10 First Duel Map Item Catalog Baseline

- Scenario: `scenes/core/FirstDuelMap.tscn`
- Environment declaration: Primary `Radial Impact Zone`, Secondary `None`.
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1`
- Result: Pass
- Notes:
  - Primary/secondary/high-risk resource zone annotations initialized with stable IDs.
  - Required strategic and tactical map items initialized with stable IDs.
  - Optional extension prototype item initialized (`OPTIONAL-RELAY-01`).
  - Required catalog count checks passed for all required map item classes.

### Stable Map Item IDs

- Zone annotations:
  - `ZONE-PRIMARY-ALLOY`
  - `ZONE-SECONDARY-ALLOY`
  - `ZONE-HIGHRISK-ALLOY`
- Required strategic items:
  - `SPAWN-CORE-A`
  - `SPAWN-CORE-B`
  - `SAFE-ALLOY-A`
  - `SAFE-ALLOY-B`
  - `NATURAL-ALLOY-A`
  - `NATURAL-ALLOY-B`
  - `MID-ALLOY-N`
  - `MID-ALLOY-S`
  - `DATA-NODE-CENTER`
  - `RECLAIM-CENTER`
- Required tactical items:
  - `COVER-01`
  - `COVER-02`
  - `COVER-03`
  - `COVER-04`
  - `CHOKE-01`
  - `ELEVATED-01`
  - `LOS-01`
  - `LOS-02`
  - `LOS-03`
  - `LOS-04`
  - `LOS-05`
  - `LOS-06`
- Optional MVP extension item:
  - `OPTIONAL-RELAY-01`

## 2026-06-10 F-26 Environment Type Readability

- Flow: `F-26 Environment Type Readability`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Environment declaration confirmed:
  - Primary: `Radial Impact Zone`
  - Secondary: `None`
- Validation commands:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-player-faction=helion --duel-test-enemy-faction=veyari`
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-player-faction=veyari --duel-test-enemy-faction=helion`
- Result: Pass
- First-engagement notes:
  - Center objective gravity is explicit via `DATA-NODE-CENTER` and mirrored contested midfield Alloy nodes (`MID-ALLOY-N`, `MID-ALLOY-S`).
  - Direct pressure lane readability is reinforced by `CHOKE-01` plus near-lane LOS blockers (`LOS-01`, `LOS-02`).
  - Flank pressure route remains viable and readable through `COVER-03`, `COVER-04`, `LOS-05`, and `LOS-06` placement.
  - Elevated contest anchor `ELEVATED-01` introduces visible high-ground pressure while preserving multi-angle entry.
  - Faction swap run confirms Tether positions remain map-defined (`SpawnA` at `(-280.0, 0.0)`, `SpawnB` at `(280.0, 0.0)`) independent of faction assignment.

## 2026-06-10 F-24 Small-Scale 3D Readability and Animation Baseline

- Flow: `F-24 Small-Scale 3D Readability and Animation Subspace Compliance`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f24`
- Result: Pass
- Notes:
  - Camera baseline log emitted: pitch `52`, yaw-step `15`, zoom default `34`, min `26`, max `48`.
  - MVP unit actor spawn and baseline-state validation covered 12 units across Helion and Veyari.
  - Summary reported `pass_units=12` and `total_units=12`.

## 2026-06-10 F-18/F-19 Command and HUD Baseline

- Flow: `F-18 Keyboard and Mouse Command Coverage` + `F-19 Camera and HUD Usability Validation`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f18f19`
- Result: Pass
- Notes:
  - Command acknowledgements emitted for `move`, `attack`, `attack_move`, `gather`, `repair`, `patrol`, `hold`, and `stop` on active selection.
  - Negative-path validation emitted expected rejection for invalid repair target (`reason=invalid_target`).
  - Control-group coverage included assign, recall, and camera-center feedback (`[Camera] Center group=1 ...`).
  - HUD synchronization summary emitted resource, alert, and queue state strings after command and group interactions.

## 2026-06-10 F-20/F-21 Resource Loop and Opening Parity Baseline

- Flow: `F-20 Resource Discovery and Security Dominance Loop` + `F-21 Opening Clarity and Parity Gate`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f20f21`
- Result: Pass
- Notes:
  - Objective-loop telemetry emitted deterministic contest events at sec `75` (midfield alloy) and sec `150` (data node).
  - Opening gate check reported advanced systems remain disabled during opening window for both factions.
  - Parity deltas reported within threshold: expansion `4`, factory `3`, objective `5` (all pass).
  - Combined summary emitted `pass=true` for F-20/F-21 baseline flow.
