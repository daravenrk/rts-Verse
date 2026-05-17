# Research Log

Use this file to capture evidence-backed findings before changing architecture or implementation plans.

## Entry-0001 Initial Workspace Discovery

- Date: 2026-05-17
- Query: Establish baseline architecture and planning artifacts.
- Files reviewed:
  - project.godot
  - icon.svg.import
- Key findings:
  - Workspace is a minimal Godot project with no markdown planning or architecture documents.
  - No existing ADR, plan, or tracking conventions were found.
- Interpretation:
  - We need a default project documentation structure to support decisions and execution tracking.
- Decision impact:
  - Supports ADR-0001 by justifying creation of documentation baseline.

## Entry-0002 Process and Execution Gaps

- Date: 2026-05-17
- Query: Add conventions and other generally beneficial project operating artifacts.
- Files reviewed:
  - docs/README.md
  - docs/architecture/decision-log.md
  - docs/planning/implementation-plan.md
  - docs/planning/next-steps.md
  - docs/tracking/assumptions.md
  - docs/tracking/risk-register.md
- Evidence:
  - Next-steps tracker had open item for coding conventions.
  - Implementation plan M1 listed conventions as a required outcome.
  - No explicit testing strategy, task backlog structure, or done criteria existed.
- Interpretation:
  - Foundational planning existed but execution standards were incomplete.
  - Additional planning artifacts would reduce ambiguity and improve delivery reliability.
- Risks or unknowns:
  - Process overhead may slow very small changes if over-applied.
- Recommended decision:
  - Accept a conventions and delivery-quality baseline as ADR-0002.
- Follow-up tasks:
  - Keep backlog and testing flows aligned with active milestone work.

## Entry-0003 Vision Alignment for RTS Identity

- Date: 2026-05-17
- Query: Capture and operationalize project identity as daravenrk's Command and Conquer meets Total Annihilation.
- Files reviewed:
  - docs/planning/implementation-plan.md
  - docs/planning/next-steps.md
  - docs/architecture/decision-log.md
  - docs/planning/task-backlog.md
  - docs/planning/testing-strategy.md
- Evidence:
  - Implementation plan defined milestone flow but not explicit creative identity criteria.
  - Next-steps and backlog existed, but requirements for asymmetry and strategic scale were implicit.
- Interpretation:
  - A dedicated vision artifact is required to make gameplay acceptance objective and traceable.
  - The direction should be expressed as pillars and validated through vertical slice outcomes.
- Risks or unknowns:
  - Strong inspiration references can cause unintentional derivative design pressure.
- Recommended decision:
  - Accept ADR-0003 and maintain original creative implementation while honoring genre pillars.
- Follow-up tasks:
  - Add vision-aligned checks to testing strategy and backlog acceptance text.

## Entry-0004 Faction Progression and Roster Definition

- Date: 2026-05-17
- Query: Define the full tech tree and unit list needed for planning and implementation.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/task-backlog.md
  - docs/planning/testing-strategy.md
  - docs/planning/implementation-plan.md
  - docs/planning/next-steps.md
- Evidence:
  - Vision required two asymmetric factions and combined-arms gameplay, but no named units or structure unlock paths existed.
  - M2 and M3 outcomes referenced faction asymmetry and unit roster without a concrete source of truth.
- Interpretation:
  - A dedicated tech progression and roster baseline is required before implementation estimates or validation criteria can be reliable.
  - Vertical-slice scope should lock a subset of the larger roster while preserving full-faction planning context.
- Risks or unknowns:
  - Final balance values and exact upgrade timing remain provisional until playtesting begins.
- Recommended decision:
  - Accept ADR-0004 and use tech-tree.md plus unit-list.md as the design baseline for implementation planning.
- Follow-up tasks:
  - Update backlog and test flows to reference faction-specific units and tech milestones.

## Entry-0005 Map Fairness and Economy Control Standards

- Date: 2026-05-17
- Query: Define standards for starting points, resource locations, pricing, and economic control.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/tech-tree.md
  - docs/planning/unit-list.md
  - docs/planning/testing-strategy.md
  - docs/planning/implementation-plan.md
- Evidence:
  - Game vision requires strong map control through expansion and denial, but no formal map layout rules existed.
  - Tech tree defines Alloy, Power, and Data, but no pricing or economic pacing standards existed.
  - Testing strategy validated unit behavior and progression, but not spawn fairness or resource-control outcomes.
- Interpretation:
  - Map standards and economy standards are required before prototype level design and balance work can be evaluated consistently.
  - Pricing should be governed by relative bands first, with numeric tuning deferred until playtesting.
- Risks or unknowns:
  - Over-constraining early maps may slow experimentation if standards are treated as immutable too soon.
- Recommended decision:
  - Accept ADR-0005 and use map-standards.md plus economy-standards.md as the planning baseline for level and economy work.
- Follow-up tasks:
  - Add map fairness and economy-control checks to testing flows and backlog items.

## Entry-0006 Any-Faction Unit Coverage with Carrier Air Wing

- Date: 2026-05-17
- Query: What units are required for any faction baseline, including a carrier and fighter/corvette craft based from a carrier or airfield?
- Files reviewed:
  - docs/planning/unit-list.md
  - docs/planning/tech-tree.md
  - docs/planning/testing-strategy.md
  - docs/planning/implementation-plan.md
  - docs/architecture/decision-log.md
- Evidence:
  - unit-list.md documents faction-specific rosters and role matrix but no explicit reusable any-faction baseline.
  - tech-tree.md emphasizes Tier 2 air control and combined-arms transitions, implying mandatory anti-air and strike role coverage.
  - implementation-plan.md M3 expects starter factions and unit roster work, which benefits from standardized role completeness checks.
- Interpretation:
  - A faction-agnostic roster baseline is needed to keep new faction design complete and comparable without weakening asymmetry.
  - Carrier and airfield basing rules should be explicit so Fighter and Corvette operations remain testable and predictable.
- Risks or unknowns:
  - Carrier timing may create snowball patterns if launch and rearm tempo is not bounded.
  - Exact numeric tuning for Fighter/Corvette efficiency remains provisional.
- Recommended decision:
  - Accept ADR-0006 and use planning/unit-list.md any-faction baseline for future faction design and review.
- Follow-up tasks:
  - Add a validation flow for carrier and airfield sortie behavior.
  - Add backlog tasks for baseline air wing implementation checks.

## Entry-0007 Colony and Civilian Units and Buildings Baseline

- Date: 2026-05-17
- Query: Add colony and civilian units and buildings, with some defensive roles and some purely civilian roles.
- Files reviewed:
  - docs/planning/unit-list.md
  - docs/planning/tech-tree.md
  - docs/planning/testing-strategy.md
  - docs/planning/implementation-plan.md
  - docs/architecture/decision-log.md
- Evidence:
  - Existing roster planning emphasized military combined arms and air operations but had no explicit colony or civilian roster layer.
  - Tech tiers already support economic and map-control decisions that can be deepened by civilian infrastructure targets.
- Interpretation:
  - Colony and civilian content should be explicit to support strategic raid-and-recover gameplay.
  - Role boundaries are required so militia and security tools defend colonies without eclipsing main military lines.
- Risks or unknowns:
  - Civilian output tuning may produce runaway leads if protection costs are too low.
  - Militia scaling may blur identity with standard combat rosters.
- Recommended decision:
  - Accept ADR-0007 and adopt shared colony-civilian baseline roles and structures for all factions.
- Follow-up tasks:
  - Add a validation flow for colony resilience and logistics disruption.
  - Add first-pass pricing sanity checks for civilian and militia units.

## Research Entry Template

## Entry-XXXX Title

- Date: YYYY-MM-DD
- Query:
- Files reviewed:
- Evidence:
- Interpretation:
- Risks or unknowns:
- Recommended decision:
- Follow-up tasks:
