# Implementation Plan

This is the active delivery plan. Keep phases small and testable.

## Objective

Define and deliver the first playable RTS vertical slice with reliable build and test flow.

## Scope Guardrails

- Prioritize playable core loop over feature breadth.
- Keep architecture decisions documented in the decision log.
- Tie every milestone to a validation method.

## Milestones

## M1 Project Foundations

- Status: In Progress
- Outcomes:
  - Documentation system is in place.
  - Development conventions are defined.
- Validation:
  - Smoke: Required tracking docs exist and are linked from docs index.

## M2 Core Gameplay Loop

- Status: Not Started
- Outcomes:
  - Unit selection and movement.
  - Basic resource gathering.
  - Win and loss conditions for a small map.
- Validation:
  - Functional: Manual playthrough confirms loop from start to finish.
  - Integration: Input, simulation, and UI flow work together without blocking issues.

## M3 Content and Balance Pass

- Status: Not Started
- Outcomes:
  - Starter factions and unit roster.
  - Baseline economy and combat tuning.
- Validation:
  - Functional: Controlled scenario checks expected combat and economy behavior.

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
