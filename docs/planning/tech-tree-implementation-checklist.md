# Tech-Tree Implementation Checklist

Use this checklist to convert the vertical-slice lock into concrete scene and script deliverables.

## Scope

- Focus on currently implemented vertical-slice factions and MVP duel flow.
- Map each required tech-tree element to scene or script implementation targets.

## Tier 0 Checklist

| Item | Scene Target | Script Target | Status Check |
| --- | --- | --- | --- |
| Primary command structure role (Tether Point) | scenes/core/FirstDuelMap.tscn | scripts/core/TetherPoint.gd | Spawned at both map slots with stable IDs and telemetry |
| Opening buildables (power, alloy, barracks) | scenes/core/FirstDuelMap.tscn | scripts/core/BuildableNode.gd, scripts/core/FirstDuelMap.gd | Build-chain hook completes all T0 structures per slot |
| Opening scout and builder availability | scenes/core/FirstDuelMap.tscn | scripts/core/FirstDuelMap.gd | Production-chain hook emits builder and scout-class equivalents per faction baseline |

## Tier 1 Checklist

| Item | Scene Target | Script Target | Status Check |
| --- | --- | --- | --- |
| Vehicle structure and first vehicle roster | scenes/core/FirstDuelMap.tscn | scripts/core/FirstDuelMap.gd | Production hook emits Tier 1 vehicle outputs for active factions |
| Sensor or uplink baseline | scenes/core/FirstDuelMap.tscn | scripts/core/FirstDuelMap.gd | Build chain includes `sensor_uplink` without dependency deadlock |
| Expansion structure baseline | scenes/core/FirstDuelMap.tscn | scripts/core/FirstDuelMap.gd | Build chain supports `expansion_hub` unlock path |

## Tier 2 Checklist (Representative Path)

| Item | Scene Target | Script Target | Status Check |
| --- | --- | --- | --- |
| Advanced ground unlock structure | scenes/core/FirstDuelMap.tscn | scripts/core/FirstDuelMap.gd | `advanced_ground_structure` builds after Tier 1 prerequisites |
| Representative Helion T2 unit | scenes/core/FirstDuelMap.tscn | scripts/core/FirstDuelMap.gd | T2 path hook produces `sunforge_artillery` |
| Representative Obsidian T2 unit | scenes/core/FirstDuelMap.tscn | scripts/core/FirstDuelMap.gd | T2 path hook produces `ruin_launcher` |
| Representative Veyari T2 option | scenes/core/FirstDuelMap.tscn | scripts/core/FirstDuelMap.gd | F-16 hook produces `singularity_lobber` in transition validation |

## Validation Hooks

- Production baseline:
  - `--duel-test-production-chain`
- MVP duel completeness:
  - `--duel-test-f16`
- Representative Tier 2 transition paths:
  - `--duel-test-t2-paths`

## Completion Rule

Mark this checklist complete only when:

- Tier 0, Tier 1, and representative Tier 2 rows each have passing hook evidence in scenario validation notes.
- No dependency deadlock appears in build or production summaries.
