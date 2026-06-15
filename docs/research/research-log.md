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

## Entry-0012 World Systems and Environment Baseline Contracts

- Date: 2026-06-10
- Query: Define contracts for structure shading zones, day-night readability, biome parameterization, terrain and plant-life vocabulary, and world resource source mapping.
- Files reviewed:
  - docs/planning/world-systems-baseline.md
  - docs/planning/map-standards.md
  - docs/planning/economy-standards.md
  - docs/planning/testing-strategy.md
  - docs/architecture/decision-log.md
- Evidence:
  - Structure readability requirements existed but lacked complete material-zone maps for shared MVP buildings.
  - Day-night cycle speed, phase definitions, and readability floor constraints were unspecified.
  - Biome and plant-life rules were not formalized in map standards.
  - Economy standards lacked explicit world-source mapping and credit conversion constraints.
- Interpretation:
  - A unified world-systems contract is required to prevent readability regressions and map-authoring drift.
  - Biome, lighting, and economy presentation must remain coupled to gameplay-driving fairness rules.
- Risks or unknowns:
  - Overly aggressive lighting or flora density may reduce combat clarity at RTS zoom.
  - Credits conversion could distort opening parity if unconstrained.
- Recommended decision:
  - Accept ADR-0012 and maintain world-systems contracts as source-of-truth for future map and visual implementation.
- Follow-up tasks:
  - Implement runtime validation hooks for F-28 once lighting and biome simulation systems are active.
  - Record first dark-phase runtime pass against LS checklist once scene implementation is available.
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

## Entry-0015 Resource Discovery and Security Core Loop

- Date: 2026-05-17
- Query: Establish resource finding and resource security as the central gameplay objective.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/economy-standards.md
  - docs/planning/map-standards.md
  - docs/planning/testing-strategy.md
  - docs/architecture/decision-log.md
- Evidence:
  - Economy and map standards already reward expansion and contested objective control.
  - Existing vision did not explicitly state resource discovery and security as the primary match objective.
  - Multiple systems reference control pressure, but objective prioritization needed unification.
- Interpretation:
  - Declaring resource security as the primary loop improves consistency across implementation, balancing, and validation.
  - Combat identity remains important, but functions as a means of securing or denying economic control.
- Risks or unknowns:
  - Poorly tuned early expansion value can cause snowballing.
  - Objective overload can reduce readability if too many resource prompts appear simultaneously.
- Recommended decision:
  - Accept ADR-0015 and align vision, plan, and tests to resource-first objective weighting.
- Follow-up tasks:
  - Add explicit resource-security success criteria to M2 and M3 test reporting.
  - Tune map objective spacing to support contest and recovery windows.

## Entry-0016 Competitive Clarity First and Phase-Gated Complexity

- Date: 2026-05-17
- Query: Ensure the match opens with competitive clarity and introduces civilization complexity gradually through escalation.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/economy-standards.md
  - docs/planning/tech-tree.md
  - docs/planning/testing-strategy.md
  - docs/architecture/decision-log.md
- Evidence:
  - Existing direction supports deep late-game systems but required explicit opening simplicity constraints.
  - Resource-security objective and dynamic escalation are already in place and can anchor phased complexity.
  - Competitive parity in the opening window is critical for multiplayer viability.
- Interpretation:
  - Early-phase readability should prioritize standard RTS macro and tactical decisions.
  - Advanced systems should unlock as consequences of successful expansion and tech commitment.
- Risks or unknowns:
  - Late-system unlocks may feel too delayed if thresholds are too conservative.
  - Faction asymmetry can become unfair if opening parity baselines are not continuously validated.
- Recommended decision:
  - Accept ADR-0016 and enforce phase-gated complexity and opening-parity constraints across planning and tests.
- Follow-up tasks:
  - Add opening clarity and parity validation flow.
  - Define concrete unlock thresholds for advanced system activation windows.

## Entry-0017 Default Startup Scene and Bootstrap Flow

- Date: 2026-06-05
- Query: Add and plan a default main scene for the Godot project startup flow.
- Files reviewed:
  - project.godot
  - docs/planning/conventions.md
  - docs/planning/implementation-plan.md
  - docs/planning/testing-strategy.md
  - docs/planning/next-steps.md
