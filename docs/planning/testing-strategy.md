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

## Reporting Template

- Date:
- Milestone:
- Build or commit reference:
- Flow executed:
- Result: Pass/Fail
- Notes:
- Follow-up issue/task:
