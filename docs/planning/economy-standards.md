# Economy and Pricing Standards

This document defines pricing bands, income pacing, and resource-control expectations for gameplay and balance work.

## Goals

- Make expansion and map control matter more than passive turtling.
- Keep pricing readable and internally consistent across tiers.
- Let faction asymmetry express through timing, durability, and efficiency rather than arbitrary rule exceptions.
- Preserve competitive clarity in the opening window before advanced simulation systems activate.
- Provide provisional standards before final numeric tuning begins.

## Resource Model

### Alloy

- Primary build and production resource.
- Spent on units, structures, and many upgrades.
- Main lever for expansion pressure and army growth.

### Power

- Capacity-style economy gate.
- Required to activate advanced structures and selected systems.
- Should punish greedy overbuilds, but not cause constant hard-supply frustration.

### Data

- Strategic control resource tied to capturable map objectives.
- Used for advanced research, apex unlocks, and a small number of high-impact upgrades.
- Must force players into contested map space by Tier 2.

## Competitive Opening Resource Set

For the opening competitive window, active player management should remain intentionally simple:

- Metal-equivalent: Alloy (core construction and production spend).
- Power: capacity and activation gate.
- Fuel: operational mobility and sortie pressure resource (introduced as phased MVP extension).
- Population: force-cap and colony labor ceiling.
- Optional contested Data: strategic objective resource that increases in importance by mid-game.

Opening rule:

- The first 10 to 15 minutes should prioritize expansion, scouting, harassment, and tactical territory control without requiring deep civilization-instability management.

## Phase-Gated Complexity Model

- Phase 1 Conventional Conflict:
  - Emphasize core resources and military tempo.
  - Keep advanced stability systems hidden or low-impact.
- Phase 2 Technological Divergence:
  - Increase Data and specialization pressure.
  - Introduce branch-specific efficiency and maintenance differences.
- Phase 3 Industrial War Machine:
  - Activate logistics, maintenance, and infrastructure stress as first-order constraints.
- Phase 4 Planetary Instability:
  - Escalate civilization-wide disruption effects that punish overextended macro states.

## Asymmetrically Stabilized Economies

Faction openings must remain competitively viable while late-game stabilization logic diverges.

- Human stabilization examples: morale, governance, civilian throughput, trade reliability.
- Machine stabilization examples: network integrity, processing load, cooling margin, relay synchronization.
- Alien stabilization examples: biomass coherence, psionic integrity, ecosystem compatibility.

Shared design rule:

- Different faction stabilization models must serve equivalent gameplay purpose so no faction is invalidated at equal skill in opening and mid-game windows.

## Unified Global Stockpile Model

- The world economy is shared across all factions.
- Alloy, Power, Data, and Reclaim each have a finite global stockpile.
- Resource extraction and conversion always pull from global stockpiles rather than infinite local supply.
- Local map control still matters because deposits, nodes, and reclaim fields determine who can access the remaining global resources first.

### Stockpile Behavior

- Each resource has a world reserve value with a minimum floor of zero.
- If a stockpile reaches zero, related extraction output is reduced or halted until recovery events occur.
- Reclaim returns value into usable faction income but does not create infinite global supply.

### First-Pass Global Stockpile Caps and Depletion Rules

Use these values as planning baselines for first simulation passes. They are intentionally conservative and should be tuned after volatility testing.

| Resource | Global Cap (World Reserve) | Soft Depletion Threshold | Hard Depletion Threshold | Recovery Trigger |
| --- | --- | --- | --- | --- |
| Alloy | 200000 | 30 percent remaining | 10 percent remaining | map reclaim events, salvage surges, and controlled world-discovery events |
| Power | 160000 | 35 percent remaining | 12 percent remaining | vent stabilization events and infrastructure restoration windows |
| Data | 120000 | 40 percent remaining | 15 percent remaining | relay-cache discoveries and objective retake pulses |
| Reclaim | 100000 | 25 percent remaining | 8 percent remaining | debris-field refresh events and major battle aftermath |

Depletion behavior by threshold:

- Above soft threshold:
  - Normal extraction and conversion behavior.
- At or below soft threshold:
  - Extraction throughput multiplier: `0.85`.
  - Event cadence increases for both positive and negative stockpile effects.
  - UI should raise non-blocking warning state for all players.
- At or below hard threshold:
  - Extraction throughput multiplier: `0.60`.
  - Conversion efficiency penalties apply to credit-to-alloy and similar bridging systems.
  - Objective-control bonuses are increased slightly to preserve comeback windows through map play.

Floor and anti-collapse rules:

- No stockpile may go below zero.
- Negative events cannot reduce any stockpile by more than 7 percent of cap in one event.
- Positive events cannot increase any stockpile by more than 10 percent of cap in one event.
- Two consecutive events may not target the same resource with the same polarity in the same short window.

### Random World Events

- Random world events periodically modify one or more global stockpiles.
- Event outcomes can be positive (discovery, efficiency breakthrough) or negative (disaster, disruption, contamination).
- Event effects must be bounded so volatility shifts strategy without making match outcomes purely random.
- Event impacts should be surfaced clearly to all players through shared notifications.

### First-Pass Random World Event Table (Bounded)

Cadence and targeting guardrails:

- Baseline event check interval: every 120 seconds.
- Effective event fire window: random roll inside 105 to 135 seconds.
- Minimum cooldown after any event: 75 seconds.
- Maximum consecutive events with same polarity: 2.
- If one resource was targeted in the last event, next event must target a different resource unless all others are at cap or floor constraints.

Positive event bounds:

- Single event increase may not exceed 10 percent of global cap.
- Positive effects are reduced by 30 percent when the target resource is above 80 percent of cap.

Negative event bounds:

- Single event decrease may not exceed 7 percent of global cap.
- Negative effects are reduced by 35 percent when the target resource is below hard depletion threshold.

| Event ID | Event Name | Polarity | Target Resource | Magnitude Rule | Duration or Window | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| E-001 | Salvage Rush | Positive | Reclaim | +6 percent of cap | instant | Triggered by major battlefield recovery operations. |
| E-002 | Deep Vein Discovery | Positive | Alloy | +5 percent of cap | instant | Discovery event at remote extraction zones. |
| E-003 | Grid Stabilization Breakthrough | Positive | Power | +4 percent of cap | instant | Temporary generation optimization at vent network. |
| E-004 | Signal Cache Recovery | Positive | Data | +5 percent of cap | instant | Relay-cache decode by contested objective holders. |
| E-005 | Convoy Contract Windfall | Positive | Alloy and Reclaim | +3 percent Alloy, +3 percent Reclaim | instant | Civilian-trade bonus with mixed material gains. |
| E-006 | Refinery Chain Disruption | Negative | Alloy | -5 percent of cap | instant | Industrial sabotage or geological instability. |
| E-007 | Relay Blackout | Negative | Power | -4 percent of cap | instant | Grid interruption reduces available world reserve. |
| E-008 | Data Plague Cascade | Negative | Data | -5 percent of cap | instant | Signal contamination and archive corruption burst. |
| E-009 | Debris Field Collapse | Negative | Reclaim | -4 percent of cap | instant | Reclaim lanes become unsafe or inaccessible. |
| E-010 | Orbital Shockfront | Negative | Alloy and Power | -3 percent Alloy, -3 percent Power | instant | Multi-resource disruption event with bounded impact. |

Selection weighting rules:

- Under soft depletion: increase positive-event weight by 20 percent for the depleted resource.
- Under hard depletion: increase positive-event weight by 35 percent and reduce negative-event weight by 25 percent for that resource.
- Above 90 percent of cap: reduce positive-event weight by 40 percent for that resource.
- Mixed-resource events are limited to 20 percent of total event rolls to avoid over-coupled swings.

## World Resource Sources and Monetary Layer (S-2003)

### World Source Mapping

| Resource | World Source Types | Primary Contest Pattern | Biome Sensitivity |
| --- | --- | --- | --- |
| Alloy | crust deposits, salvage seams, wrecked industrial fields | lane anchors and natural expansions | high: harsh biomes lower node yield; fertile biomes increase sustained extraction windows |
| Power | thermal vents, reactor ruins, geomagnetic ridges | chokepoints and upland control | medium: cold and storm biomes reduce vent uptime; temperate biomes stabilize output |
| Data | relay spires, orbital shard caches, signal vaults | central and flank objective races | low to medium: weather clutter affects capture safety more than raw value |
| Reclaim | debris fields, ruined convoys, collapsed fortifications | post-fight cleanup and denial loops | medium: dense flora and rubble raise reclaim time variance |

### Monetary Layer: Credits

- Credits are a secondary conversion layer for colony and trade systems.
- Credits are generated from civilian throughput, trade hubs, and mission contracts.
- Credits can convert into strategic boosts but cannot replace core military resource loops.
- Conversion rules:
  - Credits to Alloy conversion is rate-limited and suffers diminishing returns under heavy conversion use.
  - Credits cannot directly generate Data.
  - Credits can offset selected upkeep penalties during temporary infrastructure disruption.

### Biome Impact Rule

- Desolate biomes:
  - Lower baseline Alloy and Reclaim density.
  - Lower colony credit generation ceiling.
- Fertile biomes:
  - Higher baseline Alloy and Reclaim density.
  - Higher colony credit generation ceiling with increased raid exposure through dense terrain.

Consistency rule:

- World-source mappings and credit conversion must never violate global stockpile floors.

## Pricing Framework

Use category bands first. Exact numbers can be assigned later inside these relationships.

### Unit Cost Bands

- Small:
  - Baseline infantry, scouts, engineers, light harassment units.
  - Expected to be fielded in early multiples.
- Medium:
  - Mainline vehicles, transports, support vehicles, core tactical tools.
  - Represents meaningful commitment, but still repeat-build territory.
- Large:
  - Heavy walkers, artillery, premium aircraft, high-impact specialty units.
  - Should require either stable two-base Alloy flow or strong map advantage.
- Apex:
  - Endgame centerpiece units.
  - Must require dedicated tech investment, strong economy, and vulnerability window during production.

### Structure Cost Bands

- Low:
  - Early power, early extraction, basic scouting or utility structures.
- Medium:
  - Barracks-equivalent and first combat production structures.
- High:
  - Tier 2 production, advanced research, fortress-grade defense.
- Apex:
  - Endgame tech structures, faction super-system unlocks.

### Upgrade Cost Bands

- Minor:
  - Small role refinements, quality-of-life boosts, situational detection upgrades.
- Major:
  - Meaningful power spikes for a class or strategy branch.
- Strategic:
  - Tech-path-defining upgrades requiring Data or notable power commitment.

## Pricing Rules by Tier

### Tier 0

- Opening structures and units must permit scouting, builder production, first extractor, first power, and first combat production without economic deadlock.
- Players should be able to recover from one minor opening mistake.

### Tier 1

- Basic combat units should be cheap enough to fight for first map control.
- Mainline vehicles should represent the first real branching point between expansion and pressure.
- Static defense should be cheaper than losing an expansion, but more expensive than scouting and responding correctly.

### Tier 2

- Tier 2 must feel earned, not routine.
- Reaching Tier 2 should require either:
  - stable control of natural expansion plus competent macro, or
  - temporary economic sacrifice that exposes the player elsewhere.
- Data cost must prevent blind tech rushing with zero map interaction.

### Tier 3

- Apex production must be rare in the first playable slice and not a default match outcome.
- Tier 3 should reward map control, not only passive time survived.

## Economic Pacing Standards

### Opening Phase

- Safe home Alloy sustains opening economy only.
- Single-base play should not fully support long-term Tier 1 army spam plus rapid tech plus safe defense.
- First expansion timing should occur before stalemate if both players play correctly.

### Mid-Game Phase

- Holding a natural expansion should materially change production capacity.
- Controlling one Data Node should unlock options, not guarantee victory.
- Controlling both Alloy advantage and Data advantage should create momentum, but still allow tactical comeback paths.

### Late-Game Phase

- Two or more controlled economic zones plus Data access should be the normal threshold for consistent Tier 3 access.
- Reclaim and map denial should matter more in late game than raw passive income alone.

## Resource Control Standards

- Map control must convert into measurable economic leverage.
- Players who hold contested nodes should gain strategic options, not only bigger numbers.
- Home economy must be enough to stay alive, but not enough to ignore the map.
- Comeback windows should exist through raids, reclaim denial, and contested node flips.
- Global stockpile pressure must reward adaptability and timing, not passive waiting.

## Faction Economic Identity

### Helion Directorate

- Faster timing windows.
- Smoother early production and redeployment.
- Slightly more vulnerable to prolonged attrition if map control is lost.
- Premium mobility and shield-based timing tools may justify slightly sharper power demands.

### Obsidian Forge

- Stronger value from reclaim and fortified expansions.
- Slower power ramp but better durability and long-game economic conversion.
- More tolerant of drawn-out wars if map denial and salvage are functioning.
- Must not be allowed to outscale by doing nothing; reclaim and map presence should be required.

## Opening Stabilization Model (Helion and Veyari MVP)

Use this baseline to keep opening outcomes equivalent while preserving faction expression.

### Stabilization Levers

- Helion:
  - Acceleration bias through faster setup and redeploy cadence.
  - Stabilization cost is slightly higher exposure if early map control is surrendered.
- Veyari:
  - Conversion bias through resilient follow-through after first engagements.
  - Stabilization cost is slightly later first major timing unless map pressure is won.

### Parity Guardrails (Opening Window)

- Expansion timing delta target: `<= 8s` between Helion and Veyari.
- First factory timing delta target: `<= 8s` between Helion and Veyari.
- First contested objective timing delta target: `<= 8s` between Helion and Veyari.
- Advanced civilization systems remain disabled during opening parity checks.

### F-21 Telemetry Mapping

- `expansion_delta_sec` maps to first natural expansion completion timestamp.
- `factory_delta_sec` maps to first T1 production structure ready timestamp.
- `objective_delta_sec` maps to first contested objective secured timestamp.
- Any parity guardrail breach marks opening stabilization as failed and requires retuning.

## Pricing Sanity Rules

- No direct upgrade should invalidate an entire lower-tier unit class immediately.
- A medium unit should not outperform two small units in every circumstance.
- A large unit should require support or protection to realize full value.
- Static defenses must buy time, not replace army presence.
- Data-gated upgrades should change decisions, not only raw efficiency curves.

## Vertical Slice Standards

For first playable implementation:

- Assign numeric cost bands for all locked vertical-slice units and Tier 0 to Tier 1 structures.
- Validate that one safe extractor plus one natural expansion is the expected path to sustained Tier 1 pressure.
- Require at least one Data-linked objective in the slice even if advanced Data spending is limited.
- Maintain one shared MVP balance-sheet draft that maps directly to locked units and structures.

## First Balance Sheet Draft (MVP)

Use this table as the first playable numeric baseline. Values are intentionally conservative and should be tuned through F-16, F-17, F-20, and F-21 results.

### Resource Keys

- Alloy: primary build spend.
- Power: activation footprint consumed while active.
- Data: strategic gate spend.
- Population: force-cap consumption.

### Shared MVP Structures (T0 to T1)

| Structure | Tier | Alloy | Power | Data | Build Time (s) | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Power Core | T0 | 120 | 0 | 0 | 18 | Grants +120 power capacity. |
| Alloy Extractor | T0 | 90 | 10 | 0 | 14 | Baseline extractor footprint per node. |
| Barracks-equivalent | T0 | 160 | 20 | 0 | 20 | Unlocks core infantry package. |
| Light Defense Node | T0 or T1 | 140 | 25 | 0 | 20 | Early delay tool, not full lockdown. |
| Vehicle Structure | T1 | 240 | 40 | 0 | 28 | Unlocks Raider and mainline vehicle roles. |
| Sensor or Uplink Structure | T1 | 180 | 35 | 0 | 24 | Required for map information and reveal tools. |
| Expansion Hub or Radius Extender | T1 | 220 | 35 | 0 | 26 | Enables forward build radius at natural expansion. |

### Helion MVP Units

| Unit | Tier | Alloy | Power | Data | Population | Build Time (s) |
| --- | --- | --- | --- | --- | --- | --- |
| Surveyor Drone | T0 | 50 | 2 | 0 | 1 | 8 |
| Line Engineer | T0 | 70 | 2 | 0 | 1 | 10 |
| Lancer Squad | T0 | 65 | 2 | 0 | 1 | 9 |
| Breach Team | T0 | 75 | 2 | 0 | 1 | 10 |
| Field Medic | T0 | 80 | 3 | 0 | 1 | 11 |
| Strider Bike | T1 | 110 | 4 | 0 | 2 | 13 |
| Ember Tank | T1 | 210 | 8 | 0 | 4 | 22 |

### Veyari MVP Units

| Unit | Tier | Alloy | Power | Data | Population | Build Time (s) |
| --- | --- | --- | --- | --- | --- | --- |
| Echo Skimmer | T0 | 50 | 2 | 0 | 1 | 8 |
| Brood Architect | T0 | 70 | 2 | 0 | 1 | 10 |
| Needle Brood | T0 | 65 | 2 | 0 | 1 | 9 |
| Rift Claw | T0 | 75 | 2 | 0 | 1 | 10 |
| Spore Warden | T0 | 80 | 3 | 0 | 1 | 11 |
| Skitter Lance | T1 | 110 | 4 | 0 | 2 | 13 |
| Bulwark Husk | T1 | 210 | 8 | 0 | 4 | 22 |

### First-Pass Upkeep Rules

- No upkeep for T0 combat units during opening window.
- T1 vehicles apply low upkeep while active:
  - Raider class: 1 Alloy per 30 seconds.
  - Mainline armor class: 2 Alloy per 30 seconds.
- Upkeep pauses while a unit is under construction.
- Upkeep penalties must never reduce stockpiles below zero; production slowdown is preferred over negative values.

## Colony and Civilian Pricing Baseline (First Pass)

Use this table for first implementation of colony-economy and local-defense systems.

### Colony and Civilian Structures

| Structure | Tier | Alloy | Power | Data | Build Time (s) | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Habitat Complex | T0 | 180 | 20 | 0 | 24 | Enables population housing and emergency civilian support production. |
| Logistics Hub | T0 | 160 | 25 | 0 | 22 | Unlocks cargo throughput and convoy routing baseline. |
| Civic Planning Office | T1 | 230 | 35 | 0 | 28 | Enables colony expansion and infrastructure upgrade path. |
| Civilian Market | T1 | 210 | 30 | 0 | 26 | Adds credits throughput and trade conversion pressure. |
| Militia Barracks | T1 | 220 | 35 | 0 | 28 | Produces local colony-defense units. |
| Security Command Post | T2 | 320 | 55 | 20 | 36 | Unlocks advanced defensive response and heavy colony security units. |
| Civil Airfield | T2 | 340 | 60 | 20 | 38 | Enables evacuation and colony air logistics units. |
| Governance Center | T3 | 520 | 90 | 70 | 52 | High-commitment late colony command node and resilience amplifier. |

### Colony and Civilian Units

| Unit | Tier | Alloy | Power | Data | Population | Build Time (s) |
| --- | --- | --- | --- | --- | --- | --- |
| Colony Worker | T0 | 55 | 2 | 0 | 1 | 9 |
| Cargo Hauler | T0/T1 | 85 | 3 | 0 | 2 | 12 |
| Civil Engineer Team | T1 | 95 | 3 | 0 | 1 | 13 |
| Emergency Medic Team | T1 | 80 | 3 | 0 | 1 | 11 |
| Security Militia Squad | T1 | 90 | 3 | 0 | 1 | 12 |
| Patrol Buggy | T1 | 130 | 5 | 0 | 2 | 16 |
| Peacekeeper Walker | T2 | 260 | 9 | 20 | 4 | 28 |
| Evacuation Shuttle | T2 | 240 | 8 | 20 | 3 | 24 |

### Colony and Civilian Upkeep Rules

- Civilian logistics units:
  - Cargo Hauler upkeep: 1 Alloy per 45 seconds while active.
- Colony defense units:
  - Security Militia Squad upkeep: 1 Alloy per 60 seconds.
  - Patrol Buggy upkeep: 1 Alloy per 40 seconds.
  - Peacekeeper Walker upkeep: 2 Alloy per 30 seconds.
- Civil air logistics:
  - Evacuation Shuttle upkeep: 1 Alloy per 35 seconds.
- Structure upkeep baseline:
  - Civilian Market: 1 Alloy per 50 seconds.
  - Security Command Post: 2 Alloy per 40 seconds.
  - Governance Center: 3 Alloy per 35 seconds.
- Upkeep suspension and safety:
  - Upkeep pauses when owning structure or unit is disabled.
  - Upkeep penalties cannot force negative stockpile values; fallback behavior is reduced throughput.

## Validation Checklist

- Functional:
  - Players can complete opening build orders and sustain early combat production.
  - Expansion creates visible economic advantage within the same match.
  - Shared stockpile depletion and replenishment behave predictably under extraction and event effects.
- Integration:
  - Map resource layout and tech timing reinforce the intended faction identities and tier gates.
  - World event modifiers correctly affect extraction, tech pacing, and spending decisions.
- Smoke:
  - Matches do not collapse into single-base stalemate or uncontestable snowball by default.
  - Negative event sequences do not produce irreversible hard-lock states.
- Observability:
  - Track expansion timing, unit production cadence, idle resource float, and first Data capture.
  - Track stockpile trend lines, event frequency, and per-faction extraction share.