- Evidence:
  - project.godot has no run/main_scene configured.
  - Workspace currently has no .tscn scene files.
  - conventions.md defines scene naming and folder conventions (for example scenes/core), which can host a default startup entrypoint.
  - testing-strategy.md smoke layer requires reliable startup and scene-load behavior.
- Interpretation:
  - A canonical startup scene is a prerequisite for repeatable M2 smoke and integration validation.
  - Startup should be treated as a minimal bootstrap responsibility that initializes required systems and routes to gameplay.
- Risks or unknowns:
  - Overloading startup with gameplay logic can increase coupling and slow iteration.
  - Scene transition timing may cause initialization race issues if manager readiness is not explicit.
- Recommended decision:
  - Accept ADR-0017 and standardize Main.tscn as startup coordinator with explicit project.godot main-scene wiring.
- Follow-up tasks:
  - Create scenes/core/Main.tscn and set run/main_scene.
  - Add bootstrap startup checklist to M2 execution and smoke validation notes.
  - Add startup observability events for scene load and initialization failures.

## Entry-0018 itch.io Launch Planning and Feedback Collation

- Date: 2026-06-06
- Query: Define a launch plan for itch.io page setup and a reliable process for collecting and triaging player feedback.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/implementation-plan.md
  - docs/planning/next-steps.md
  - docs/planning/testing-strategy.md
  - docs/architecture/decision-log.md
  - scripts/core/Main.gd
- Evidence:
  - Vision and identity pillars are strong and marketable, but current gameplay milestones remain in-progress for M2 and M4.
  - Startup baseline exists, but gameplay transition target scene is still placeholder and not release-ready.
  - Existing process is strong for internal validation, but no external feedback intake standard or cadence is defined.
- Interpretation:
  - A staged launch model is required to capture audience interest now while protecting trust during early development.
  - Structured feedback collation is needed so community input becomes actionable engineering and design work.
- Risks or unknowns:
  - Public launch too early can create negative perception if core loop is unstable.
  - Unstructured feedback can overwhelm prioritization and hide blockers.
- Recommended decision:
  - Accept ADR-0018 and adopt a three-stage itch.io launch plan plus standard feedback intake and weekly triage flow.
- Follow-up tasks:
  - Add planning artifact for page blueprint, stage gates, and feedback schema.
  - Add M4 outcomes and sprint tasks for page publish, metrics review, and triage cadence.
  - Align external feedback categories with backlog and validation flows.

## Entry-0019 MVP Map Item Definition for Implementable Level Assembly

- Date: 2026-06-06
- Query: Define concrete items that should exist in MVP maps so map building is actionable and test-ready.
- Files reviewed:
  - docs/planning/map-standards.md
  - docs/planning/testing-strategy.md
  - docs/planning/implementation-plan.md
  - docs/planning/next-steps.md
  - docs/architecture/decision-log.md
- Evidence:
  - Map standards defined duel fairness, lanes, and resource principles, but item-level implementation targets were implicit.
  - Current sprint and backlog reference building the first duel map, but lacked a mandatory item checklist.
  - Test flows depend on lane, contest, and objective behavior that require explicit map items to validate reliably.
- Interpretation:
  - MVP map delivery needs a concrete item catalog with required counts and placement constraints.
  - Item IDs and observability rules should be part of standards to improve repeatability of validation runs.
- Risks or unknowns:
  - Too-rigid item counts could reduce creative map iteration if treated as immutable beyond MVP.
  - Optional extension items may require rebalance once advanced event systems are implemented.
- Recommended decision:
  - Accept ADR-0019 and adopt MVP map item catalog baseline under planning/map-standards.md.
- Follow-up tasks:
  - Build first duel map using required strategic and tactical item sets.
  - Add item-ID capture to map validation notes.
  - Prototype one optional extension item only after required checklist is complete.

## Entry-0020 Buildable Structure Definitions and Tether Point Primary Base Role

- Date: 2026-06-06
- Query: Define what players can build in MVP maps and formalize the Tether Point as the primary base structure role.
- Files reviewed:
  - docs/planning/unit-list.md
  - docs/planning/tech-tree.md
  - docs/planning/testing-strategy.md
  - docs/planning/task-backlog.md
  - docs/planning/implementation-plan.md
  - docs/architecture/decision-log.md
- Evidence:
  - Unit and tech planning defined faction production structures but lacked a shared base-structure role contract for MVP implementation.
  - Existing validation flows did not explicitly test primary base destruction and recovery behavior.
  - MVP scope already depends on reliable opening build chains and readable command-state transitions.
- Interpretation:
  - A shared primary base role (Tether Point) is required for consistent gameplay behavior across faction-specific command structure names.
  - MVP buildable structure classes should be explicit and tier-scoped to prevent undefined dependencies during implementation.
- Risks or unknowns:
  - Recovery rules may require tuning to avoid overly forgiving or overly punishing base-loss outcomes.
  - Tier 2 structure class requirements may need adjustment once air and heavy-ground paths are both fully playable.
- Recommended decision:
  - Accept ADR-0020 and use the Tether Point plus shared MVP buildable class baseline as source-of-truth.
- Follow-up tasks:
  - Implement Tether Point lifecycle and command-penalty state handling.
  - Execute F-22 across all MVP factions and both spawns.
  - Add telemetry fields for Tether Point lifecycle timestamps and recovery duration.

## Entry-0021 Startup Splash and Main Menu Mode Gate Definition

- Date: 2026-06-06
- Query: Define startup flow so splash shows first, then main menu appears on first key press or after 5 seconds, with Campaign shown as Coming Soon.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/implementation-plan.md
  - docs/planning/testing-strategy.md
  - docs/planning/task-backlog.md
  - docs/planning/next-steps.md
  - docs/architecture/decision-log.md
  - scripts/core/Main.gd
- Evidence:
  - Existing bootstrap flow routes directly toward gameplay and does not define splash-to-menu behavior.
  - MVP planning needed explicit mode visibility constraints so unavailable campaign content is communicated without being selectable.
  - Current testing strategy lacked a dedicated startup UX flow covering both input-triggered and timeout-triggered transitions.
- Interpretation:
  - Startup behavior should be formalized as deterministic shell-state logic before gameplay concerns.
  - Visible-disabled campaign option is preferable to hidden mode for roadmap clarity in MVP.
- Risks or unknowns:
  - Timing edge cases around input handling near timeout boundary may create inconsistent transitions.
  - Disabled menu option needs clear accessibility treatment so it is understandable but non-interactive.
- Recommended decision:
  - Accept ADR-0021 and standardize splash-first startup with keypress or 5-second timeout transition into menu containing Skirmish enabled and Campaign Coming Soon disabled.
- Follow-up tasks:
  - Implement startup shell scenes and transition controller.
  - Execute F-23 to validate both transition paths and disabled campaign behavior.
  - Add transition-reason telemetry for startup diagnostics.

## Entry-0022 Small-Scale 3D Presentation and Animation Subspace Direction

- Date: 2026-06-06
- Query: Define visual presentation so battlefield actors are small 3D objects and animation behavior is constrained to a predefined subspace.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/implementation-plan.md
  - docs/planning/testing-strategy.md
  - docs/planning/task-backlog.md
  - docs/planning/next-steps.md
  - docs/architecture/decision-log.md
- Evidence:
  - Existing planning emphasized RTS readability and control clarity but did not explicitly standardize 3D scale and animation-state constraints.
  - MVP scope already carries significant systems load, so unconstrained per-unit animation growth creates delivery risk.
  - Camera and HUD validation flows require readable intent signaling at gameplay zoom levels.
- Interpretation:
  - A small-scale 3D style with shared animation-state baseline aligns visual goals with MVP implementation capacity.
  - Required per-unit animation state coverage should be explicitly tested as part of core gameplay readiness.
- Risks or unknowns:
  - Small-scale readability may degrade if silhouette contrast and camera defaults are not tuned early.
  - Optional role-specific states can create drift if baseline-state requirements are not enforced.
- Recommended decision:
  - Accept ADR-0022 and enforce predefined animation subspace baseline for MVP playable roster.
- Follow-up tasks:
  - Define camera default and zoom bands for readability tests.
  - Map each MVP unit to required and optional animation states.
  - Execute F-24 and log gaps by unit role.

## Entry-0023 Campaign Perspective Sequence and Skirmish Availability Rules

- Date: 2026-06-06
- Query: Define campaign side order so Veyari perspective is first and Helion is last, and define skirmish faction availability behavior.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/implementation-plan.md
  - docs/planning/testing-strategy.md
  - docs/planning/task-backlog.md
  - docs/planning/next-steps.md
  - docs/architecture/decision-log.md
- Evidence:
  - Startup menu behavior was defined, but campaign progression order and skirmish availability gating were not formally captured.
  - Current MVP faction baseline already centers Helion and Veyari, enabling immediate availability-policy definition.
  - Future faction expansion requires deterministic UI rules for enabled versus disabled options.
- Interpretation:
  - Campaign perspective ordering must be explicit to avoid narrative sequencing drift.
  - Skirmish should expose all currently available factions while keeping unavailable factions visible for roadmap clarity.
- Risks or unknowns:
  - Campaign content pacing may require intermediate perspective transitions before final mission ordering is finalized.
  - Availability flags must remain synchronized with build content or UI trust will degrade.
- Recommended decision:
  - Accept ADR-0023 and enforce Veyari-first, Helion-last campaign order plus skirmish available-faction selection and disabled Coming Soon states.
- Follow-up tasks:
  - Implement campaign mission-order metadata and transition markers.
  - Implement skirmish availability gating logic in faction selection UI.
  - Execute F-25 and record enabled or disabled state evidence.

## Entry-0024 Environment Type Vocabulary and Faction-Agnostic Tether Spawn Rule

- Date: 2026-06-06
- Query: Define environment types that create good fights and establish that Tether Points spawn at map-defined positions for all factions, keeping maps generic and reusable.
- Files reviewed:
  - docs/planning/game-vision.md
  - docs/planning/map-standards.md
  - docs/planning/unit-list.md
  - docs/planning/implementation-plan.md
  - docs/planning/testing-strategy.md
  - docs/planning/next-steps.md
  - docs/architecture/decision-log.md
- Evidence:
  - Existing map standards already define lanes, chokepoints, contested nodes, and fairness constraints but not a named environment taxonomy.
  - Tether Point spawn position was not yet formally decoupled from faction identity in map layout rules.
  - Current combat and readability goals depend on geometry that creates choices without clutter or hidden route ambiguity.
- Interpretation:
  - Environment types need a reusable vocabulary centered on fight shape, objective pull, and route structure.
  - Tether Points should spawn at map-defined positions so any map works with any faction matchup without layout variants.
- Risks or unknowns:
  - Environment types may be over-applied too rigidly if maps stop mixing secondary traits.
  - Faction visual identity must come from units and buildings, not spawn geometry.
- Recommended decision:
  - Accept ADR-0024 and standardize shape-forward environment types plus faction-agnostic map-defined spawn positions for Tether Points.
- Follow-up tasks:
  - Select first duel-map primary environment type.
  - Validate faction-agnostic Tether spawn positions against F-26 for both Helion and Veyari.
  - Expand environment taxonomy into future skirmish and campaign map planning after MVP map proves readable.

## Entry-0025 Stage 0 Next-Step Refinement and Closure Gating

- Date: 2026-06-10
- Query: Refine remaining next steps so Stage 0 publication closure is execution-ready, better defined, and testable.
- Files reviewed:
  - docs/planning/next-steps.md
  - docs/planning/task-backlog.md
  - docs/planning/implementation-plan.md
  - docs/planning/stage0-media-bundle-spec.md
  - docs/planning/itch-stage0-publish-runbook.md
  - docs/planning/stage0-postpublish-closure-checklist.md
  - docs/tracking/stage0-publication-evidence-template.md
  - DEV_NEXT_STEPS.md
  - docs/architecture/decision-log.md
- Evidence:
  - Only two unchecked next-step items remained and both were broad external actions without explicit sub-step sequencing.
  - Existing artifacts already define spec, runbook, post-publish checklist, and evidence template, but execution tracking granularity was missing.
  - Implementation plan M4 and task backlog did not yet reflect a decomposed external-closure execution lane.
- Interpretation:
  - The project has a documentation-complete preparation state but lacks a deterministic closure path for final Stage 0 external operations.
  - Explicit decomposition is needed to ensure operator execution, validation, and tracker closure stay synchronized.
- Risks or unknowns:
  - Manual external publication introduces timing and operator variability.
  - Without strict evidence gating, publication may occur without complete tracker closure proof.
- Recommended decision:
  - Accept ADR-0025 and decompose Stage 0 closure into dependency-ordered M4 tasks with explicit evidence-based exit criteria.
- Follow-up tasks:
  - Execute T-0046 through T-0050 in order.
  - Use prepublish audit and status report commands as closure gates.
  - Complete evidence template and propagate closure updates across next-steps, change-log, and scenario validation notes.

## Entry-0026 Duel Runtime User Interaction Contract

- Date: 2026-06-14
- Query: Design user interaction architecture for gameplay commands so selection, command dispatch, and feedback remain consistent and testable as systems scale.
- Files reviewed:
  - docs/planning/controls-standards.md
  - scripts/core/FirstDuelMap.gd
  - scripts/core/SelectableUnit2D.gd
  - scripts/core/Skirmish.gd
  - docs/planning/testing-strategy.md
  - docs/tracking/scenario-validation-notes.md
  - docs/architecture/decision-log.md
  - docs/planning/implementation-plan.md
- Evidence:
  - Runtime already implements a scene-level interaction router with click selection, right-click context commands, build and production toggles, plus rejection handling.
  - Command mutation paths are centralized in discrete functions for move, gather, attack, build, and production.
  - Existing validation flows cover major interaction loops and HUD synchronization but were not mapped to a single interaction-state contract.
  - Scenario evidence already confirms pass behavior for F-18, F-19, F-32, F-33, F-35, F-36, F-37, and F-38.
- Interpretation:
  - The codebase is ready for contract-first interaction governance rather than additional ad hoc command additions.
  - Explicit arbitration and rejection rules are the highest leverage guardrail for regression prevention.
- Risks or unknowns:
  - Future ability systems may bypass current arbitration order if contract enforcement is not kept current.
  - UI feedback paths may drift from runtime state if new command flows skip HUD synchronization rules.
- Recommended decision:
  - Accept ADR-0026 and adopt a deterministic user interaction contract in controls standards with required validation mapping.
- Follow-up tasks:
  - Keep new command and ability work gated on interaction contract updates.
  - Add scenario notes for future interaction flows using the same acceptance and rejection evidence shape.
  - Extend interaction contract coverage when tactical abilities and advanced command modes are introduced.

## Entry-0027 Live Drag-Box Selection Planning

- Date: 2026-06-14
- Query: Plan implementation of live unit selection from click-and-drag rectangle in duel runtime.
- Files reviewed:
  - scripts/core/FirstDuelMap.gd
  - docs/planning/controls-standards.md
  - docs/planning/testing-strategy.md
  - docs/tracking/scenario-validation-notes.md
  - docs/planning/implementation-plan.md
- Evidence:
  - Runtime input handling in `_unhandled_input` currently routes left mouse press directly to `_handle_left_click_selection` with no drag-state tracking.
  - Selection helper `_box_select_units` already exists and is used in deterministic F-01/F-02 test scaffolding.
  - Current player selection ownership filtering is already implemented via `_is_player_controllable_unit`.
  - Controls standards explicitly list left-drag box selection as required interaction behavior.
- Interpretation:
  - Core selection math and ownership filters already exist; missing piece is live input state and UI rectangle feedback.
  - Lowest-risk implementation is to reuse current selection helpers and add a small drag threshold for click-vs-drag arbitration.
- Risks or unknowns:
  - Incorrect threshold tuning may cause accidental drag or accidental click behavior.
  - Screen-space projection edge cases near camera extremes may produce unexpected rectangle overlap results.
- Recommended decision:
  - Accept ADR-0027 and implement drag-state plus rectangle overlay in duel input flow, then validate against existing interaction tests with a new drag-specific validation flow.
- Follow-up tasks:
  - Add drag-state fields and threshold constants.
  - Add rectangle overlay UI and lifecycle updates during drag.
  - Add and run drag-select validation flow, then record results in scenario notes.

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
