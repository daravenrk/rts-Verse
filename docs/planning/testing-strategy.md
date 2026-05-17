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

- Setup: Scenario enables progression checkpoints that represent Era 1 through Era 3 transitions.
- Steps:
  - Play opening with human-heavy roster and expansion pressure.
  - Trigger first augmentation threshold and unlock one ideology branch behavior.
  - Reach autonomous warfare threshold and field machine-dominant combat group.
  - Record transition cues, player decision points, and pace changes.
- Expected:
  - Era transitions are visible through units, structures, and economy behavior without external explanation.
  - Midgame ideology choices produce meaningful strategic divergence.
  - Late-game machine power increases combat scale but also increases operational burden.

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

## Reporting Template

- Date:
- Milestone:
- Build or commit reference:
- Flow executed:
- Result: Pass/Fail
- Notes:
- Follow-up issue/task:
