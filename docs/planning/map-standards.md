# Map Standards

This document defines baseline standards for starting locations, lane structure, expansion layout, and resource placement.

## Goals

- Ensure fair openings for both factions without making maps feel mirrored and sterile.
- Support early scouting, expansion pressure, and mid-game map control fights.
- Keep the first vertical-slice scenario readable and testable.
- Provide measurable standards for starting positions and resource distribution.

## Core Map Types

- Duel map:
  - Designed for 1v1 validation and balance testing.
  - Primary standard for the first playable slice.
- Skirmish map:
  - Larger multi-front layout for future AI or team scenarios.
- Experimental map:
  - Allowed for mechanic stress tests, but excluded from balance decisions unless normalized later.

## Starting Position Standards

### Spawn Count and Orientation

- Duel maps must provide exactly 2 start positions.
- Start positions should be placed on opposite sides or diagonally opposite corners, never adjacent.
- Travel time from base center to base center should fall within one validated target band for the map class.

### Spawn Fairness Rules

Each start position must have:

- One safe primary Alloy deposit inside the initial defended footprint.
- One safe Power build zone with enough room for early generation structures.
- Comparable path distance to first expansion site.
- Comparable path distance to first contested Data Node.
- Comparable access to cover, ramps, and chokepoints.

Allowed asymmetry:

- Sightline shape may differ if total exposure and travel time stay equivalent.
- One spawn may have wider frontage while the other has stronger natural cover, but not both advantage types simultaneously.

### Starting Footprint

- Command structure placement area must support opening build order without immediate obstruction.
- Minimum footprint must allow:
  - command structure
  - first power structure
  - first production structure
  - first defensive or utility structure
- Builders must be able to move cleanly around the initial base without pathing traps.

## Distance Bands

Use travel-time bands rather than raw world units when validating maps.

- Rush distance:
  - Time for first light combat unit to reach enemy outer expansion.
  - Should enable pressure, but not immediate spawn trapping.
- Scout distance:
  - First scout should identify enemy opening before first major Tier 1 commitment finishes.
- Expansion distance:
  - First natural expansion should be close enough to reward map growth, but exposed enough to require protection.
- Data contention distance:
  - First contested Data Node should be reachable by both factions within a narrow timing window.

## Resource Location Standards

### Alloy Deposits

Every duel map should include:

- 1 primary safe Alloy deposit per player.
- 1 natural expansion Alloy deposit per player.
- 2 to 4 contested Alloy deposits across the midfield.
- Optional high-risk edge or corner Alloy deposits for long-game greed.

Placement rules:

- Safe deposits must not be directly shelled from enemy starting area.
- Natural expansions should require map presence, not only static defenses.
- Midfield deposits should create at least two contest paths, not a single choke-only fight.

### Power Zones

- Power is structure-generated, but maps must provide adequate buildable terrain for early and mid-game power scaling.
- Start areas and natural expansions must each include at least one viable power cluster footprint.
- Terrain should not excessively punish either dense or spread power layouts unless that is the map’s explicit purpose.

### Data Nodes

- Minimum 1 contested Data Node on duel maps.
- Recommended 2 total Data Nodes on larger duel maps so map control decisions branch.
- No Data Node should be safely capturable without leaving defended home territory.
- Data Nodes should sit near conflict lines, elevation features, or multi-path crossroads.

### Debris Fields and Reclaim

- If reclaimable debris is present, total reclaim value near each spawn must be equivalent.
- High-value debris should appear in contested zones, not exclusively in safe backlines.
- Obsidian Forge should benefit from reclaim, but map layout must not let reclaim become its uncontestable economic advantage.

## Lane and Chokepoint Standards

- Every duel map should have at least:
  - 1 direct pressure lane
  - 1 flank route
  - 1 contested center or cross-map control zone
- Chokepoints should be contestable but not fully lock the map with one static defense line.
- Artillery perches must have counterplay through flanks, air, or alternate ground routes.

## Expansion Standards

### Natural Expansion

- First expansion should be more efficient than holding multiple tiny outskirts nodes.
- It should be defendable, but not free.
- It should be reachable by both factions on their first economic branch.

### Midfield Expansion

- Must require sustained map control to hold.
- Should be vulnerable from more than one approach.
- Should reward proactive players with either stronger Alloy throughput or better Data access.

### Greed Expansion

- Optional high-risk high-reward location.
- Should not be required for basic tech progression.
- Should create a strategic gamble, not a mandatory route.

## Vertical Slice Map Template

The first playable duel map must support:

- 2 mirrored or near-mirrored start zones.
- 1 safe primary Alloy deposit per player.
- 1 natural Alloy expansion per player.
- 2 contested midfield Alloy deposits.
- 1 central Data Node.
- 1 flank route around the central conflict lane.
- 1 small reclaim field near the center.

## Map Validation Checklist

- Functional:
  - Both factions can execute intended opening build orders from either spawn.
  - Early scouting reveals enemy opening before irreversible Tier 1 commitments.
- Integration:
  - Resource placement, pathing, expansion timing, and combat lanes reinforce faction identity without breaking fairness.
- Smoke:
  - A full match reaches expansion and first Tier 2 transition without layout-caused deadlock.
- Observability:
  - Scenario notes record spawn, first contact timing, expansion timing, and first contested node capture.
