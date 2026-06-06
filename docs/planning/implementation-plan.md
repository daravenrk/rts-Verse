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
  - Default startup scene baseline implemented (Main.tscn) and wired as project main scene.
  - Unit selection and movement.
  - Basic resource gathering.
  - Win and loss conditions for a small map.
  - First pass of asymmetry between two prototype factions.
  - Keyboard and mouse control baseline implemented from planning/controls-standards.md.
  - MVP HUD implemented with command card, minimap, resource bars, and alert states.
  - MVP faction pair lock: complete Human Helion and complete Alien Veyari combat rosters.
  - Prototype base expansion pressure loop.
  - Vertical-slice roster lock implemented from planning/unit-list.md.
  - First duel map built to planning/map-standards.md baseline.
- Validation:
  - Smoke: Project launch enters startup scene and transitions to gameplay without blocking errors.
  - Functional: Manual playthrough confirms loop from start to finish.
  - Functional: Human and alien MVP factions can complete opening, transition, and first combined-arms engagements.
  - Integration: Input, simulation, and UI flow work together without blocking issues.
  - Functional: Players can execute all core commands and camera actions using documented bindings.
  - Integration: Resource, alert, and command feedback states match gameplay events without stale or missing HUD updates.
  - Integration: Map-aware route choice, objective contest behavior, and regroup logic function for both factions.

## M3 Content and Balance Pass

- Status: Not Started
- Outcomes:
  - Starter factions and unit roster.
  - Human-vs-alien MVP duel package validated as production baseline before additional faction rollout.
  - Any-faction core roster baseline applied to new faction concepts, including Carrier plus Fighter and Corvette air-wing roles.
  - Colony and civilian units and structures integrated as a shared baseline with clear civilian versus militia combat boundaries.
  - Five-faction baseline (3 human, 1 alien, 1 robot) established for all future planning and test flows.
  - Five-tier tech tree baseline established for all factions, with roles and unlocks mapped to each tier.
  - Four-era civilizational transition pacing model defined and mapped to gameplay systems.
  - One Box core-state model and distributed network expansion rules defined for multiplayer identity.
  - Three-way collision model operationalized for Humanity, One Box machine networks, and alien systems pressure.
  - Descent-linked objective layer implemented with access nodes, orbital corridor events, and escalation triggers.
  - Dynamic evolution branch framework implemented from shared human opening into machine, alien, or hybrid outcomes.
  - Competitive opening clarity model implemented with phase-gated complexity activation.
  - Maintenance and instability economy rules implemented for high-tier machine warfare.
  - Unified global stockpile economy model implemented with finite shared resources and event-driven volatility.
  - Baseline economy and combat tuning.
  - Tier 2 progression paths validated against planning/tech-tree.md.
  - Numeric price sheet aligned to planning/economy-standards.md.
- Validation:
  - Functional: Controlled scenario checks expected combat and economy behavior.
  - Functional: Matches show readable progression from Survival Warfare into at least one Autonomous War state.
  - Functional: Matches show visible Descent influence on economy, objectives, and escalation timing.
  - Integration: One Box core penalties and distributed network recovery integrate with production, command, and logistics.
  - Integration: Dynamic evolution branching integrates with tech unlocks, world events, and faction identity readability.
  - Integration: Opening phase remains competitively readable while advanced complexity unlocks progressively.
  - Integration: Maintenance and instability pressure create counterplay against runaway tech leads.
  - Integration: Global stockpile depletion and world event shifts integrate correctly with extraction, tech gates, and production pacing.
  - Integration: Air production, basing, launch, and recovery behave consistently between Carrier and Airfield contexts.
  - Integration: Colony logistics, militia defense, and frontline military systems interact without role collapse.

## M4 Packaging and Readiness

- Status: Not Started
- Outcomes:
  - Export profile configuration.
  - Release checklist and known issue list.
  - itch.io Stage 0 Coming Soon page published with aligned value proposition and media.
  - itch.io Stage 1 restricted prototype workflow prepared for targeted playtest distribution.
  - Feedback collation workflow active with standardized intake fields and weekly triage cadence.
  - Public demo page criteria and promotion checklist defined for Stage 2 launch.
- Validation:
  - Smoke: Exported build launches and core loop works end-to-end.
  - Functional: Page content matches currently implemented gameplay scope and status labeling.
  - Integration: External feedback entries map into triage outcomes and prioritized implementation tasks.
  - Observability: Weekly reporting captures page views, follows, conversion, and report-to-fix cycle metrics.

## Dependencies and Risks

- See tracking/risk-register.md for active risks.
- See tracking/assumptions.md for assumptions that can affect scope.

## Working Artifacts

- Conventions: planning/conventions.md
- Game vision: planning/game-vision.md
- Tech tree: planning/tech-tree.md
- Unit list: planning/unit-list.md
- Map standards: planning/map-standards.md
- UI and controls standards: planning/controls-standards.md
- Economy standards: planning/economy-standards.md
- Task backlog: planning/task-backlog.md
- Testing strategy: planning/testing-strategy.md
- Definition of done: planning/definition-of-done.md
