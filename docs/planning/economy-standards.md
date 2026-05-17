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

### Random World Events

- Random world events periodically modify one or more global stockpiles.
- Event outcomes can be positive (discovery, efficiency breakthrough) or negative (disaster, disruption, contamination).
- Event effects must be bounded so volatility shifts strategy without making match outcomes purely random.
- Event impacts should be surfaced clearly to all players through shared notifications.

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
- Document initial price sheet separately once numbers are chosen.

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
