# Testing Strategy

This document defines validation layers for milestone delivery.

## Test Layers

- Functional:
  - Validate individual gameplay behaviors such as selection, movement, and gathering.
- Integration:
  - Validate system interactions across input, simulation, UI, and game state.
- Smoke:
  - Validate startup, scene load, and complete core loop execution.
- Observability:
  - Validate that logs and debug signals provide enough insight for failures.

## M2 Validation Scenario Matrix

| Flow | Purpose | Current Baseline Status | Evidence Source |
| --- | --- | --- | --- |
| F-01 | Unit selection baseline | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-02 | Movement command baseline | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-03 | Resource gather-return loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-04 | Win/loss HUD state transitions | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-18 | Keyboard and mouse command coverage | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-19 | Camera and HUD usability baseline | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-20 | Resource discovery and security loop baseline | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-21 | Opening clarity and parity gate | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-22 | Tether and build chain integrity | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-23 | Startup splash and menu gate | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-24 | Unit readability and animation baseline | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-25 | Campaign order and skirmish availability gate | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-26 | Environment readability and spawn consistency | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-28 | Day-night and biome readability contract | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-29 | Five-tier progression coverage mapping | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-30 | Named five-faction baseline coverage | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-31 | Stockpile and world-event UI telemetry coverage | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-32 | Live click-select and right-click move interaction loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-33 | Blocker/no-go rejection and invalid move feedback | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-34 | Startup to skirmish to duel-map end-to-end autoplay smoke | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-35 | Live gather command and deposit loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-36 | Live build menu and structure placement loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-37 | Live enemy-target attack and combat resolution loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-38 | Live production menu and structure-gated unit spawn loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-39 | Stockpile threshold-crossing and floor-clamp validation | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-40 | Bounded world-event trigger and application validation | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-41 | Infrastructure command disruption, mitigation, and recovery loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-42 | Infrastructure anti-stack ceiling and cooldown counterplay loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-43 | Infrastructure command decay timing and radius-degradation loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-44 | Infrastructure multi-domain disruption and mitigation ordering loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-45 | Stockpile and world-event failure triage rule enforcement loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-46 | Consolidated observability stress loop across F-40 through F-45 | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-47 | Observability replay consistency and signature stability loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-48 | Observability fault-injection guardrail and blocked-event telemetry loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-09 | Carrier and Airfield Sortie Lifecycle | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-10 | Colony and Civilian Resilience Loop | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-11 | Unified Stockpile and World Event Volatility | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-12 | Civilizational Era Transition Readability | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-13 | One Box Core and Distributed Network Resilience | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-14 | Descent Objective and Orbital Event Pressure | Pass | `docs/tracking/scenario-validation-notes.md` |
| F-15 | Dynamic Evolution Branch Emergence | Pass | `docs/tracking/scenario-validation-notes.md` |

## M2 Core Gameplay Validation Flows

## Flow F-01 Unit Selection

- Setup: Start gameplay scene with at least three controllable units.
- Steps:
  - Select single unit.
  - Drag or modifier-select multiple units.
- Expected:
  - Correct units are highlighted and command targets update accordingly.

## Flow F-02 Movement Command

- Setup: Units selected with walkable terrain available.
- Steps:
  - Issue move command to valid location.
  - Re-issue command to different location.
- Expected:
  - Units navigate and end near target points without stalling.

## Flow F-03 Resource Gather Loop

- Setup: Resource node and worker unit present.
- Steps:
  - Issue gather command.
  - Wait for gather-return cycle.
- Expected:
  - Resource inventory increases and worker returns to gather source.

## Flow F-04 Win and Loss Trigger

- Setup: Scenario with explicit victory and defeat conditions.
- Steps:
  - Trigger win condition in one run.
  - Trigger loss condition in second run.
- Expected:
  - Proper state transition and end-screen messaging occur in both runs.

## Flow F-05 Faction Asymmetry Readability

- Setup: One playable scenario per faction using only locked vertical-slice units.
- Steps:
  - Play Helion opening through first pressure window.
  - Play Obsidian opening through first defensive stabilization and counterpush window.
- Expected:
  - Helion feels faster and more timing-attack oriented.
  - Obsidian feels heavier and more attrition oriented.
  - Differences are visible without tooltips or design notes.

## Flow F-06 Tech Transition Validation

- Setup: Scenario economy supports movement from Tier 1 into one Tier 2 unlock path per faction.
- Steps:
  - Advance Helion into either War Foundry or Sky Anchor.
  - Advance Obsidian into either Siege Crucible or Aero Furnace.
- Expected:
  - Unlock conditions are understandable and achievable.
  - Tier transitions create new tactical options instead of only larger numbers.
  - No undefined units, structures, or upgrade dependencies block progression.

## Flow F-07 Spawn Fairness and Expansion Timing

- Setup: Duel map built to planning/map-standards.md with both factions tested from both spawns.
- Steps:
  - Play opening from spawn A and record scout time, natural expansion timing, and first contested node arrival.
  - Repeat from spawn B for both factions.
- Expected:
  - No spawn has a meaningful uncontestable opening advantage.
  - First natural expansion and first contested objective timings fall within the accepted parity band.

## Flow F-08 Economy Pressure and Resource Control

- Setup: Playable duel scenario with Alloy deposits, Power build zones, Data Node, and reclaim field enabled.
- Steps:
  - Play one single-base defensive line.
  - Play one expansion-first line.
  - Play one contested-node control line.
- Expected:
  - Single-base economy is survivable but strategically inferior over time.
  - Expansion and contested objective control create visible economic and tactical leverage.
  - No one resource path trivializes all others.

## Flow F-09 Carrier and Airfield Sortie Lifecycle

- Setup: Scenario includes one Carrier, one Airfield, Fighter production, and Corvette production.
- Steps:
  - Produce Fighters and Corvettes from Airfield.
  - Transfer at least one squadron to Carrier basing.
  - Launch sorties from Carrier and recover for rearm.
  - Destroy one home base type and verify the other can sustain operations.
  - Destroy both home base types and observe sortie tempo degradation until rebuild.
- Expected:
  - Fighters and Corvettes always require a valid home base (Carrier or Airfield).
  - Rearm and repair behavior is consistent and understandable.
  - Loss of all home bases visibly reduces sustained air pressure.
  - Rebuilding a valid home base restores sortie cadence.

## Flow F-10 Colony and Civilian Resilience Loop

- Setup: Scenario includes Habitat Complex, Logistics Hub, Militia Barracks, and at least one civilian convoy route.
- Steps:
  - Establish initial colony throughput with Colony Worker and Cargo Hauler activity.
  - Harass one logistics route and observe economy impact.
  - Defend colony using Security Militia Squad and Patrol Buggy.
  - Escalate with Security Command Post and Peacekeeper Walker.
  - Restore disrupted economy and confirm civilian systems recover after defense stabilizes.
- Expected:
  - Civilian systems provide measurable economic value while vulnerable to raids.
  - Militia can buy time and protect infrastructure but does not outperform frontline military units in open battle.
  - Logistics disruption creates temporary strategic pressure rather than permanent unrecoverable collapse.
  - Colony recovery is possible with correct rebuilding and escort play.

## Flow F-11 Unified Stockpile and World Event Volatility

- Setup: Scenario includes shared global stockpiles for Alloy, Power, Data, and Reclaim with world events enabled.
- Steps:
  - Run one match segment with stable extraction and no major map swings.
  - Trigger at least one negative event and one positive event affecting different resources.
  - Observe extraction and production behavior during low-stock and recovery phases.
  - Repeat from both player perspectives to verify shared visibility and fairness.
- Expected:
  - Global stockpile changes are visible to all players in real time.
  - Extraction throughput responds correctly to stockpile scarcity and replenishment.
  - Event volatility changes strategic priorities without hard-locking match progression.
  - Recovery paths remain available through map control, timing, and adaptation.

## Flow F-12 Civilizational Era Transition Readability

- Setup: Scenario enables progression checkpoints for Survival, Augmented, Autonomous, and Network warfare phases.
- Steps:
  - Play opening with human-heavy roster and expansion pressure through Survival phase.
  - Trigger Augmented transition and unlock one branch-choice behavior.
  - Reach Autonomous transition and field one automation-heavy combat group.
  - Reach Network transition and validate one distributed resilience or disruption behavior.
  - Record transition cues, player decision points, and pacing against era target bands.
- Expected:
  - Era transitions are visible through units, structures, and economy behavior without external explanation.
  - Augmented and Autonomous transitions produce meaningful strategic divergence with readable trigger cues.
  - Network phase introduces higher systemic pressure without collapsing readability.
  - Transition timing remains within documented target bands or logs a guardrail exception.

## Flow F-13 One Box Core and Distributed Network Resilience

- Setup: Scenario includes original core, relay nodes, and at least one backup command shard path.
- Steps:
  - Expand network control through relay and shard infrastructure.
  - Disable original core and observe command-side penalties.
  - Recover through distributed infrastructure and confirm partial stabilization.
  - Collapse network relays and confirm compounded degradation.
- Expected:
  - Original core loss causes severe but non-terminal coordination penalties.
  - Distributed infrastructure provides measurable resilience and recovery options.
  - Network collapse outcomes are strategic and readable, not purely random failure events.

## Flow F-14 Descent Objective and Orbital Event Pressure

- Setup: Scenario includes The Descent anchor, access nodes, orbital traffic corridors, and at least two Descent-linked world-event categories.
- Steps:
  - Contest one Descent access node from both player perspectives.
  - Trigger one logistics-disruptive event and one economy-opportunity event from the Descent system.
  - Measure extraction, routing, and combat posture changes during event windows.
- Expected:
  - Descent objectives are strategically valuable and visibly contested.
  - Event pressure changes map priorities without creating unavoidable collapse states.
  - Descent-linked opportunities reward timing and map control rather than passive waiting.
  - Access-node control, corridor state behavior, and event cadence align with planning/descent-systems-baseline.md.

## Flow F-15 Dynamic Evolution Branch Emergence

- Setup: All players begin in shared human-survival opening conditions with branch unlocks enabled.
- Steps:
  - Execute one machine-integration line, one alien-integration line, and one hybrid line across repeat runs.
  - Record divergence timing, required commitments, and branch-defining capabilities.
  - Validate branch counterplay from a non-matching doctrine in each run.
- Expected:
  - Branch identity emerges from gameplay decisions rather than pre-match labels.
  - Machine, alien, and hybrid branches each create distinct advantages and liabilities.
  - No branch produces deterministic victory with equal execution quality.
  - Branch progression and readability behavior align with planning/dynamic-evolution-and-readability-baseline.md.

## Flow F-16 Human vs Alien MVP Combat Completeness

- Setup: Scenario uses Helion Directorate and Veyari Ascendancy with MVP duel roster lock enabled.
- Steps:
  - Execute one full opening cycle for each faction from first builder to first T1 armor.
  - Field each required roster-lock unit in a controlled engagement.
  - Trigger one T2 transition option for each faction and validate no dependency deadlocks.
- Expected:
  - Both factions can complete their documented production chain without undefined content.
  - Human and alien combat identities are readable by Tier 1.
  - Both factions retain viable paths to recover after one failed engagement.

## Flow F-17 Map-Aware Tactical Combat Intelligence

- Setup: Duel map includes one direct lane, one flank lane, one chokepoint, and one contested Data Node.
- Steps:
  - Run one pressure plan through direct lane and one through flank lane for each faction.
  - Validate cover and chokepoint response: infantry groups should seek cover while siege units maintain protected firing lines.
  - Validate objective behavior: both factions must contest Data Node timing rather than remain static in home area.
  - Validate disengage and regroup logic after frontline collapse.
- Expected:
  - Armies choose context-appropriate routes and do not repeatedly path into obvious kill zones.
  - Faction behavior responds to terrain and objective pressure instead of only nearest-target attack logic.
  - Retreat and regroup behavior preserves strategic counterplay and reduces all-in collapse frequency.

## Flow F-18 Keyboard and Mouse Command Coverage

- Setup: Scenario loads with default controls profile from planning/controls-standards.md.
- Steps:
  - Execute selection suite: single, box, additive, subtractive, and same-type double-select.
  - Execute command suite: move, attack, attack-move, gather, repair, patrol, hold, stop.
  - Execute control groups: assign, recall, and double-tap camera center behavior.
  - Execute production grid inputs and queue behavior with shift modifiers.
- Expected:
  - All documented actions are reachable through keyboard and mouse without fallback debug commands.
  - Command acknowledgments are immediate and consistent.
  - Invalid commands return clear reasons without silent failures.

## Flow F-19 Camera and HUD Usability Validation

- Setup: MVP duel scenario with minimap, resource HUD, command card, and alert states enabled.
- Steps:
  - Validate camera pan, zoom, center-on-selection, and base-focus controls.
  - Trigger resource shortage, objective contest, and Descent event warnings.
  - Verify command card state updates for selected units and structure production queues.
  - Toggle optional controls (edge scroll and sensitivity settings) and confirm persistence.
- Expected:
  - Camera controls remain responsive and predictable across all map sectors.
  - HUD alerts are visible, timely, and non-blocking.
  - UI state always matches gameplay state for selected entity commands and queue progress.

## Flow F-20 Resource Discovery and Security Dominance Loop

- Setup: Duel map with safe home resource, natural expansion, contested midfield resource points, and at least one Data Node.
- Steps:
  - Execute one scouting-first opening focused on locating priority resource zones.
  - Secure one expansion and one contested objective while maintaining defense coverage.
  - Execute one denial cycle: raid enemy extraction or logistics and force a recapture response.
  - Validate recovery path by reclaiming or retaking one lost resource zone.
- Expected:
  - Players can discover and prioritize resource opportunities early without hidden information dependencies.
  - Securing and defending resources produces clear strategic leverage over passive turtling.
  - Resource denial and recapture create comeback windows without immediate match collapse.
  - Match outcomes correlate with sustained resource security and disruption quality, not only raw unit trades.

## Flow F-21 Opening Clarity and Parity Gate

- Setup: MVP duel scenario starts with opening resource set and advanced civilization systems gated.
- Steps:

## Flow F-28 Structure Readability Under Day-Night and Biome Variants

- Setup: Use declared biome archetype parameters, shared MVP building classes, and day-night cycle contract from planning/world-systems-baseline.md.
- Steps:
  - Validate material-zone visibility for all shared MVP structures in day and night phases.
  - Validate faction accent readability and damage-state readability during dusk-night and night-dawn transitions.
  - Validate plant-life and terrain vocabulary overlays in one desolate and one fertile biome configuration.
  - Validate world-source resource markers remain readable while preserving lane and objective clarity.
- Expected:
  - Structures remain role-identifiable and faction-distinguishable across all day-night phases.
  - Damage states are readable without relying on UI-only indicators.
  - Biome and plant-life variation affects tactical decisions without obscuring small 3D actor readability.
  - Resource-source presentation aligns with world-economy mapping and does not contradict global stockpile rules.
  - Play first 10 to 15 minutes with both factions from both spawns.
  - Verify players can execute expansion, scouting, harassment, and first factory scaling without interacting with advanced instability systems.
  - Trigger one phase transition and confirm newly unlocked complexity is announced and readable.
  - Compare opening tempo parity metrics between factions.
