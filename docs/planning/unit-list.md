# Unit List

## Faction Baseline

The project will support five major factions:

- Human Faction 1: American (military/industrial theme)
- Human Faction 2: Chinese (military/industrial theme)
- Human Faction 3: Frontier Covenant (civilian/colony, non-state survival and logistics coalition)
- Alien Faction: Veyari Ascendancy
- Robot Faction: Promethean Assembly (fully unique, non-humanoid units and structures)

Each human and alien faction must map to the Any-Faction Core Roster Baseline, Colony/Civilian Baseline, and Structure Baseline, with unique flavor, tech, and asymmetry.

The Robot faction will require a distinct, non-humanoid unit and structure roster, with new planning sections to be added.

Faction-specific names and baseline flavor notes are now defined below. Full roster details for non-MVP factions continue in future planning passes.

## Faction Flavor Notes (Placeholder-to-Production Bridge)

| Faction | Short Identity Note | Battlefield Flavor Direction |
| --- | --- | --- |
| American Expeditionary Command | High-tempo expedition force with precision logistics | Mobile combined-arms pressure and timing windows |
| Chinese Systems Front | Layered doctrine with disciplined infrastructure scaling | Methodical power spikes through coordinated tech timing |
| Frontier Covenant | Civilian-colony coalition with improvised resilience tools | Throughput protection, convoy defense, and adaptive local militias |
| Veyari Ascendancy | Bio-gravity swarm with asymmetric growth logic | Organic pressure, lane disruption, and adaptation under contest |
| Promethean Assembly | Distributed machine consensus war-network | Non-humanoid modular forces with relay-centric command behavior |

## Robot Faction Planning Section: Promethean Assembly

The Promethean Assembly must not reuse humanoid silhouettes or conventional infantry assumptions.

### Robot Roster Design Constraints

- Unit silhouettes should be machine-native (crawler, pod, lattice, articulated frames), not human proxies.
- Command logic should emphasize network nodes, relay bandwidth, and distributed autonomy.
- Recovery and attrition should rely on reassembly and relay restoration, not medical sustain analogs.

### Robot Baseline Unit Roles (Planning Draft)

| Role | Candidate Unit Concept | Core Function |
| --- | --- | --- |
| Scout | Threadseer Drone Cluster | Fast distributed vision and signal mapping |
| Builder | Forge Weaver Node | Structure deployment and relay stitching |
| Baseline Line Unit | Lattice Carbine Frame | Mainline anti-light pressure |
| Breach Unit | Ram-Spike Chassis | Close anti-structure assault |
| Support | Synchrony Beacon Pod | Network buff and repair throughput |
| Light Vehicle | Razor Track Swarm | Harassment and flank denial |
| Mainline Armor | Bastion Hex Walker | Durable front control |
| Siege | Arc Mortar Array | Indirect pressure and zone denial |
| Anti-Air | Sky-Splitter Grid Rig | Escort anti-air and denial field |
| Apex | Consensus Titan Kernel | Endgame command-pressure centerpiece |

### Robot Baseline Structures (Planning Draft)

| Structure Class | Candidate Name | Role |
| --- | --- | --- |
| Primary Command Structure | Consensus Core | Command authority and relay root |
| Power Equivalent | Flux Conduit Stack | Power routing and stability margin |
| Alloy Equivalent | Foundry Siphon | Material extraction and reclaim conversion |
| Barracks Equivalent | Assembly Spindle | Baseline combat frame production |
| Vehicle Structure | Chassis Vault | Mobile chassis and heavy frame assembly |
| Sensor/Uplink | Signal Lattice Hub | Detection, relay amplification, and network range |
| Expansion Hub | Relay Anchor Node | Forward command radius and distributed build reach |
| Advanced Ground Structure | War Calculus Crucible | Heavy and siege unlock path |
| Air Structure | Aerial Fabrication Coil | Drone-wing and strike swarm unlock path |

This document defines the planned roster for both prototype factions.

## Any-Faction Core Roster Baseline

Use this baseline for any new faction concept so role coverage is complete before faction-specific asymmetry is layered in.

### Core Unit List

| Unit | Class | Tier | Produced From | Cost | Role | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Recon Scout | Utility Vehicle or Utility Air | T0 | Command structure | Small | Early scouting and map vision | Fast and lightly armed or unarmed |
| Combat Engineer | Builder Infantry | T0 | Command structure | Small | Construction, repair, expansion setup | Required for economy and tech progression |
| Line Infantry | Rifle Infantry | T0 | Barracks-equivalent | Small | Baseline anti-infantry and objective control | Reliable generalist combat unit |
| Breach Infantry | Assault or Demolition Infantry | T0 | Barracks-equivalent | Small | Close-range anti-structure and anti-armor pressure | Short range and counterable in open ground |
| Field Support Team | Support Infantry | T0 | Barracks-equivalent | Small | Sustain, healing, or repair support | Low direct damage |
| Raider Vehicle | Light Vehicle | T1 | Vehicle structure | Small | Harassment, flanking, and chase | Speed-focused with low durability |
| Main Battle Vehicle | Tank or Heavy Vehicle | T1 | Vehicle structure | Medium | Mainline ground fighting power | Core frontline unit for midgame pushes |
| Mobile AA | Support Vehicle | T1 or T2 | Vehicle structure | Medium | Escort anti-air coverage | Keeps air play interactive and punishable |
| Siege Platform | Artillery or Siege Vehicle | T2 | Advanced ground structure | Large | Break static fronts and force movement | Requires vision and frontline protection |
| Heavy Breaker | Heavy Walker or Assault Vehicle | T2 | Advanced ground structure | Large | Durable spearhead and zone control | Expensive anchor unit |
| Fighter | Interceptor Aircraft | T2 | Carrier or Airfield | Medium | Air superiority and anti-air interception | Must be cost-effective against strike craft |
| Corvette | Strike Aircraft | T2 | Carrier or Airfield | Medium or Large | Anti-armor and anti-ship strike role | Lower dogfight efficiency than Fighter |
| Tactical Transport | Utility Aircraft | T2 | Airfield | Medium | Rapid redeploy and extraction | Enables multi-front pressure |
| Carrier | Capital Command Vessel | T2 or T3 | Naval Yard or Air Command | Large or Apex | Mobile launch and recovery base for Fighters and Corvettes | Limited direct firepower; force multiplier through hosted craft |
| Apex Unit | Endgame centerpiece | T3 | Apex structure | Apex | Decisive late-game pressure tool | Must require clear economic and tech commitment |

### MVP Buildable Structure Baseline

These are the core items a player can build on MVP maps. They define the minimum structure set for duel scenario implementation.

| Structure Class | Tier | Build Source | Cost Band | Primary Function | MVP Constraints |
| --- | --- | --- | --- | --- | --- |
| Tether Point (Primary Base Structure) | T0 | Match start spawn creation only | N/A at start | Base anchor, build radius source, opening production, command continuity | Exactly 1 created per player at match start; see Tether Point rules below |
| Power Core | T0 | Builder unit | Low | Provides baseline power for early production | Must be available from Tether Point unlock set |
| Alloy Extractor | T0 | Builder unit | Low | Harvests Alloy from valid map node | Requires Alloy node footprint and ownership check |
| Barracks-Equivalent | T0 | Builder unit | Medium | Produces opening infantry and support units | Must unlock at least baseline infantry, breach infantry, and sustain support |
| Light Defense Node | T0 or T1 | Builder unit | Medium | Early perimeter defense and delay tool | Must not fully lock all attack routes from one placement cluster |
| Vehicle Structure | T1 | Builder unit | Medium | Produces light and mainline vehicles | Requires Barracks-Equivalent plus minimum power margin |
| Sensor or Uplink Structure | T1 | Builder unit | Medium | Detection, scouting support, tactical information | Must include at least one active or passive reveal capability |
| Expansion Hub or Radius Extender | T1 | Builder unit | Medium | Forward build radius and expansion logistics enablement | Must be contestable when placed at natural expansion |
| Advanced Ground Structure | T2 | Builder unit | High | Unlocks heavy/siege/AA midgame roster elements | Requires Data-linked progression gate |
| Air Structure | T2 | Builder unit | High | Produces air strike and transport units | Must maintain compatibility with shared air basing rules |

### Tether Point Primary Base Rules

The Tether Point is the shared gameplay role for each faction's first base structure.

| Rule | Definition |
| --- | --- |
| Creation | Auto-created at each valid spawn when match begins. |
| Ownership | Permanent to player slot unless destroyed; cannot be captured in MVP. |
| Build Radius | Defines initial legal build radius and enables first expansion chain. |
| Opening Production | Must produce one scout-class unit and one builder-class unit. |
| Opening Unlock Set | Must unlock Power Core, Alloy Extractor, and Barracks-Equivalent structures. |
| Command Dependency | Loss applies severe command penalties (for example reduced order throughput and delayed command response) but does not force immediate defeat if at least one secondary command-capable structure exists. |
| Recovery Path | Player can restore stable command state by completing a replacement command-capable structure through expansion tech path. |
| Observability | Spawn time, damage, destruction time, and recovery state transitions must be logged with stable structure IDs. |

### Faction Mapping for Tether Point Role

| Shared Role | Helion | Obsidian | Veyari |
| --- | --- | --- | --- |
| Tether Point | Command Spire | Forge Nexus | Descent Spire |

### Carrier and Airfield Basing Rules

- Carrier:
  - Hosts and launches Fighter and Corvette squadrons.
  - Can rearm and repair hosted craft while out on the map.
  - Should project power by position and timing, not raw solo DPS.
- Airfield:
  - Produces and services Fighter, Corvette, and Tactical Transport.
  - Provides safer sustained air production than a forward carrier.
  - Should be a high-value strategic target in base raids.
- Shared constraints:
  - Fighters and Corvettes must always have at least one valid home base (Carrier or Airfield).
  - Loss of all valid home bases should reduce sortie tempo until a base is rebuilt.
  - Carrier-based and airfield-based craft must share role identities while allowing faction-specific stat asymmetry.

### Colony and Civilian Unit List

| Unit | Class | Tier | Produced From | Cost | Role | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Colony Worker | Civilian Utility Infantry | T0 | Habitat Complex | Small | Build-assist, logistics, and economy upkeep | Non-combat by default |
| Cargo Hauler | Civilian Transport Vehicle | T0 or T1 | Logistics Hub | Small | Moves goods between economy and colony structures | Vulnerable and escort-dependent |
| Civil Engineer Team | Civilian Support Infantry | T1 | Civic Planning Office | Medium | Expands colony footprint and accelerates repairs | Weak in combat, high infrastructure value |
| Emergency Medic Team | Civilian Support Infantry | T1 | Habitat Complex | Small | Stabilizes civilian casualties and boosts recovery uptime | No frontline durability |
| Security Militia Squad | Defensive Infantry | T1 | Militia Barracks | Small | Local defense against raids and light harassment | Inferior to dedicated army infantry |
| Patrol Buggy | Light Security Vehicle | T1 | Militia Barracks | Medium | Fast response and convoy escort | Good vision, low sustained DPS |
| Peacekeeper Walker | Defensive Support Walker | T2 | Security Command Post | Large | Colony perimeter anchor and riot-control style denial | Strong near colony structures, weak in open assault |
| Evacuation Shuttle | Civilian Utility Aircraft | T2 | Civil Airfield | Medium | Emergency extraction and rapid civilian relocation | Low direct combat value |

### Colony and Civilian Structure Baseline

| Structure | Tier | Cost Band | Purpose | Notes |
| --- | --- | --- | --- | --- |
| Habitat Complex | T0 | Medium | Population housing and civilian unit production | Enables Colony Worker and Emergency Medic Team |
| Logistics Hub | T0 | Medium | Freight routing and supply throughput | Enables Cargo Hauler and boosts economy consistency |
| Civic Planning Office | T1 | Medium | Unlocks colony expansion tools | Enables Civil Engineer Team and urban upgrades |
| Civilian Market | T1 | Medium | Trade income and local economic resilience | Valuable but vulnerable economic target |
| Militia Barracks | T1 | Medium | Trains local defensive forces | Enables Security Militia Squad and Patrol Buggy |
| Security Command Post | T2 | High | Coordinates advanced colony defense | Enables Peacekeeper Walker and defense upgrades |
| Civil Airfield | T2 | High | Supports evacuation and colony air logistics | Enables Evacuation Shuttle and civilian airlift |
| Governance Center | T3 | Apex | Late-game civilian command and stability bonuses | Improves colony output and recovery after raids |

## Cost Model

Relative costs use Small, Medium, Large, and Apex to support planning before numerical balance is set.

## Helion Directorate

| Unit | Class | Tier | Produced From | Cost | Role | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Surveyor Drone | Utility Air | T0 | Command Spire | Small | Scout and vision extension | Fast unarmed recon drone |
| Line Engineer | Builder Infantry | T0 | Command Spire | Small | Construct buildings and repair | Core expansion unit |
| Lancer Squad | Rifle Infantry | T0 | Barracks Node | Small | Baseline anti-infantry line troop | Good move speed |
| Breach Team | Heavy Infantry | T0 | Barracks Node | Small | Close-range structure and armor pressure | Vulnerable in open ground |
| Field Medic | Support Infantry | T0 | Barracks Node | Small | Sustain infantry pushes | Weak combat output |
| Strider Bike | Light Vehicle | T1 | Motor Pool | Small | Harassment, scouting, flanking | Fragile but quick |
| Bulwark APC | Transport Vehicle | T1 | Motor Pool | Medium | Infantry delivery and skirmish support | Front shield arc |
| Ember Tank | Mainline Tank | T1 | Motor Pool | Medium | General-purpose armored pressure | Core Helion battle tank |
| Aegis Walker | Heavy Walker | T2 | War Foundry | Large | Frontline anchor and shield projection | Supports spearheads |
| Sunforge Artillery | Siege Vehicle | T2 | War Foundry | Large | Long-range bombardment | Needs vision support |
| Sable AA Platform | Support Vehicle | T2 | War Foundry | Medium | Anti-air and drone denial | Limited ground damage |
| Raptor Gunship | Attack Aircraft | T2 | Sky Anchor | Large | Mobile anti-armor strike craft | Strong burst, vulnerable to AA |
| Halo Transport | Utility Aircraft | T2 | Sky Anchor | Medium | Rapid deployment and extraction | Enables aggressive positioning |
| Solarch Titan | Apex Walker | T3 | Ascendant Core | Apex | Decisive assault centerpiece | Expensive and population heavy |

## Obsidian Forge

| Unit | Class | Tier | Produced From | Cost | Role | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Reclaimer | Utility Vehicle | T0 | Forge Nexus | Small | Scout, reclaim, and light build assist | Fuels attrition economy |
| Foundry Engineer | Builder Infantry | T0 | Forge Nexus | Small | Construct buildings, fortify positions, repair | Slower than Helion engineer |
| Warder Team | Rifle Infantry | T0 | Muster Hall | Small | Defensive line infantry | Strong in cover and garrison |
| Breacher Team | Demolition Infantry | T0 | Muster Hall | Small | Anti-structure and close assault | Short effective range |
| Repair Crew | Support Infantry | T0 | Muster Hall | Small | Field repair and sustain | Can stabilize armor lines |
| Maul Rover | Light Vehicle | T1 | Tread Assembly | Small | Fast skirmish and pursuit | Better durability than Helion bike |
| Bastion Carrier | Support Vehicle | T1 | Tread Assembly | Medium | Mobile bunker and infantry anchor | Encourages slow pushes |
| Cinder Mortar | Siege Vehicle | T1 | Tread Assembly | Medium | Indirect fire and area denial | Requires protection |
| Anvil Walker | Heavy Walker | T2 | Siege Crucible | Large | Durable assault and zone control | Slow but efficient |
| Ruin Launcher | Heavy Artillery | T2 | Siege Crucible | Large | Long-range siege and fortification break | Setup time before firing |
| Bastion AA Rig | Support Vehicle | T2 | Siege Crucible | Medium | Anti-air umbrella and escort | Strong stationary profile |
| Ashwing Bomber | Strike Aircraft | T2 | Aero Furnace | Large | Bombing runs against clustered targets | Long turnaround time |
| Hoist Lifter | Utility Aircraft | T2 | Aero Furnace | Medium | Heavy transport and salvage lift | Reposition tool |
| Worldbreaker Colossus | Apex Siege Engine | T3 | Cataclysm Engine | Apex | Endgame siege finisher | Dominates static fronts |

## Veyari Ascendancy (Alien MVP)

| Unit | Class | Tier | Produced From | Cost | Role | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Echo Skimmer | Utility Air | T0 | Descent Spire | Small | Scout and early map read | Fast recon with low durability |
| Brood Architect | Builder Infantry | T0 | Descent Spire | Small | Construction, healing growths, expansion setup | Core alien macro unit |
| Needle Brood | Rifle Swarm Infantry | T0 | Clutch Hive | Small | Baseline anti-infantry objective pressure | High DPS in short bursts |
| Rift Claw | Assault Infantry | T0 | Clutch Hive | Small | Close anti-armor and anti-structure pressure | Vulnerable to focus fire |
| Spore Warden | Support Infantry | T0 | Clutch Hive | Small | Area sustain and debuff support | Low direct damage |
| Skitter Lance | Light Vehicle | T1 | Carapace Forge | Small | Fast flanking and chase pressure | Excels in side lanes |
| Bulwark Husk | Mainline Armor | T1 | Carapace Forge | Medium | Durable frontline and escort | Slower but efficient |
| Mire Spitter | Siege Vehicle | T1 | Carapace Forge | Medium | Early indirect pressure and zone denial | Needs vision support |
| Rift Behemoth | Heavy Breaker | T2 | Gravity Crucible | Large | Spearhead and area control | Strong anchor, costly |
| Singularity Lobber | Heavy Artillery | T2 | Gravity Crucible | Large | Long-range break of static positions | Setup delay before fire |
| Veil Thorn Battery | Mobile AA | T2 | Gravity Crucible | Medium | Air denial and escort support | Limited anti-ground |
| Talon Ray | Strike Aircraft | T2 | Sky Brood Nexus | Large | Precision anti-armor strike | Vulnerable to concentrated AA |
| Spire Carrier | Utility Aircraft | T2 | Sky Brood Nexus | Medium | Rapid redeploy and brood reinforcement | Mobility enabler |
| Ascendant Leviathan | Apex Bio-Gravity Engine | T3 | World Nerve | Apex | Endgame center-of-mass pressure tool | High impact, high upkeep |

## MVP Human and Alien Role Coverage Matrix

| Role | Helion Directorate (Human MVP) | Veyari Ascendancy (Alien MVP) |
| --- | --- | --- |
| Scout | Surveyor Drone, Strider Bike | Echo Skimmer, Skitter Lance |
| Builder | Line Engineer | Brood Architect |
| Baseline Infantry | Lancer Squad | Needle Brood |
| Breach Infantry | Breach Team | Rift Claw |
| Sustain Support | Field Medic | Spore Warden |
| Light Vehicle Pressure | Strider Bike | Skitter Lance |
| Mainline Armor | Ember Tank | Bulwark Husk, Rift Behemoth |
| Siege | Sunforge Artillery | Mire Spitter, Singularity Lobber |
| Anti-Air | Sable AA Platform | Veil Thorn Battery |
| Air Strike | Raptor Gunship | Talon Ray |
| Air Utility | Halo Transport | Spire Carrier |
| Apex Unit | Solarch Titan | Ascendant Leviathan |

## Role Coverage Matrix

| Role | Helion Directorate | Obsidian Forge |
| --- | --- | --- |
| Scout | Surveyor Drone, Strider Bike | Reclaimer, Maul Rover |
| Builder | Line Engineer | Foundry Engineer |
| Baseline Infantry | Lancer Squad | Warder Team |
| Breach Infantry | Breach Team | Breacher Team |
| Sustain Support | Field Medic | Repair Crew |
| Light Vehicle Pressure | Strider Bike | Maul Rover |
| Mainline Armor | Ember Tank | Bastion Carrier, Anvil Walker |
| Siege | Sunforge Artillery | Cinder Mortar, Ruin Launcher |
| Anti-Air | Sable AA Platform | Bastion AA Rig |
| Air Strike | Raptor Gunship | Ashwing Bomber |
| Air Utility | Halo Transport | Hoist Lifter |
| Apex Unit | Solarch Titan | Worldbreaker Colossus |

## Vertical Slice Roster Lock

Units required for first playable slice:

- Helion Directorate:
  - Line Engineer
  - Lancer Squad
  - Breach Team
  - Strider Bike
  - Ember Tank
- Obsidian Forge:
  - Foundry Engineer
  - Warder Team
  - Breacher Team
  - Maul Rover
  - Cinder Mortar
- Shared support:
  - One builder for each faction
  - One economy harvester structure for each faction
  - One captured Data Node objective

## MVP Duel Roster Lock (Human vs Alien)

Units required for MVP combat validation:

- Helion Directorate (Human):
  - Line Engineer
  - Lancer Squad
  - Breach Team
  - Strider Bike
  - Ember Tank
  - Sunforge Artillery
- Veyari Ascendancy (Alien):
  - Brood Architect
  - Needle Brood
  - Rift Claw
  - Skitter Lance
  - Bulwark Husk
  - Mire Spitter
- Shared support:
  - One builder for each faction
  - One economy harvester structure for each faction
  - One contested Data Node objective
  - One flank lane and one chokepoint lane validated for combat behavior testing

## MVP Per-Unit Animation Mapping (Helion and Veyari)

Required baseline states from visual policy:

- Idle
- Move
- Primary Action
- Hit or Reaction
- Death or Disable

State naming convention (recommended clip IDs):

- idle
- move
- action_primary
- react_hit
- death

| Faction | Unit | Idle | Move | Primary Action | Hit or Reaction | Death or Disable | Optional States |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Helion | Line Engineer | idle | move | action_primary_build_repair | react_hit | death | action_secondary_salvage |
| Helion | Lancer Squad | idle | move | action_primary_rifle_fire | react_hit | death | action_secondary_grenade |
| Helion | Breach Team | idle | move | action_primary_breach_fire | react_hit | death | action_secondary_charge |
| Helion | Strider Bike | idle | move | action_primary_autocannon_fire | react_hit | death | action_secondary_boost |
| Helion | Ember Tank | idle | move | action_primary_cannon_fire | react_hit | death | action_secondary_siege_brace |
| Helion | Sunforge Artillery | idle | move | action_primary_artillery_fire | react_hit | death | deploy_enter, deploy_exit |
| Veyari | Brood Architect | idle | move | action_primary_construct_heal | react_hit | death | action_secondary_tendril_seed |
| Veyari | Needle Brood | idle | move | action_primary_spine_burst | react_hit | death | action_secondary_swarm_surge |
| Veyari | Rift Claw | idle | move | action_primary_claw_strike | react_hit | death | action_secondary_lunge |
| Veyari | Skitter Lance | idle | move | action_primary_spike_fire | react_hit | death | action_secondary_flank_dash |
| Veyari | Bulwark Husk | idle | move | action_primary_heavy_bio_blast | react_hit | death | action_secondary_guard_stance |
| Veyari | Mire Spitter | idle | move | action_primary_acid_mortar | react_hit | death | deploy_enter, deploy_exit |

Implementation notes:

- If a unit has a role-specific optional state, it still must keep all required baseline states.
- Any additional state beyond this table requires readability justification and test-note entry under Flow F-24.

## Balance Intent Summary

- Helion should feel faster, cleaner, and better at decisive timing attacks.
- Obsidian should feel heavier, more resilient, and more rewarding in prolonged attrition fights.
- Neither faction should fully cover every role at the same efficiency in the same tier.
