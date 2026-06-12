# Scenario Validation Notes

Track scenario-level evidence for map and flow validation runs.

## 2026-06-11 F-50 Observability Reconstruction Integrity Validation

- Flow: `F-50 Observability reconstruction integrity from archive plus live telemetry windows`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation commands:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f50-observability-recon`
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-map-baseline --duel-test-f48-observability-fault --duel-test-f49-observability-retention --duel-test-f50-observability-recon`
- Result: Pass
- Notes:
  - Reconstruction over archive plus live telemetry preserved sequence monotonicity and uniqueness for authoritative sequence-bearing entries.
  - Mixed payload survivability checks passed for triggered, applied, and blocked world-event telemetry under churn.
  - Reconstructed recent-window text matched the HUD feed rendering exactly.
  - Focused integrated smoke retained pass summaries for MapBaseline, F-48, F-49, and F-50.

## 2026-06-11 F-49 Observability Retention-Rotation and Sequence-Index Consistency Validation

- Flow: `F-49 Observability retention-rotation and sequence-index consistency loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation commands:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f49-observability-retention`
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-map-baseline --duel-test-f47-observability-replay --duel-test-f48-observability-fault --duel-test-f49-observability-retention`
- Result: Pass
- Notes:
  - Retention churn preserved live feed cap and produced expected archive growth.
  - Sequence-index parsing across archive plus live logs remained monotonic for authoritative telemetry entries.
  - Mixed payload retention checks confirmed world-event trigger and apply telemetry survived overflow rotation.
  - Focused integrated smoke retained pass summaries for MapBaseline, F-47, F-48, and F-49.

## 2026-06-11 F-48 Observability Fault-Injection Guardrail Validation

- Flow: `F-48 Observability fault-injection guardrail and blocked-event telemetry loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation commands:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f48-observability-fault`
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-map-baseline --duel-test-f46-observability-stress --duel-test-f47-observability-replay --duel-test-f48-observability-fault`
- Result: Pass
- Notes:
  - Invalid injected event (`id=X-999`, unknown resource) was rejected and emitted blocked-event telemetry with guardrail reason.
  - Duplicate same-domain event rejection preserved reserve state and emitted blocked-event telemetry for the second attempt.
  - Focused integrated smoke retained pass summaries for MapBaseline, F-46, F-47, and F-48.

## 2026-06-11 F-47 Observability Replay Consistency Validation

- Flow: `F-47 Observability replay consistency and signature stability loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation commands:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f47-observability-replay`
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-map-baseline --duel-test-f45-event-triage --duel-test-f46-observability-stress --duel-test-f47-observability-replay`
- Result: Pass
- Notes:
  - Two equivalent replay sequences produced matching normalized observability signatures.
  - Signature comparison ignored volatile fields (sequence numbers and replay-specific setup tags) while preserving signal semantics.
  - Focused integrated smoke retained pass summaries for MapBaseline, F-45, F-46, and F-47.

## 2026-06-11 F-46 Consolidated Observability Stress Validation

- Flow: `F-46 Consolidated observability stress loop across F-40 through F-45`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation commands:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f46-observability-stress`
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-map-baseline --duel-test-f40-world-events --duel-test-f41-infra-disruption --duel-test-f42-infra-antistack --duel-test-f43-infra-decay --duel-test-f44-infra-multidomain --duel-test-f45-event-triage --duel-test-f46-observability-stress`
- Result: Pass
- Notes:
  - Standalone F-46 run passed all representative observability checks in one deterministic summary.
  - Integrated smoke run preserved pass results for MapBaseline, F-40, F-41, F-42, F-43, F-44, F-45, and F-46.
  - Stress path confirmed no cross-hook regressions in event payload, infrastructure telemetry, or triage signal surfaces.

## 2026-06-11 F-45 Stockpile and World-Event Failure Triage Rule Enforcement

- Flow: `F-45 Stockpile and world-event failure triage rule enforcement loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f45-event-triage`
- Result: Pass
- Notes:
  - `world_event_triggered` and `world_event_applied` payloads were both required and observed during forced event application.
  - Applied event delta matched the HUD alert magnitude rendering.
  - Threshold crossing produced both threshold-state transition and alert-state change (no silent crossing).
  - Feed retention overflow emitted explicit archive telemetry and preserved archived-message traceability.

## 2026-06-11 F-44 Infrastructure Multi-Domain Disruption and Mitigation Ordering Validation

- Flow: `F-44 Infrastructure multi-domain disruption and mitigation ordering loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f44-infra-multidomain`
- Result: Pass
- Notes:
  - Timeline alternated command and logistics disruptions in deterministic step order.
  - Command and logistics degradation checks both crossed minimum verification thresholds.
  - Mitigation steps executed in required sequence (`relay_reprioritize` then `freight_reroute`).
  - Combined pressure metric decreased after mitigation, confirming cross-domain recovery progress.

## 2026-06-11 F-43 Infrastructure Command Decay and Radius Degradation Validation

- Flow: `F-43 Infrastructure command decay timing and radius-degradation loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f43-infra-decay`
- Result: Pass
- Notes:
  - Latency and radius profiles remained monotonic by disruption intensity.
  - Sustained severity reached degraded command radius while preserving minimum-action guarantee (`actions_remaining=1`).
  - Distributed relay mitigation reduced effective severity and improved radius plus latency values.
  - Recovery timeline advanced through deterministic decay windows (`18s`, `12s`, `8s`) before returning to stable state.

## 2026-06-11 F-42 Infrastructure Anti-Stack and Cooldown Counterplay Validation

- Flow: `F-42 Infrastructure anti-stack ceiling and cooldown counterplay loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f42-infra-antistack`
- Result: Pass
- Notes:
  - Overlap anti-stack cap prevented additive severity spike (`raw_overlap=4`, `capped_severity=3`).
  - Impact ceiling remained bounded (`ratio=0.18`, ceiling threshold `<=0.20`).
  - Cooldown retry was rejected while cooldown remained active.
  - Counterplay window and two defensive responses were emitted and remained readable in telemetry.

## 2026-06-11 F-41 Infrastructure Command Disruption Runtime Validation

- Flow: `F-41 Infrastructure command disruption, mitigation, and recovery loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f41-infra-disruption`
- Result: Pass
- Notes:
  - Superweapon lifecycle telemetry emitted in deterministic order: charging, armed, fired, cooldown.
  - Disruption payloads emitted for attacker and defender perspectives with command-domain severity peak.
  - Mitigation actions reduced command penalty severity before recovery window closure.
  - Recovery reached stable state with no hard-lock, preserving minimum-action guarantee (`actions_remaining=1` at peak).

## 2026-06-11 F-28 Day-Night and Biome Readability Contract

- Flow: `F-28 Structure Readability Under Day-Night and Biome Variants`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f28-visual`
- Result: Pass
- Notes:
  - LS-01 passed: Helion and Veyari faction colors remained distinct under simulated night multiplier (`faction_delta=0.60`).
  - LS-02 passed: damaged vs. critical visibility delta remained above floor.
  - LS-03 passed: small-footprint structure identifiers are present in runtime buildable definitions.
  - LS-04 passed: phase energy transitions remained within bounded jump threshold (`max_jump=0.40`).

## 2026-06-11 M3 Runtime Gap Discovery and Lane Activation

- Flow: `M3 runtime readiness diagnostics for stockpile and world-event systems`
- Validation commands:
  - `grep -RIn "stockpile\|world event\|superweapon\|descent\|evolution\|maintenance\|instability\|autonomous\|network warfare\|threshold" scripts scenes | head -n 200`
  - `grep -RIn "TODO\|FIXME\|TBD" scripts scenes docs | head -n 200`
- Result: Fail (runtime systems not yet implemented)
- Notes:
  - No runtime keyword matches were found under `scripts/` or `scenes/` for stockpile or world-event features.
  - No source TODO markers were found to indicate partially implemented stockpile or event code paths.
  - M3 stockpile and world-event runtime work is confirmed as the next unblocked internal development lane.

## 2026-06-11 M3 Runtime Insertion Mapping for T-0067 Through T-0071

- Flow: `code-anchor diagnostics for stockpile runtime implementation`
- Validation command:
  - `grep -n "var _resource_alloy_total\|func _update_hud\|func _update_gather_jobs\|func _process(delta\|func _run_f20_f21_test_hook\|_hud_resource_bar.text = \"Alloy" scripts/core/FirstDuelMap.gd`
- Result: Pass
- Notes:
  - Confirmed anchor lines for state replacement and hook insertion in `FirstDuelMap.gd`.
  - Created planning/m3-stockpile-runtime-spec.md using these anchors to define deterministic implementation order and validation commands.

## 2026-06-11 F-03/F-04 Stockpile Runtime Refactor Validation

- Flow: `F-03 Resource Gather Loop` + `F-04 Win and Loss Trigger`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f03 --duel-test-f04`
- Result: Pass
- Notes:
  - Stockpile state initialized for Alloy, Power, Data, and Reclaim at map startup.
  - Gather deposits now route through stockpile helper state instead of a standalone alloy counter.
  - HUD summary now renders reserve and cap values for all four resources.
  - F-03 still reaches `alloy_total=70` and F-04 still reports passing win/loss state transitions.

## 2026-06-11 F-39/F-40 Stockpile Threshold and World-Event Validation

- Flow: `F-39 Stockpile threshold and clamp validation` + `F-40 Bounded world-event application validation`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation commands:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f39-stockpile`
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f40-world-events`
- Result: Pass
- Notes:
  - F-39 confirmed soft threshold, hard threshold, and floor-clamp behavior for Alloy with deterministic state transitions.
  - F-40 confirmed bounded positive and negative world-event application for Salvage Rush and Refinery Chain Disruption.
  - Event telemetry logs emitted triggered, applied, and UI-facing messages with deterministic sequence ids.
  - Startup now emits an initial stockpile snapshot and HUD feed retains the latest event log entries for observability.

## 2026-06-11 F-40 Telemetry Polish Validation

- Flow: `F-40 Bounded world-event application validation with HUD polish`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f40-world-events`
- Result: Pass
- Notes:
  - Stockpile HUD tooltip now reports depletion multipliers and current phase.
  - Alert coloring uses readable contrast branches for soft/hard threshold states and positive/negative world-event acknowledgements.
  - Telemetry payloads continue to include deterministic phase tags and sequence ids.

## 2026-06-11 Stage 0 External Closure Preflight (Objective Pickup)

- Flow: `Stage 0 media and publication closure preflight`
- Validation commands:
  - `zsh docs/release/stage0-media/stage0_status_report.sh`
  - `zsh docs/release/stage0-media/prepublish_audit.sh`
- Result: Fail (expected while external media capture is incomplete)
- Notes:
  - Status and audit both returned `NOT READY`.
  - Screenshot inventory reported `0` with required count policy `3 to 6`.
  - Missing required screenshot files:
    - `stage0-shot-01-opening-expansion.png`
    - `stage0-shot-02-contested-objective.png`
    - `stage0-shot-03-faction-asymmetry.png`
  - Re-entry gate remains unchanged: capture required screenshots, stage them in `docs/release/stage0-media/`, then rerun prepublish audit.

## 2026-06-10 F-38 Live Production Menu and Unit Spawn Loop

- Flow: `F-38 Live production menu and structure-gated unit spawn loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f38-production`
- Result: Pass
- Notes:
  - Production chain prerequisites were satisfied for slot `A`.
  - Live production spawned infantry `lancer_squad` and vehicle `strider_bike` via runtime production commands.
  - Summary emitted `infantry_pass=true`, `vehicle_pass=true`, and overall `pass=true`.

## 2026-06-10 F-37 Live Attack Command and Combat Resolution Loop

- Flow: `F-37 Live enemy-target attack and combat resolution loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f37-combat`
- Result: Pass
- Notes:
  - Right-click enemy-target attack command was issued by selected player unit `Squad_A_00`.
  - Deterministic damage ticks reduced target `Squad_B_00` health from `100.0` to `0.0`.
  - Target destruction completed without script errors and summary emitted `damage_pass=true`.

## 2026-06-10 F-36 Live Build Menu and Structure Placement Loop

- Flow: `F-36 Live build menu and structure placement loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f36-build`
- Result: Pass
- Notes:
  - Selected live builder opened build flow and chose `power_core`.
  - Placement on valid ground succeeded and spawned buildable node `BLD-A-001`.
  - Slot build state tracked `power_core` successfully (`has_power_core=true`).

## 2026-06-10 F-35 Live Gather Command and Deposit Loop

- Flow: `F-35 Live gather command and deposit loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f35-gather`
- Result: Pass
- Notes:
  - Live gather command was issued to `SAFE-ALLOY-A` for `Squad_A_00`.
  - Unit reached resource, transitioned to dropoff, and deposited `35` alloy.
  - Summary emitted `alloy_total=35` and `pass=true`.

## 2026-06-10 F-34 Startup to Duel-Map End-to-End Smoke (Autoplay)

- Flow: `F-34 Startup to skirmish to duel-map end-to-end autoplay smoke`
- Scenario: `project startup (Main) -> Skirmish -> FirstDuelMap`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . -- --startup-test-auto-skirmish --skirmish-test-auto-start --duel-test-f32-interaction --duel-test-f03 --duel-test-auto-exit`
- Result: Pass
- Notes:
  - Startup checklist reached gameplay transition done state.
  - Skirmish auto-start selected available factions and entered duel map.
  - Interaction validation passed (`[F32] select_pass=true move_pass=true`).
  - Gather loop passed with positive resource updates (`[F03] alloy_total=70 pass=true`).
  - Duel-map auto-exit hook executed after validations.

## 2026-06-10 F-32 Live Interaction Loop

- Flow: `F-32 Live click-select and right-click move interaction loop`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f32-interaction`
- Result: Pass
- Notes:
  - Left-click camera-ray selection selected a live squad unit.
  - Right-click world-space command issued movement successfully.
  - Summary emitted `select_pass=true` and `move_pass=true`.

## 2026-06-10 F-33 Blocker and Invalid Move Rejection

- Flow: `F-33 Blocker/no-go rejection and invalid move feedback`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f33-blocker`
- Result: Pass
- Notes:
  - Blocked target inside no-go zone was rejected.
  - Selected unit remained idle (`still_idle=true`).
  - HUD rejection alert feedback emitted (`alert_ok=true`).

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

## 2026-06-11 Primitive Visual Kit Integration Validation

- Flow: `F-24 Small-Scale 3D Readability and Animation Subspace Compliance` after shared primitive kit wiring
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f24`
- Result: Pass
- Notes:
  - SelectableUnit2D now renders a multi-part primitive silhouette with shared faction materials.
  - BuildableNode now renders a tiered foundation, crown, and output-facing accent panel from the shared kit.
  - TetherPoint now renders a shared cylinder/tower/cap silhouette with faction-tinted emissive layers.

## 2026-06-11 F-09 Carrier and Airfield Sortie Lifecycle

- Flow: `F-09 Carrier and Airfield Sortie Lifecycle`
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --quit --path . res://scenes/core/FirstDuelMap.tscn -- --duel-test-f09-air-wing`
- Result: Pass
- Notes:
  - Fighters and Corvettes each produced with airfield as initial home base (AW-01, AW-02 pass).
  - Fighter transferred to carrier without state loss (AW-03 pass).
  - Sortie launched from carrier and recovered with rearm-complete state (AW-04 pass).
  - Carrier destroyed; fighter fell back to airfield automatically (AW-05 pass).
  - Airfield destroyed; both units degraded to cadence 0.30 (AW-06, AW-07 pass).
  - Airfield rebuilt; both units recovered to ready state at normal cadence (AW-08 pass).
  - Fighter role confirmed air_superiority, Corvette confirmed strike — roles remain distinct (AW-09 pass).

## 2026-06-11 Map Item Primitive Marker Validation

- Flow: `F-24 Small-Scale 3D Readability and Animation Subspace Compliance` after map-item marker integration
- Scenario: `scenes/core/FirstDuelMap.tscn`
- Validation command:
  - `/Applications/Godot.app/Contents/MacOS/godot --headless --path . res://scenes/core/FirstDuelMap.tscn --quit-after 1 -- --duel-test-f24`
- Result: Pass
- Notes:
  - MapItem now renders lane-colored primitive markers for zone annotations, spawn markers, resource nodes, cover, chokepoints, elevated positions, LOS blockers, and relay towers.
  - The duel-map readability pass still reports `pass_units=12` and `total_units=12` with no new parser or scene-load regressions.

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

## 2026-06-10 Stage 0 Status Report Utility Validation

- Flow: `Planning artifact validation for Stage 0 status utility`
- Validation command:
  - `zsh docs/release/stage0-media/stage0_status_report.sh`
  - `grep -nE "Stage 0 status report utility" docs/README.md`
- Result: Pass
- Notes:
  - Status report utility executes prepublish media audit and unresolved next-steps check in one command.
  - Output confirms blocker state remains external until media capture and manual publication are completed.

## 2026-06-10 Parked Objective Tracker Synchronization Validation

- Flow: `Planning tracker validation for parked external Stage 0 objectives`
- Validation command:
  - `grep -nE "Objective 3: Stage 0 External Publication Closure|objective_id: O-3001|objective_id: O-3002|reentry_condition" AGENT_PLAN.md`
  - `grep -nE "Stage 0 Publication Closure Lane|objective_id: O-3001|objective_id: O-3002|Closure Utilities" DEV_NEXT_STEPS.md`
- Result: Pass
- Notes:
  - AGENT_PLAN and DEV_NEXT_STEPS now explicitly track external Stage 0 objectives as parked.
  - Re-entry conditions and command aids are documented for deterministic continuation after manual actions.