- Expected:
  - Opening actions are strategically deep but cognitively manageable.
  - Factions remain competitively viable in opening windows despite identity differences.
  - Advanced systems emerge through clear progression triggers rather than immediate simulation load.
  - Transition into deeper systems increases strategic options without invalidating prior play.

## Flow F-22 Tether Point and Buildable Chain Integrity

- Setup: MVP duel scenario with faction-specific Tether Point structures and full T0 to T1 build options enabled.
- Steps:
  - Start match from both spawns and verify Tether Point auto-creation and ownership assignment.
  - Build opening chain from Tether Point unlocks: Power Core, Alloy Extractor, and Barracks-equivalent.
  - Progress into T1 and build Vehicle Structure plus Sensor or Uplink Structure.
  - Destroy Tether Point in controlled scenario and confirm command penalties activate.
  - Establish secondary command-capable structure and verify recovery-state transition.
- Expected:
  - Every faction can complete required MVP buildables without missing dependency links.
  - Tether Point consistently controls opening build radius and production responsibilities.
  - Tether Point destruction creates severe but non-terminal command impact when recovery conditions are met.
  - Recovery transitions are logged and readable in observability outputs.

## Flow F-23 Startup Splash and Main Menu Gate

- Setup: Project launch target is scenes/core/Main.tscn with splash and main menu scenes wired.
- Steps:
  - Cold launch and verify splash appears first.
  - Press one key before 5 seconds and verify immediate transition to main menu.
  - Relaunch, provide no input, and verify transition occurs at 5-second timeout.
  - Verify main menu shows Skirmish enabled.
  - Verify Campaign is visible, disabled, and labeled Coming Soon.
- Expected:
  - Startup order is deterministic: splash always precedes main menu.
  - Both transition paths (key press and timeout) reach identical main-menu state.
  - Disabled Campaign option cannot be activated by keyboard or mouse.
  - Observability logs include splash start, transition trigger reason, and menu state payload.

## Flow F-24 Small-Scale 3D Readability and Animation Subspace Compliance

- Setup: MVP duel scenario with default RTS camera settings and all roster-lock units spawnable.
- Steps:
  - Use the mapping table in planning/unit-list.md (MVP Per-Unit Animation Mapping) as source-of-truth state expectations.
  - Spawn each MVP playable unit class and verify small-scale 3D readability at default zoom.
  - Verify baseline state coverage per unit: Idle, Move, Primary Action, Hit or Reaction, Death or Disable.
  - Trigger one combat interaction and one non-combat interaction per relevant role.
  - Rotate and zoom camera through standard ranges and verify intent remains readable.
- Expected:
  - Unit silhouettes remain distinguishable as small 3D objects in normal gameplay camera conditions.
  - No MVP playable unit is missing required animation baseline states.
  - Animation intent remains readable without requiring close-up camera framing.
  - Any optional states (ability, deploy, takeoff or land) are used consistently by role and never replace required baseline states.

## Flow F-25 Campaign Perspective Order and Skirmish Availability Gate

- Setup: Main menu, skirmish faction selection UI, and campaign arc data source are present in build.
- Steps:
  - Open skirmish mode and inspect faction selection list.
  - Verify all currently available factions are selectable.
  - Verify unavailable factions are visible but disabled with Coming Soon labeling.
  - Inspect campaign mission-order data and confirm first perspective block is Veyari.
  - Confirm final perspective block is Helion.
- Expected:
  - Skirmish mode selection accurately reflects current faction availability with no false-enabled unavailable factions.
  - MVP build exposes Helion and Veyari as available skirmish choices.
  - Campaign ordering definition is unambiguous and consistent with Veyari-first, Helion-last direction.
  - Menu and campaign data states remain synchronized with current documented scope.

## Flow F-26 Environment Type Readability

