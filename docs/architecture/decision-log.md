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

## ADR-0008 Five-Faction Baseline (3 Human, 1 Alien, 1 Robot)

## ADR-0008 Five-Faction Baseline (American, Chinese, Civilian, Alien, Robot)

## ADR-0009 Five-Tier Tech Tree Baseline

- Date: 2026-05-17
- Status: Accepted
- Context: Previous tech tree planning used a 4-tier model. Project scope and faction diversity require a 5-tier tech tree for all factions, with clear roles and unlocks at each tier.
- Decision: Extend the tech tree baseline in planning/tech-tree.md to five tiers for all factions. Each tier must have defined roles, unlocks, and validation hooks for progression and balance.
- Rationale:
  - Supports deeper progression, late-game escalation, and unique faction-defining powers.
  - Provides more room for asymmetric tech and endgame content.
- Tradeoffs:
  - Increases design and balance complexity.
  - May require additional content and tuning for each faction.
- Alternatives considered:
  - Remain with a 4-tier model and add more content per tier.
- Validation approach:
  - Functional: All factions have a mapped 5-tier progression with clear unlocks and roles.
  - Integration: Tech, unit, and structure planning reference all five tiers.
  - Smoke: Scenario and test flows validate progression through all five tiers.
  - Observability: Backlog and test plans include 5-tier coverage.
- Related plan items:
  - M3 Content and Balance Pass
- Related research:
  - Entry-0009 in research/research-log.md

- Date: 2026-05-17
- Status: Accepted
- Context: Previous planning and implementation focused on two prototype human factions. Project vision and scope now require five major factions: American, Chinese, Civilian/Colony, Alien, and Robot. The robot faction will require a fully unique, non-humanoid unit and structure roster.
- Decision: Add a five-faction baseline to planning/unit-list.md and planning/tech-tree.md. All future planning, tech, and roster work must support this expanded model, with each human and alien faction mapping to the shared baselines and expressing unique asymmetry. The robot faction will be planned as a distinct, non-humanoid roster.
- Rationale:
  - Enables richer strategic diversity and replay value.
  - Forces early planning for multi-faction balance and content scalability.
  - Allows for a truly unique robot faction with different gameplay and roster logic.
- Tradeoffs:
  - Increases design, art, and balance workload.
  - Delays finalization of faction-specific content for new factions.
- Alternatives considered:
  - Continue with only two prototype factions and add more post-launch.
  - Add only one non-human faction for vertical slice.
- Validation approach:
  - Functional: All five factions can be mapped to the shared baselines and have unique progression plans (except robot, which will have a dedicated baseline).
  - Integration: Tech tree, unit list, and structure planning support five-faction scenarios.
  - Smoke: Scenario setup and test flows reference all five factions.
  - Observability: Backlog and test plans include multi-faction coverage.
- Related plan items:
  - M3 Content and Balance Pass
- Related research:
  - Entry-0008 in research/research-log.md

## ADR-0010 Unified Global Stockpile Economy with World Event Volatility

- Date: 2026-05-17
- Status: Accepted
- Context: Economy planning currently emphasizes map-control and local extraction, but the project direction now requires a united world economy where resource totals are finite and fluctuate due to random world events.
- Decision: Add a shared global stockpile model for Alloy, Power, Data, and Reclaim. All factions draw from the same finite world resource pools. Introduce periodic world events that increase or decrease available stockpiles and force strategic adaptation.
- Rationale:
  - Aligns economy behavior with world-scale scarcity and volatility goals.
  - Creates strategic pressure beyond static map extraction loops.
  - Improves replayability by adding event-driven shifts in priorities.
- Tradeoffs:
  - Adds simulation and UI complexity for global economy visibility.
  - Requires safeguards so random swings feel challenging rather than arbitrary.
- Alternatives considered:
  - Keep local infinite extraction with no world-level stockpile.
  - Use a hybrid model where only one resource has global volatility.
- Validation approach:
  - Functional: Shared stockpile values deplete and recover correctly as factions extract and spend.
  - Integration: Tech gates, map objectives, and extraction systems respond correctly to global stockpile state.
  - Smoke: Full matches remain playable under both negative and positive event swings.
  - Observability: Runtime telemetry records stockpile levels, event triggers, and extraction throughput deltas.
- Related plan items:
  - M3 Content and Balance Pass
- Related research:
  - Entry-0010 in research/research-log.md

## ADR-0011 Civilizational Transition Match Identity and One Box Premise

- Date: 2026-05-17
- Status: Accepted
- Context: Existing vision establishes RTS pillars and scale goals, but does not yet define a distinct emotional arc that differentiates the game from generic human-versus-robot framing.
- Decision: Anchor match identity to a four-era civilizational transition arc: Survival Warfare, Augmented Warfare, Autonomous War, and Post-Human War Networks. Adopt the One Box premise as core multiplayer fantasy where players represent emerging synthetic consciousnesses operating with or against human remnants.
- Rationale:
  - Gives tech progression narrative momentum inside multiplayer matches.
  - Connects economy, faction ideology, and escalation pacing into one coherent identity.
  - Creates a stronger differentiator through maintenance pressure and infrastructure warfare.
- Tradeoffs:
  - Adds narrative and systems complexity across economy, tech, and UX.
  - Requires careful readability to avoid overwhelming players during era transitions.
- Alternatives considered:
  - Keep identity framed only as classic faction asymmetry with no era-based transformation.
  - Treat One Box premise as campaign-only lore with no multiplayer mechanics impact.
- Validation approach:
  - Functional: Match states show clear era progression cues and One Box core-state effects.
  - Integration: Economy upkeep, tech gating, faction paths, and infrastructure warfare rules align to era progression.
  - Smoke: A full scenario can progress from Era 1 into at least one Era 3 state without undefined systems.
  - Observability: Telemetry captures era transition timing, instability pressure, and network-collapse outcomes.
- Related plan items:
  - M3 Content and Balance Pass
- Related research:
  - Entry-0011 in research/research-log.md

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
