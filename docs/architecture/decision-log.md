# Architecture Decision Log

Status values: Proposed, Accepted, Deprecated, Superseded

## ADR-0001 Documentation Baseline

- Date: 2026-05-17
- Status: Accepted
- Context: The project had no architecture or planning artifacts, which made technical decisions and delivery state hard to trace.
- Decision: Establish a lightweight documentation system under docs with architecture, research, planning, and tracking files.
- Consequences:
  - Positive: Clear history and handoff for future contributors.
  - Positive: Easier to connect implementation work to verified decisions.
  - Tradeoff: Requires regular maintenance discipline.
- Validation approach:
  - Functional: Team can record a decision in this file with status and rationale.
  - Process: Every implementation task links to an ADR or documented assumption.

## ADR-0002 Conventions and Delivery Quality Baseline

- Date: 2026-05-17
- Status: Accepted
- Context: The documentation baseline existed, but no explicit conventions, backlog format, test strategy, or done criteria were defined.
- Decision: Add project conventions, task backlog, testing strategy, and definition of done under planning to standardize execution quality.
- Rationale:
  - Reduce ambiguity in naming, folder layout, and validation expectations.
  - Improve milestone predictability by requiring task-level traceability.
- Tradeoffs:
  - Adds process overhead for small changes.
  - Requires regular backlog and test-flow maintenance.
- Alternatives considered:
  - Keep conventions implicit in code reviews only.
  - Delay governance docs until after first gameplay implementation.
- Validation approach:
  - Functional: Contributors can create tasks and execute test flows from documented templates.
  - Integration: Plan, next steps, and tracking registers reference and use the new docs.
  - Smoke: M1 foundations are verifiably complete with linked governance artifacts.
  - Observability: Test execution notes include pass or fail outcomes and follow-up tasks.
- Related plan items:
  - M1 Project Foundations
- Related research:
  - Entry-0002 in research/research-log.md

## ADR-0003 Game Identity and Design Pillars

- Date: 2026-05-17
- Status: Accepted
- Context: The project needed explicit game identity guidance so milestone work aligns to the intended style and avoids drifting into generic RTS implementation.
- Decision: Adopt a vision baseline of daravenrk's Command and Conquer meets Total Annihilation, with original creative execution and defined experience pillars in planning/game-vision.md.
- Rationale:
  - Provides clear direction for feature prioritization and prototype acceptance.
  - Keeps gameplay, economy, and unit design decisions aligned around a cohesive identity.
- Tradeoffs:
  - Strong identity constraints reduce flexibility for unrelated feature exploration.
  - Additional requirement to validate pillar alignment per milestone.
- Alternatives considered:
  - Keep vision informal and rely on iterative taste decisions.
  - Define identity after core mechanics are already implemented.
- Validation approach:
  - Functional: Vertical slice demonstrates pressure, expansion, and combined-arms interaction.
  - Integration: Economy, production, movement, combat, and UI remain coherent over full match flow.
  - Smoke: End-to-end scenario reaches win and loss states reliably.
  - Observability: Scenario notes and logs allow diagnosis of balance and flow failures.
- Related plan items:
  - M2 Core Gameplay Loop
  - M3 Content and Balance Pass
- Related research:
  - Entry-0003 in research/research-log.md

## ADR-0004 Faction Tech Tree and Unit Roster Baseline

- Date: 2026-05-17
- Status: Accepted
- Context: The project vision defined experience pillars, but implementation planning still lacked concrete faction progression, unit roles, and vertical-slice roster boundaries.
- Decision: Establish a full two-faction tech tree and unit list as planning baselines in planning/tech-tree.md and planning/unit-list.md.
- Rationale:
  - Gives implementation a stable target for economy, production, and combat systems.
  - Makes faction asymmetry explicit and testable from early milestone work onward.
- Tradeoffs:
  - Some roster details may change during balance testing.
  - Broader design surface increases planning complexity before gameplay code exists.
- Alternatives considered:
  - Delay full roster planning until after basic mechanics are playable.
  - Define only vertical-slice units and defer complete faction progression.
- Validation approach:
  - Functional: Each faction can field the locked vertical-slice roster and express intended early-game behavior.
  - Integration: Tech unlocks, production buildings, economy, and combat roles connect coherently across tiers.
  - Smoke: A complete scenario can progress from opening economy to mid-game tech transition without undefined content blockers.
  - Observability: Test flows and backlog tasks reference explicit faction/unit names and tier transitions.
- Related plan items:
  - M2 Core Gameplay Loop
  - M3 Content and Balance Pass
- Related research:
  - Entry-0004 in research/research-log.md

## ADR-0005 Map Layout and Economy Standards Baseline

- Date: 2026-05-17
- Status: Accepted
- Context: Vision, roster, and tech progression were defined, but there were no formal standards for spawn fairness, resource placement, pricing bands, or economic control expectations.
- Decision: Establish planning/map-standards.md and planning/economy-standards.md as source-of-truth baselines for level layout fairness, resource locations, pricing, and map-control economics.
- Rationale:
  - Makes map design and balance decisions measurable instead of ad hoc.
  - Prevents economy tuning and faction timing from drifting away from map-control goals.
- Tradeoffs:
  - Adds more up-front design constraints before implementation starts.
  - Numeric price sheets remain provisional until playtesting data exists.
- Alternatives considered:
  - Defer map and economy standards until after first prototype map is built.
  - Use only informal balance notes attached to backlog tasks.
- Validation approach:
  - Functional: Prototype duel map supports fair starts, planned expansions, and visible resource-control tradeoffs.
  - Integration: Map layout, tech timing, unit roles, and economy rules reinforce the intended faction identities.
  - Smoke: Full match flow reaches expansion, first contested Data fight, and Tier 2 pressure without layout-caused deadlock or broken pricing curves.
  - Observability: Test runs capture spawn parity, expansion timing, resource float, and first contested node control.
- Related plan items:
  - M2 Core Gameplay Loop
  - M3 Content and Balance Pass
- Related research:
  - Entry-0005 in research/research-log.md

## ADR-0006 Any-Faction Core Roster Baseline with Carrier Air Wing

- Date: 2026-05-17
- Status: Accepted
- Context: Existing planning defines Helion and Obsidian rosters, but there was no explicit faction-agnostic checklist for creating new factions with complete role coverage, especially for carrier-based and airfield-based air forces.
- Decision: Add an any-faction core roster baseline in planning/unit-list.md that requires foundational combat, economy, and support roles, including Carrier, Fighter, and Corvette units with shared basing constraints between Carrier and Airfield.
- Rationale:
  - Provides a reusable design floor for future factions without re-deriving mandatory role coverage.
  - Keeps carrier-centered air operations consistent with map-control and combined-arms goals.
- Tradeoffs:
  - Adds design constraints that may reduce freedom for highly unconventional faction concepts.
  - Increases up-front planning requirements before faction-specific flavor tuning.
- Alternatives considered:
  - Keep only faction-specific rosters and define new factions ad hoc.
  - Require airfield-only air operations and omit carrier-based basing.
- Validation approach:
  - Functional: New faction drafts can map one unit to each baseline role, including Fighter, Corvette, and Carrier.
  - Integration: Tech progression and production structures support at least one valid home base for each air wing unit.
  - Smoke: Scenario setup confirms Fighter and Corvette production, launch, and recovery from Carrier or Airfield.
  - Observability: Test notes capture sortie uptime, rearm delays, and behavior when home bases are destroyed.
- Related plan items:
  - M3 Content and Balance Pass
- Related research:
  - Entry-0006 in research/research-log.md

## ADR-0007 Colony and Civilian Roster and Structure Baseline

- Date: 2026-05-17
- Status: Accepted
- Context: Core military rosters and tech progression were defined, but planning lacked explicit colony and civilian units or buildings, including the distinction between non-combat civic roles and defensive local security roles.
- Decision: Add a shared colony and civilian baseline in planning/unit-list.md and planning/tech-tree.md, including civilian logistics and population structures, militia/security progression, and constraints that prevent colony forces from replacing mainline military armies.
- Rationale:
  - Makes economic and territorial warfare more legible through civilian infrastructure targets and defense priorities.
  - Clarifies which units are civilian utility, which are local defense, and which remain primary army roles.
- Tradeoffs:
  - Adds content breadth and balancing complexity.
  - Increases risk of economy snowball if colony structures are over-efficient.
- Alternatives considered:
  - Keep colony activity abstract and avoid explicit civilian units.
  - Add only militia units without civilian economy infrastructure.
- Validation approach:
  - Functional: Faction designs map all required colony and civilian unit or structure roles.
  - Integration: Colony structures connect to economy, defense, and tech tiers without blocking military progression.
  - Smoke: Scenario can establish a colony, defend it with militia, and recover civilian output after a raid.
  - Observability: Test notes capture colony uptime, logistics interruption impact, and militia effectiveness.
- Related plan items:
  - M3 Content and Balance Pass
- Related research:
  - Entry-0007 in research/research-log.md

## ADR Template

## ADR-XXXX Title

- Date: YYYY-MM-DD
- Status: Proposed | Accepted | Deprecated | Superseded
- Context:
- Decision:
- Rationale:
- Tradeoffs:
- Alternatives considered:
- Validation approach:
  - Functional:
  - Integration:
  - Smoke:
  - Observability:
- Related plan items:
- Related research:
