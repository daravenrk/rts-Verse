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

## Reporting Template

- Date:
- Milestone:
- Build or commit reference:
- Flow executed:
- Result: Pass/Fail
- Notes:
- Follow-up issue/task:
