# Implementation Plan

This is the active delivery plan. Keep phases small and testable.

## Objective

Define and deliver the first playable RTS vertical slice expressing daravenrk's Command and Conquer meets Total Annihilation identity with reliable build and test flow.

## Scope Guardrails

- Prioritize playable core loop over feature breadth.
- Keep architecture decisions documented in the decision log.
- Tie every milestone to a validation method.

## Milestones

## M1 Project Foundations

- Status: Complete
- Outcomes:
  - Documentation system is in place.
  - Development conventions are defined.
  - Delivery-quality artifacts are defined: backlog, testing strategy, and definition of done.
- Validation:
  - Smoke: Required tracking docs exist and are linked from docs index.
  - Functional: Conventions and test-flow templates are available for contributor use.

## M2 Core Gameplay Loop

- Status: Not Started
- Outcomes:
  - Unit selection and movement.
  - Basic resource gathering.
  - Win and loss conditions for a small map.
  - First pass of asymmetry between two prototype factions.
  - Prototype base expansion pressure loop.
  - Vertical-slice roster lock implemented from planning/unit-list.md.
  - First duel map built to planning/map-standards.md baseline.
- Validation:
  - Functional: Manual playthrough confirms loop from start to finish.
  - Integration: Input, simulation, and UI flow work together without blocking issues.

## M3 Content and Balance Pass

- Status: Not Started
- Outcomes:
  - Starter factions and unit roster.
  - Any-faction core roster baseline applied to new faction concepts, including Carrier plus Fighter and Corvette air-wing roles.
  - Baseline economy and combat tuning.
  - Tier 2 progression paths validated against planning/tech-tree.md.
  - Numeric price sheet aligned to planning/economy-standards.md.
- Validation:
  - Functional: Controlled scenario checks expected combat and economy behavior.
  - Integration: Air production, basing, launch, and recovery behave consistently between Carrier and Airfield contexts.

## M4 Packaging and Readiness

- Status: Not Started
- Outcomes:
  - Export profile configuration.
  - Release checklist and known issue list.
- Validation:
  - Smoke: Exported build launches and core loop works end-to-end.

## Dependencies and Risks

- See tracking/risk-register.md for active risks.
- See tracking/assumptions.md for assumptions that can affect scope.

## Working Artifacts

- Conventions: planning/conventions.md
- Game vision: planning/game-vision.md
- Tech tree: planning/tech-tree.md
- Unit list: planning/unit-list.md
- Map standards: planning/map-standards.md
- Economy standards: planning/economy-standards.md
- Task backlog: planning/task-backlog.md
- Testing strategy: planning/testing-strategy.md
- Definition of done: planning/definition-of-done.md
