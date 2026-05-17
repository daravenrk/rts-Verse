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

## Entry-0008 Five-Faction Baseline (3 Human, 1 Alien, 1 Robot)

## Entry-0008 Five-Faction Baseline (American, Chinese, Civilian, Alien, Robot)

## Entry-0009 Five-Tier Tech Tree Baseline

- Date: 2026-05-17
- Query: Extend the tech tree to five tiers for all factions, with clear roles and unlocks.
- Files reviewed:
  - docs/planning/tech-tree.md
  - docs/architecture/decision-log.md
- Evidence:
  - Previous tech tree planning used a 4-tier model.
  - Project scope and faction diversity require a 5-tier tech tree for all factions.
- Interpretation:
  - A 5-tier model supports deeper progression, late-game escalation, and unique faction-defining powers.
- Risks or unknowns:
  - Increased design and balance complexity.
  - Additional content and tuning required for each faction.
- Recommended decision:
  - Accept ADR-0009 and update all planning baselines to support a 5-tier tech tree.
- Follow-up tasks:
  - Map all existing and planned units/structures to the new 5-tier model.
  - Update test flows and backlog for 5-tier progression coverage.

- Date: 2026-05-17
- Query: Expand project scope to five factions: American, Chinese, Civilian/Colony, Alien, Robot (robot is fully unique).
- Files reviewed:
  - docs/planning/unit-list.md
  - docs/planning/tech-tree.md
  - docs/architecture/decision-log.md
- Evidence:
  - Previous planning and implementation focused on two human factions.
  - Project vision and replay value benefit from a five-faction model, with robot faction requiring a distinct, non-humanoid roster.
- Interpretation:
  - Early planning for five factions will reduce rework and clarify balance/content needs.
  - The robot faction will need a dedicated planning section and cannot simply map to the human/alien baselines.
- Risks or unknowns:
  - Increased design and implementation workload.
  - Placeholder names and content for new factions until further planning.
- Recommended decision:
  - Accept ADR-0008 and update all planning baselines to support five factions, with a dedicated robot planning section.
- Follow-up tasks:
  - Add placeholder names and initial flavor notes for new factions.
  - Update test flows and backlog for multi-faction coverage.

## Entry-0010 Unified Global Stockpile Economy with World Events

- Date: 2026-05-17
- Query: Record a united world economy where resources are finite and fluctuate based on random world events.
- Files reviewed:
  - docs/planning/economy-standards.md
  - docs/planning/tech-tree.md
  - docs/planning/map-standards.md
  - docs/planning/testing-strategy.md
- Evidence:
  - Existing standards define resource pressure through map control, but no global finite stockpile mechanism is defined.
  - Existing validation flows do not yet cover event-driven resource volatility.
- Interpretation:
  - A global stockpile model is required to represent world-scale scarcity while preserving map-control gameplay.
  - Random event effects must be bounded and observable to avoid unfair or opaque outcomes.
- Risks or unknowns:
  - Poorly tuned event variance could create perceived randomness over strategic skill.
  - Additional UI and telemetry requirements are needed for player clarity.
- Recommended decision:
  - Accept ADR-0010 and update economy, tech, plan, testing, and tracking artifacts to include finite shared stockpiles plus world events.
- Follow-up tasks:
  - Define first-pass stockpile caps and event frequency bounds.
  - Add event and stockpile observability hooks to milestone validation.

## Entry-0011 Civilizational Transition and One Box Identity Direction

- Date: 2026-05-17
- Query: Expand multiplayer identity from conventional faction combat into a civilizational transition arc centered on emerging machine consciousness.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/implementation-plan.md
  - docs/planning/testing-strategy.md
  - docs/planning/economy-standards.md
  - docs/architecture/decision-log.md
- Evidence:
  - Existing vision has strong gameplay pillars but limited explicit narrative-through-systems identity.
  - Economy standards now include unified finite global stockpiles and volatility, creating a foundation for high-tech fragility and escalation pressure.
  - Test strategy lacks dedicated era-transition and core-fragility validation paths.
- Interpretation:
  - A four-era model can unify gameplay pacing, faction identity, and emotional progression in multiplayer.
  - One Box framing can connect lore and systems by tying command resilience to distributed network infrastructure.
- Risks or unknowns:
  - Added complexity may reduce readability if era transitions are not well telegraphed.
  - Core-penalty and instability tuning can cause frustration if thresholds are too punitive.
- Recommended decision:
  - Accept ADR-0011 and propagate era identity, One Box premise, and maintenance-instability rules across planning artifacts.
- Follow-up tasks:
  - Define era transition triggers and player-facing cues.
  - Define One Box core loss penalties and distributed recovery paths.
  - Add validation flows for era progression and infrastructure collapse outcomes.

## Entry-0012 Three-Way Collision and Descent Event Architecture

- Date: 2026-05-17
- Query: Expand the setting into a three-way collision and define a planetary catalyst event that drives escalation and world volatility.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/tech-tree.md
  - docs/planning/economy-standards.md
  - docs/planning/testing-strategy.md
  - docs/architecture/decision-log.md
- Evidence:
  - Current identity already supports machine emergence and instability, but lacked a single world-defining event to anchor alien influence.
  - Unified global stockpile and random world event standards already exist and can be tied to a persistent source.
  - Era progression and One Box systems benefit from a visible strategic centerpiece that all players contest.
- Interpretation:
  - The Descent can serve as both lore catalyst and deterministic systems anchor for event generation, map objectives, and technology acceleration.
  - Dynamic evolution from shared starting conditions should remain the primary multiplayer model for replayability.
- Risks or unknowns:
  - Descent-driven event intensity may overwhelm readability if effect windows are not clearly telegraphed.
  - Alien integration branches require careful tuning to avoid invalidating human and machine paths.
- Recommended decision:
  - Accept ADR-0012 and propagate Descent-linked objective, event, and evolution-path requirements across planning artifacts.
- Follow-up tasks:
  - Define Descent event categories, cadence bounds, and warning windows.
  - Define access-node objective rules and orbital corridor contest behavior.
  - Add branch-emergence validation flows for human, machine, alien, and hybrid trajectories.

## Entry-0013 Human vs Alien MVP Complete-Faction Solution

- Date: 2026-05-17
- Query: Design an MVP solution with one complete human faction and one complete alien faction that both fight intelligently in map environments.
- Files reviewed:
  - docs/planning/unit-list.md
  - docs/planning/tech-tree.md
  - docs/planning/map-standards.md
  - docs/planning/testing-strategy.md
  - docs/planning/implementation-plan.md
- Evidence:
  - Existing complete human implementation baseline already exists in Helion structures and roster.
  - Alien faction baseline was still placeholder-level in faction scope sections.
  - Testing strategy had strong economy and progression checks but required direct map-intelligence validation for tactical behavior.
- Interpretation:
  - Helion can serve as the human MVP anchor while a complete alien chain is added as Veyari Ascendancy.
  - MVP quality depends on behavior intelligence, not only roster completeness; lane choice, objective timing, and regroup logic must be explicit tests.
- Risks or unknowns:
  - Tactical behavior tuning may take multiple iterations before stable asymmetry emerges.
  - Alien roster power curve can overperform if area-control tools are not constrained in early tiers.
- Recommended decision:
  - Accept ADR-0013 and lock Human Helion vs Alien Veyari as the implementation-first duel package with smart map-fighting validation.
- Follow-up tasks:
  - Implement Veyari Tier 0 and Tier 1 production chain.
  - Run F-16 and F-17 and record behavior deltas per map spawn.
  - Tune route selection and regroup triggers to avoid repeated chokepoint attrition failures.

## Entry-0014 RTS UI and Keyboard-Mouse Control Baseline

- Date: 2026-05-17
- Query: Define MVP UI controls and complete keyboard and mouse control standards.
- Files reviewed:
  - docs/planning/conventions.md
  - docs/planning/testing-strategy.md
  - docs/planning/implementation-plan.md
  - docs/planning/task-backlog.md
- Evidence:
  - Conventions require centralized input naming, but no complete binding baseline existed.
  - Existing test flows validate movement and selection, but did not cover full control-group, camera, and production hotkey behavior.
  - M2 outcomes require end-to-end playable core loop, which depends on reliable input and HUD feedback.
- Interpretation:
  - A dedicated controls standards document is needed to align gameplay, UI, and input implementation.
  - Input should be validated as a system, not as isolated commands.
- Risks or unknowns:
  - Key layout may need iteration for ergonomics and accessibility.
  - Camera defaults can feel too slow or too fast without early tuning.
- Recommended decision:
  - Accept ADR-0014 and enforce controls-standards.md as MVP source of truth.
- Follow-up tasks:
  - Implement full command-card hotkey grid and remapping support.
  - Add control-specific validation flows and backlog tasks for camera, groups, and HUD feedback.

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
