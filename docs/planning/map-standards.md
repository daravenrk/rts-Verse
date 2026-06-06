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

## Shape-Forward Environment Types

Use these environment types when building battlefields intended to produce strong combat readability and good fights across multiple approach angles.

### 1. Open Basin

- Core shape: broad lowland or crater floor with long sightlines and limited hard blockers.
- Best for: armor pushes, artillery pressure, and early map reads.
- Required counterbalance: flank route, sparse cover clusters, and at least one LOS break chain to prevent pure firing-line dominance.

### 2. Broken Ridge Network

- Core shape: elevated ridges, partial ramps, and split plateaus with multiple firing shelves.
- Best for: lane choice, positional siege play, and scout value.
- Required counterbalance: more than one ascent path and at least one non-ridge bypass route.

### 3. Chokepoint Corridor Field

- Core shape: narrow passes between large blockers with intermittent pocket arenas.
- Best for: infantry timing fights, breach tools, and defense-to-counterpush transitions.
- Required counterbalance: corridor locks must always be breakable through alternate route access or destructible terrain options.

### 4. Radial Impact Zone

- Core shape: central objective crater or anchor site with spoke-like approach routes.
- Best for: Data-node fights, repeated center control swings, and readable objective gravity.
- Required counterbalance: spoke routes must vary risk profile so center control is contestable, not binary.

### 5. Fragmented Salvage Field

- Core shape: debris clusters, wreck fields, and partial cover islands spread across contested space.
- Best for: reclaim play, ambushes, and route denial without full terrain walls.
- Required counterbalance: salvage density must not create one-faction uncontestable advantage or collapse route readability.

### 6. Split-Pocket Frontier

- Core shape: several medium arenas connected by soft lanes instead of one dominant centerline.
- Best for: skirmish-style multi-front pressure, air mobility relevance, and expansion harassment.
- Required counterbalance: each pocket must reconnect into global map pressure so fights do not fragment into isolated non-interactive lanes.

### Environment Selection Rules

- Every competitive map should declare one primary environment type and at most one secondary type.
- The first duel map should prefer Radial Impact Zone, Broken Ridge Network, or Open Basin as the primary identity.
- Environment geometry should create choices, not hidden pathing traps or unreadable clutter.
- Decorative biome dressing is allowed, but it must not obscure lane readability or silhouette clarity for small 3D actors.

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

### Faction Placement Rule: Helion Center Tether

- On Helion-authored scenario layouts, the Helion Tether Point should sit at the visual and navigational center of the starting base footprint.
- Center placement means:
  - primary production branches radiate outward from the Tether Point,
  - the initial build radius is readable from all major approach angles,
  - the base silhouette communicates Helion's organized industrial structure.
- The center-Tether rule is a faction readability rule, not permission to violate overall spawn fairness.
- If strict geometric center conflicts with pathing, fairness, or required building footprint rules, use near-center placement while preserving the same visual anchor role.

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

## MVP Map Item Catalog

Use this as the source-of-truth list for placeable and interactive items in MVP maps.

### Required Strategic Items (First Duel Map)

| Item | Duel Count | Purpose | Placement Rules |
| --- | --- | --- | --- |
| Spawn Core Zone Marker | 2 | Defines valid start footprints and fairness checks | One per spawn; must match starting-footprint rules and not overlap path blockers |
| Safe Alloy Node | 2 | Guarantees opening economy stability | One per spawn inside defended footprint; cannot be shelled directly from enemy start |
| Natural Alloy Node | 2 | Creates first expansion timing decision | One per spawn at comparable travel-time bands |
| Contested Midfield Alloy Node | 2 | Forces early map interaction and denial play | Place on separable lanes so one static defense line cannot lock both |
| Contested Data Node | 1 | Triggers first high-value objective fight | Central or near-crossroads; reachable by both factions in narrow timing window |
| Reclaim Field Cluster | 1 | Rewards combat cleanup and route control | Near center conflict line; total reclaim value must not favor one spawn |

### Required Tactical Terrain Items (First Duel Map)

| Item | Duel Count | Purpose | Placement Rules |
| --- | --- | --- | --- |
| Cover Cluster | 4 to 8 | Enables infantry positioning decisions | Distribute across direct lane, flank lane, and Data approach paths |
| Chokepoint Gate | 1 to 2 | Creates contest timing and siege posture decisions | Must always have at least one alternate pressure route |
| Elevated Fire Position | 1 to 2 | Adds artillery and vision control tradeoffs | Requires counterplay access through flank, air, or multi-angle approach |
| LOS Blocker (Rock/Wreck/Structure) | 6 to 12 | Breaks single-lane dominance and supports ambush/reposition play | Mirror tactical value by exposure and route impact, not strict geometry |

### Optional MVP Extension Items (Second Map or Skirmish-Prep)

| Item | Recommended Count | Purpose | Placement Rules |
| --- | --- | --- | --- |
| Neutral Relay Tower | 1 to 2 | Temporary vision or command utility objective | Must be contestable and not safe-capturable from home perimeter |
| Destructible Bridge or Gate | 1 | Adds route-denial decision with comeback potential | Destroyed state must still leave at least one viable attack route |
| Hazard Pocket (Storm/Contamination Zone) | 1 to 3 | Introduces local risk management before full event system | Hazards cannot fully block mandatory expansion access |
| Civilian or Colony Outpost | 1 to 2 | Supports narrative-through-systems and protection choices | Place in exposed zones with at least two approach vectors |

### Item Authoring Rules

- Every item must have a stable scenario ID for observability and test notes.
- If an item grants value over time (resource, vision, utility), both players must have equivalent contest windows.
- Decorative-only props are allowed, but they must not alter collision, sight, or pathing unless documented as tactical terrain.
- MVP duel acceptance requires all required strategic and tactical items to be present before balance tuning starts.

## Map Validation Checklist

- Functional:
  - Both factions can execute intended opening build orders from either spawn.
  - Early scouting reveals enemy opening before irreversible Tier 1 commitments.
  - Selected environment type produces readable lane and objective fights without pathing ambiguity.
- Integration:
  - Resource placement, pathing, expansion timing, and combat lanes reinforce faction identity without breaking fairness.
  - Helion center-Tether placement reinforces faction readability without creating spatial advantage.
- Smoke:
  - A full match reaches expansion and first Tier 2 transition without layout-caused deadlock.
- Observability:
  - Scenario notes record spawn, first contact timing, expansion timing, and first contested node capture.
  - Scenario notes record environment type, center-objective pressure pattern, and any Helion base-anchor readability issues.
