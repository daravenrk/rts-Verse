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