- Setup: Duel or skirmish scenario has a declared primary environment type from planning/map-standards.md.
- Steps:
  - Record the selected primary environment type and any secondary type.
  - Validate lane readability, objective pressure pattern, and blocker clarity against the declared environment rules.
  - Confirm Tether Point for each faction spawns at the map-designated base spawn position regardless of faction.
  - Play first engagement window and confirm environment geometry produces contestable fights rather than one-route collapse.
- Expected:
  - Environment identity is visible in the first minute of play.
  - Map geometry reinforces intended fight type without obscuring path choices.
  - Tether Points spawn at map-defined positions consistently for all factions.
  - Map layout is reusable across different faction matchups without layout changes.

## Flow F-27 Deterministic Simulation Constraints Compliance

- Setup: Project includes deterministic-constraint rules from planning/conventions.md and startup observability payload logging.
- Steps:
  - Run startup timeout path with fixed FPS and capture startup payload log output.
  - Run startup keypress path with fixed FPS and `--startup-test-keypress` flag and capture startup payload log output.
  - Verify both runs emit deterministic payload fields for transition reason, timestamp, and menu availability flags.
  - Verify campaign remains disabled and Skirmish remains enabled in both payloads.
- Expected:
  - State transition path is deterministic and reproducible by command.
  - Payload structure remains stable between runs while transition reason changes appropriately.
  - Startup/menu observability is sufficient to triage gate regressions without interactive reproduction.

## Flow F-29 Five-Tier Progression Coverage Mapping

- Setup: Five-tier mapping artifact and core planning docs are present.
- Steps:
  - Validate each named faction has T0 through T4 planning coverage entries in the five-tier mapping artifact.
  - Validate unit-tier and structure-tier mappings both include explicit planned markers where implementation is pending.
  - Validate mapping aligns with tech-tree and unit-list naming for MVP and planned factions.
  - Validate tracker and backlog references include five-tier coverage closure evidence.
- Expected:
  - All five factions have explicit five-tier progression coverage definitions.
  - No tier is left undefined for units or structures at planning scope.
  - MVP implemented content and planned content are clearly separated.
  - Coverage evidence is traceable in scenario-validation notes and task backlog.

## Flow F-30 Named Five-Faction Baseline Coverage

- Setup: Named faction baseline is documented in game vision, unit list, and tech-tree planning docs.
- Steps:
  - Validate all three planning baselines use the same five named factions.
  - Validate third human, alien, and robot factions include identity notes and forward roster direction.
  - Validate robot planning constraints remain non-humanoid and structurally distinct.
  - Validate next-steps and change-log reflect closure of five-faction coverage updates.
- Expected:
  - Faction naming is consistent across all planning baselines.
  - Five-faction coverage requirements are explicit and audit-friendly.
  - Robot faction asymmetry constraints remain explicit and preserved.
  - Closure evidence exists in scenario-validation notes and planning trackers.

## Flow F-31 Stockpile and World-Event UI Telemetry Coverage

- Setup: Global stockpile cap model, bounded event table, and stockpile-event UI telemetry checklist artifact are present.
- Steps:
  - Validate checklist includes UI requirements for reserve or cap visibility, threshold warnings, and event banners.
  - Validate checklist includes telemetry payload requirements for trigger, apply, clamp or block, and UI acknowledgement states.
  - Validate checklist includes deterministic ordering and failure-triage rules.
  - Validate planning trackers reference this flow and related checklist artifact.
- Expected:
  - UI and telemetry requirements are explicit and testable for stockpile and event systems.
  - Event observability coverage is complete enough to triage magnitude, ordering, and display defects.
  - Threshold visibility rules are clear for both soft and hard depletion states.
  - Validation evidence is captured in scenario-validation notes and backlog references.

## Reporting Template

- Date:
- Milestone:
- Build or commit reference:
- Flow executed:
- Result: Pass/Fail
- Notes:
- Follow-up issue/task:
