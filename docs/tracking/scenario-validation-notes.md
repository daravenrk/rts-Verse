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

## 2026-06-10 F-01/F-02 Selection and Movement Baseline

- Flow: `F-01 Unit Selection` + `F-02 Movement Command`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f01f02`
- Result: Pass
- Notes:
  - Selection hook validated single-select, box-select multi-select, and additive box-select expansion.
  - Movement hook validated two sequential move commands to distinct targets with deterministic arrival checks.
  - Summary emitted `pass=true` for combined F-01/F-02 flow.

## 2026-06-10 F-03 Resource Gather Loop Baseline

- Flow: `F-03 Resource Gather Loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f03`
- Result: Pass
- Notes:
  - Gather loop used `unit_alpha` for two deterministic gather-return cycles between safe node and home return point.
  - Each deposit cycle increased alloy total by `35`, resulting in final `alloy_total=70`.
  - Summary emitted `pass=true` for F-03 baseline.

## 2026-06-10 F-04 Temporary HUD Win and Loss Baseline

- Flow: `F-04 Win and Loss Trigger`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f04`
- Result: Pass
- Notes:
  - HUD resource bar update validated through staged resource snapshots (`Alloy: 140` then `Alloy: 40`).
  - Match-state label transitions validated for `Win (objective_control)` and `Loss (command_core_destroyed)`.
  - Summary emitted `pass=true` for F-04 baseline.

## 2026-06-10 T0/T1 Production Chain Baseline (Helion and Veyari)

- Flow: `Production Chain Baseline (Pre-F-16 dependency check)`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-production-chain`
- Result: Pass
- Notes:
  - Helion slot produced: `line_engineer`, `lancer_squad`, `breach_team`, `strider_bike`, `ember_tank`.
  - Veyari slot produced: `brood_architect`, `needle_brood`, `rift_claw`, `skitter_lance`, `bulwark_husk`, `mire_spitter`.
  - Slot summaries and global summary emitted `pass=true`.

## 2026-06-10 Duel Map Baseline Parity and Objective Placement

- Flow: `F-07 Spawn Fairness and Expansion Timing (baseline)` + `F-08 Economy Pressure and Resource Control (layout baseline)`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-map-baseline`
- Result: Pass
- Notes:
  - Parity summary reported natural and contested-objective travel deltas at `0.00` with `pass=true`.
  - Objective summary reported required counts met: contested alloy `2`, data nodes `1`, reclaim clusters `1`.
  - Combined map baseline summary emitted `pass=true`.

## 2026-06-10 F-16 Human vs Alien MVP Combat Completeness Baseline

- Flow: `F-16 Human vs Alien MVP Combat Completeness`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f16`
- Result: Pass
- Notes:
  - Helion required roster chain produced: `line_engineer`, `lancer_squad`, `breach_team`, `strider_bike`, `ember_tank`, `sunforge_artillery`.
  - Veyari required roster chain produced: `brood_architect`, `needle_brood`, `rift_claw`, `skitter_lance`, `bulwark_husk`, `mire_spitter`.
  - T2 transition options validated with no deadlocks: Helion `sunforge_artillery`, Veyari `singularity_lobber`.
  - Slot summaries and global summary emitted `pass=true`.

## 2026-06-10 F-17 Map-Aware Tactical Combat Intelligence Baseline

- Flow: `F-17 Map-Aware Tactical Combat Intelligence`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f17`
- Result: Pass
- Notes:
  - Lane choice used score-based route selection combining route risk and travel distance.
  - Objective contest ETA checks passed for both spawns within configured window.
  - Regroup checks passed for both spawns using collapse-to-regroup distance bounds relative to committed route distance.
  - Summary emitted `pass=true` with `route_pass=true`, `contest_pass=true`, and `regroup_pass=true`.

## 2026-06-10 Obsidian T0/T1 Production Chain Baseline

- Flow: `Production Chain Baseline (Obsidian slot validation)`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-player-faction=obsidian --duel-test-production-chain`
- Result: Pass
- Notes:
  - Obsidian slot produced: `foundry_engineer`, `warder_team`, `breacher_team`, `maul_rover`, `cinder_mortar`.
  - Companion slot produced Veyari baseline chain with pass summary.
  - Global production summary emitted `pass=true`.

## 2026-06-10 Locked-Slice Faction Behavior Profile Baseline

- Flow: `Locked-slice roster behavior profile validation`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-roster-behaviors`
- Result: Pass
- Notes:
  - Helion locked units validated with fast or timing-push behavior signatures.
  - Obsidian locked units validated with attrition-oriented behavior signatures.
  - Role-tag, tempo, and preferred-lane fields were present for all locked-slice units.
  - Summary emitted `pass=true` with faction-expression validation success.

## 2026-06-10 Economy Sheet and Identity Standards Validation (T-0012/T-0013)

- Flow: `Planning baseline validation for numeric sheet and faction identity`
- Validation command:
  - `grep -nE "First Balance Sheet Draft|Shared MVP Structures|Helion MVP Units|Veyari MVP Units|First-Pass Upkeep Rules|Faction Economic Identity|Helion Directorate|Obsidian Forge|Resource Control Standards" docs/planning/economy-standards.md`
- Result: Pass
- Notes:
  - Numeric MVP sheet sections are present for structures, faction unit rows, and upkeep rules.
  - Helion and Obsidian identity sections remain aligned with resource-control standards and intended faction tempo differences.

## 2026-06-10 Representative Tier 2 Path Baseline (T-0009)

- Flow: `Representative Tier 2 unlock path validation`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-enemy-faction=obsidian --duel-test-t2-paths`
- Result: Pass
- Notes:
  - Helion representative T2 unit validated: `sunforge_artillery` from `advanced_ground_structure`.
  - Obsidian representative T2 unit validated: `ruin_launcher` from `advanced_ground_structure`.
  - Summary emitted `pass=true`.

## 2026-06-10 Planning Checklist Artifact Validation

- Flow: `Planning artifact presence validation`
- Validation command:
  - `grep -nE "Tech-tree implementation checklist|Carrier and air-wing validation checklist" docs/README.md`
- Result: Pass
- Notes:
  - `docs/planning/tech-tree-implementation-checklist.md` present and linked from docs index.
  - `docs/planning/air-wing-validation-checklist.md` present and linked from docs index.

## 2026-06-10 Colony and Civilian Pricing Baseline Validation

- Flow: `Planning artifact validation for colony/civilian economy baseline`
- Validation command:
  - `grep -nE "Colony and Civilian Pricing Baseline|Colony and Civilian Structures|Colony and Civilian Units|Colony and Civilian Upkeep Rules" docs/planning/economy-standards.md`
- Result: Pass
- Notes:
  - Numeric baseline sections for colony and civilian structures, units, and upkeep rules are present.

## 2026-06-10 Colony Defense Path Prototype Baseline

- Flow: `Colony-defense path prototype (Militia Barracks to Security Command Post)`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-colony-defense`
- Result: Pass
- Notes:
  - Build path validated: `militia_barracks` then `security_command_post` through dependency chain.
  - Defense production validated: `security_militia_squad`, `patrol_buggy`, and `peacekeeper_walker`.
  - Summary emitted `pass=true`.

## 2026-06-10 Named Faction and Robot Planning Baseline Validation

- Flow: `Planning artifact validation for named five-faction baseline`
- Validation command:
  - `grep -nE "Frontier Covenant|Veyari Ascendancy|Promethean Assembly|Named Faction Baseline" docs/planning/game-vision.md docs/planning/tech-tree.md docs/planning/unit-list.md`
  - `grep -nE "Robot Faction Planning Section|Robot Baseline Unit Roles|Robot Baseline Structures" docs/planning/unit-list.md`
- Result: Pass
- Notes:
  - Third human, alien, and robot placeholder names and flavor notes are present.
  - Five-faction baseline naming is synchronized across planning baselines.
  - Dedicated robot roster and structure planning section is present.

## 2026-06-10 Five-Tier and Five-Faction Coverage Planning Validation

- Flow: `F-29 Five-Tier Progression Coverage Mapping`
- Flow: `F-30 Named Five-Faction Baseline Coverage`
- Validation command:
  - `grep -nE "^# Five-Tier Faction Mapping Baseline|## Unit Tier Mapping|## Structure Tier Mapping|American Expeditionary Command|Chinese Systems Front|Frontier Covenant|Veyari Ascendancy|Promethean Assembly" docs/planning/five-tier-faction-mapping.md`
  - `grep -nE "F-29|F-30|Five-Tier Progression Coverage Mapping|Named Five-Faction Baseline Coverage" docs/planning/testing-strategy.md`
  - `grep -nE "T-0030|T-0031|T-0032" docs/planning/task-backlog.md`
- Result: Pass
- Notes:
  - Five-tier mapping artifact exists with named faction coverage and unit/structure tier mappings.
  - Testing strategy contains explicit F-29 and F-30 definitions and matrix rows.
  - Backlog includes aligned coverage tasks for mapping and validation updates.

## 2026-06-10 Global Stockpile Cap Baseline Validation

- Flow: `Planning artifact validation for global stockpile cap and depletion rules`
- Validation command:
  - `grep -nE "First-Pass Global Stockpile Caps and Depletion Rules|Global Cap \(World Reserve\)|Soft Depletion Threshold|Hard Depletion Threshold|Floor and anti-collapse rules" docs/planning/economy-standards.md`
- Result: Pass
- Notes:
  - First-pass global cap values are defined for Alloy, Power, Data, and Reclaim.
  - Soft and hard depletion thresholds are explicitly documented.
  - Anti-collapse event bounds are defined to prevent runaway volatility.

## 2026-06-10 World Event and Stockpile UI Telemetry Baseline Validation

- Flow: `Planning artifact validation for bounded world events`
- Flow: `F-31 Stockpile and World-Event UI Telemetry Coverage`
- Validation command:
  - `grep -nE "First-Pass Random World Event Table|Cadence and targeting guardrails|Positive event bounds|Negative event bounds|Selection weighting rules|E-00" docs/planning/economy-standards.md`
  - `grep -nE "^# Stockpile and World Event UI Telemetry Checklist|UI Surface Checklist|Telemetry Payload Checklist|Validation Hooks|Failure Triage Rules" docs/planning/stockpile-event-ui-telemetry-checklist.md`
  - `grep -nE "F-31|Stockpile and World-Event UI Telemetry Coverage" docs/planning/testing-strategy.md`
  - `grep -nE "T-0033|T-0034" docs/planning/task-backlog.md`
- Result: Pass
- Notes:
  - Economy standards now includes bounded positive and negative world event definitions.
  - Checklist artifact defines UI and telemetry observability requirements for stockpile and event systems.
  - Testing strategy and backlog include aligned flow and task references.

## 2026-06-10 Era Transition Trigger and Pacing Baseline Validation

- Flow: `Planning artifact validation for warfare-era transition triggers`
- Validation command:
  - `grep -nE "Civilizational Era Transition Triggers and Pacing Targets|Survival Warfare|Augmented Warfare|Autonomous Warfare|Network Warfare|Trigger Contract|Pacing Targets by Era|Transition Safeguards" docs/planning/world-systems-baseline.md`
  - `grep -nE "Flow F-12 Civilizational Era Transition Readability|Survival, Augmented, Autonomous, and Network warfare phases|Transition timing remains within documented target bands" docs/planning/testing-strategy.md`
  - `grep -nE "T-0035" docs/planning/task-backlog.md`
- Result: Pass
- Notes:
  - Four-era transition contract is documented with trigger requirements and pacing guardrails.
  - F-12 flow now validates transition readability and target-band compliance.
  - Backlog now tracks era-transition baseline closure with direct references.

## 2026-06-10 Ideology Paths Baseline Validation

- Flow: `Planning artifact validation for ideology path definitions`
- Validation command:
  - `grep -nE "^# Ideology Paths Baseline|Path A: Purists|Path B: Symbiotes|Path C: Cybernetic Ascendants|Core Strengths|Failure Modes|Cross-Path Balance Guardrails" docs/planning/ideology-paths-baseline.md`
  - `grep -nE "Ideology paths baseline" docs/README.md`
  - `grep -nE "T-0036" docs/planning/task-backlog.md`
- Result: Pass
- Notes:
  - First-pass ideology paths are defined with strengths, liabilities, and failure modes for each branch.
  - Documentation index and backlog include references to the ideology baseline artifact.

## 2026-06-10 One Box and Maintenance-Instability Baseline Validation

- Flow: `Planning artifact validation for One Box and automation burden systems`
- Validation command:
  - `grep -nE "^# Network Resilience and Maintenance Baseline|One Box Original-Core Penalty Rules|Distributed Network Recovery Mechanics|Maintenance-Instability Resource Model|Penalty Profile on Original-Core Loss|Baseline Thresholds|Instability Escalation Rules" docs/planning/network-resilience-maintenance-baseline.md`
  - `grep -nE "Network resilience and maintenance baseline" docs/README.md`
  - `grep -nE "T-0037|T-0038" docs/planning/task-backlog.md`
- Result: Pass
- Notes:
  - One Box penalties and staged distributed recovery mechanics are documented with explicit thresholds.
  - Maintenance-instability model is documented across upkeep, bandwidth, cooling, and logistics.
  - Index and backlog references are synchronized for closure traceability.

## 2026-06-10 Infrastructure, Descent, and Dynamic Evolution Baseline Validation

- Flow: `Planning artifact validation for infrastructure warfare and Descent branch systems`
- Validation command:
  - `grep -nE "^# Infrastructure Warfare Design Checklist|Superweapon System Checklist|Command Disruption Checklist|Counterplay Checklist|Telemetry and UI Checklist|Validation Hooks" docs/planning/infrastructure-warfare-checklist.md`
  - `grep -nE "^# Descent Systems Baseline|Descent Access-Node Control Rules|Orbital Corridor Contest Mechanics|Descent Event Catalog|Cadence Guardrails|D-00" docs/planning/descent-systems-baseline.md`
  - `grep -nE "^# Dynamic Evolution and Readability Baseline|Dynamic Evolution Branch Thresholds|Branch Threshold Contract|Player-Facing Readability Rules|Readability Fail Conditions" docs/planning/dynamic-evolution-and-readability-baseline.md`
  - `grep -nE "Infrastructure warfare checklist|Descent systems baseline|Dynamic evolution and readability baseline" docs/README.md`
  - `grep -nE "T-0039|T-0040|T-0041|T-0042|T-0043" docs/planning/task-backlog.md`
- Result: Pass
- Notes:
  - Infrastructure warfare checklist defines disruption, counterplay, and observability requirements.
  - Descent baseline defines node-control mechanics, corridor states, and bounded event cadence.
  - Dynamic evolution baseline defines branch thresholds and explicit player-facing readability fail conditions.

## 2026-06-10 Stage 0 Publication Prep Artifact Validation

- Flow: `Planning artifact validation for Stage 0 external publish unblock prep`
- Validation command:
  - `grep -nE "^# Stage 0 Media Bundle Specification|Required Shot List|Optional Clip List|Acceptance Checklist|Manual External Step" docs/planning/stage0-media-bundle-spec.md`
  - `grep -nE "^# itch.io Stage 0 Publish Runbook|Preflight Checklist|Publish Procedure|Post-Publish Validation|Manual External Step" docs/planning/itch-stage0-publish-runbook.md`
  - `grep -nE "Stage 0 media bundle specification|itch.io Stage 0 publish runbook" docs/README.md`
  - `grep -nE "T-0044|T-0045" docs/planning/task-backlog.md`
- Result: Pass
- Notes:
  - External Stage 0 blockers now have deterministic internal prep artifacts.
  - Remaining work is limited to manual capture and itch.io publication execution.

## 2026-06-10 Stage 0 Staging and Evidence Template Validation

- Flow: `Planning artifact validation for Stage 0 media handoff and evidence capture`
- Validation command:
  - `grep -nE "^# Stage 0 Media Staging Folder|Required Files|Validation Checklist" docs/release/stage0-media/README.md`
  - `grep -nE "^# Stage 0 Captions Pack|Screenshot Captions|Optional Clip Captions" docs/release/stage0-media/captions-stage0.md`
  - `grep -nE "^# Stage 0 Publication Evidence Template|Publication Metadata|Media Package Summary|Tracker Update Instructions" docs/tracking/stage0-publication-evidence-template.md`
  - `grep -nE "Stage 0 media staging folder|Stage 0 publication evidence template" docs/README.md`
- Result: Pass
- Notes:
  - Media staging path and caption pack are ready for operator capture workflow.
  - Publication evidence template now standardizes post-publish tracker closure steps.

## 2026-06-10 Stage 0 Audit and Closure Workflow Validation

- Flow: `Planning artifact validation for Stage 0 prepublish and postpublish workflow`
- Validation command:
  - `zsh docs/release/stage0-media/prepublish_audit.sh`
  - `grep -nE "^# Stage 0 Postpublish Closure Checklist|Closure Steps|Suggested Validation Commands|Completion Condition" docs/planning/stage0-postpublish-closure-checklist.md`
  - `grep -nE "Stage 0 media prepublish audit script|Stage 0 postpublish closure checklist" docs/README.md`
- Result: Pass
- Notes:
  - Prepublish audit script executes and reports readiness status without requiring strict-mode failure.
  - Postpublish closure checklist captures deterministic steps for closing the final two external tasks.
