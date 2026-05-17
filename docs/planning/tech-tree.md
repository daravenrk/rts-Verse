# Tech Tree

## Faction Scope Baseline

The game will support five major factions:

- Human Faction 1: American (military/industrial theme)
- Human Faction 2: Chinese (military/industrial theme)
- Human Faction 3: Civilian/Colony (non-state, survivalist, or corporate)
- Alien Faction: [TBD]
- Robot Faction: [TBD, fully unique, non-humanoid units and structures]

All tech tree and progression planning must support this multi-faction model, with each human and alien faction expressing the shared baselines and unique progression. The robot faction will require a distinct, non-humanoid unit and structure roster, to be planned in a dedicated section.

This document defines faction progression, production structure unlocks, and upgrade paths for the initial playable roster.

## Design Goals

- Support a readable early-game rush and expansion phase.
- Create distinct faction asymmetry without requiring totally different control schemes.
- Enable progression from light skirmish to heavy combined-arms warfare.
- Keep the vertical slice implementable by staging tech in clear tiers.

## Descent Catalyst and Evolution Policy

- The match world includes a persistent orbital anchor event called The Descent.
- Descent-linked systems are the canonical source of alien acceleration effects, major world-event volatility, and late-game orbital access pressure.
- Primary multiplayer baseline uses dynamic evolution:
  - All players begin in human-survival conditions.
  - Players diverge through machine integration, alien integration, or hybrid trajectories as the match escalates.
- Fixed-start faction variants are allowed for specific scenarios, but dynamic evolution remains the default architecture target.
- Descent objectives should be represented by controllable access nodes, transit corridors, and uplink control points that interact with economy and tech unlock pressure.

## Competitive Opening and Complexity Gating

- Opening competitive clarity has priority over simulation depth.
- Tier 0 and Tier 1 should emphasize expansion, production, scouting, and tactical engagements.
- Advanced civilization systems (stability, entropy, large-scale infrastructure burden) should activate through progression thresholds, not at match start.
- Tech unlock pacing must preserve opening parity between factions even when late-game identities diverge.

## Shared Match Economy Model

- Resources:
  - Alloy: primary construction and production resource.
  - Power: generated capacity required for advanced buildings and some weapons systems.
  - Data: late-game research and elite production resource generated from map control nodes.
- Global stockpile rules:
  - All resources are tracked as finite global world stockpiles shared by every faction.
  - Extraction and conversion draw from the same world reserves, so map control determines access priority to scarce supply.
  - Random world events can increase or decrease stockpiles during a match and must be announced to all players.
- Builder rules:
  - Construction units can place structures directly.
  - Advanced structures require both tier unlock and sufficient power margin.

  - Tiering model (all factions):
    - Tier 0: Command, economy bootstrap, and scouting. (Start of match, basic resource and builder access)
    - Tier 1: Early combat, first expansion, and basic tech. (Infantry, light vehicles, first defenses, basic civilian/civilian defense)
    - Tier 2: Advanced warfare, air control, and deeper economy. (Heavy vehicles, air units, advanced support, colony upgrades)
    - Tier 3: Apex weapons, elite units, and decisive siege tools. (Superweapons, top-tier units, advanced command/hero units)
    - Tier 4: Endgame escalation, ultimate tech, and faction-defining powers. (Game-ending superweapons, ultimate economy, unique faction mechanics, final upgrades)

## Shared Colony and Civilian Infrastructure Model

- Design intent:
  - Colony systems provide strategic depth and raid targets without replacing core military armies.
  - Civilian throughput should reward map control, logistics safety, and defensive planning.
- Required faction-equivalent structures:
  - Tier 0: Habitat Complex and Logistics Hub equivalents.
  - Tier 1: Civic Planning Office, Civilian Market, and Militia Barracks equivalents.
  - Tier 2: Security Command Post and Civil Airfield equivalents.
  - Tier 3: Governance Center equivalent.
- Required faction-equivalent units:
  - Colony Worker, Cargo Hauler, Civil Engineer Team, Emergency Medic Team.
  - Security Militia Squad and Patrol Buggy for local defense.
  - Peacekeeper Walker and Evacuation Shuttle for advanced colony response.
- Combat boundary:
  - Colony military elements are defensive support and should not out-trade frontline army tech at equal cost.
  - Civilian units should create strategic consequences when lost but remain weak in direct battle.

## MVP Duel Solution: Human Helion vs Alien Veyari

This MVP package defines one complete human faction and one complete alien faction for implementation-first combat validation.

- Human faction for MVP: Helion Directorate (existing complete chain in this document).
- Alien faction for MVP: Veyari Ascendancy (defined below).
- Match objective: both factions must express distinct doctrine and still fight effectively across lanes, chokepoints, flanks, and contested resource nodes.

### MVP Smart Combat Requirements

- Scout and information cycle:
  - Each faction must field early scouting and trigger first map read before committing to its first T1 major production branch.
- Lane choice behavior:
  - Armies must be able to choose between direct pressure lane and flank lane based on enemy fortification and travel time.
- Terrain response:
  - Infantry-focused groups should prefer cover and garrison opportunities where available.
  - Heavy units should avoid pathing traps and preserve firing arcs in chokepoint fights.
- Objective intelligence:
  - Factions must contest at least one Data Node timing window and react to Descent-linked objective pressure.
- Combat sustainability:
  - Armies should disengage and re-form when sustain units are lost or frontline integrity collapses.

## Faction A: Helion Directorate

Identity: aggressive tempo faction with fast deployment, shielded spearheads, and clean production chains.

### Tier 0

- Command Spire:
  - Starts match.
  - Produces: Surveyor Drone, Line Engineer.
  - Unlocks: Relay Reactor, Alloy Extractor, Barracks Node.
- Relay Reactor:
  - Generates Power.
- Alloy Extractor:
  - Harvests Alloy from deposits.
- Barracks Node:
  - Produces: Lancer Squad, Breach Team, Field Medic.

### Tier 1

- Motor Pool:
  - Requirement: Barracks Node + Relay Reactor.
  - Produces: Strider Bike, Bulwark APC, Ember Tank.
- Sensor Uplink:
  - Requirement: Barracks Node.
  - Unlocks radar range and stealth reveal upgrades.
- Expansion Hub:
  - Requirement: Alloy Extractor.
  - Allows forward build radius and secondary extractors.
- Upgrades:
  - Overclocked Servos: vehicle speed increase.
  - Capacitor Weave: infantry shield durability increase.
  - Sweep Scan: active detection pulse on Sensor Uplink.

### Tier 2

- War Foundry:
  - Requirement: Motor Pool + Expansion Hub.
  - Produces: Aegis Walker, Sunforge Artillery, Sable AA Platform.
- Sky Anchor:
  - Requirement: Sensor Uplink + Relay Reactor.
  - Produces: Raptor Gunship, Halo Transport.
- Research Prism:
  - Requirement: Data Node captured + Command Spire upgrade.
  - Unlocks advanced weapon and command upgrades.
- Upgrades:
  - Prism Targeting: artillery accuracy increase.
  - Phase Screen: temporary directional shields for walkers and APCs.
  - Rapid Deployment: transport unload speed and forward reinforce bonus.

### Tier 3

- Ascendant Core:
  - Requirement: War Foundry + Sky Anchor + Research Prism.
  - Produces: Solarch Titan.
  - Unlocks: Solar Lance Protocol, Directorate Command Matrix.
- Solar Lance Protocol:
  - Tactical beam strike targeted by line of sight.
- Directorate Command Matrix:
  - Global buff choice between production surge or shield recharge surge.

### Helion Production Flow Summary

- Open with Barracks Node for map control.
- Transition to Motor Pool for pressure and expansion denial.
- Hit Tier 2 with War Foundry or Sky Anchor depending on ground or air read.
- Reach Ascendant Core only if economy is stabilized across Alloy and Data.

## Faction B: Obsidian Forge

Identity: macro-heavy siege faction with durable chassis, reclaim economy, and punishing long-range escalation.

### Tier 0

- Forge Nexus:
  - Starts match.
  - Produces: Reclaimer, Foundry Engineer.
  - Unlocks: Smelter Grid, Scrap Harvester, Muster Hall.
- Smelter Grid:
  - Generates Power with slower ramp but higher efficiency than Helion.
- Scrap Harvester:
  - Harvests Alloy and can reclaim battlefield wreckage.
- Muster Hall:
  - Produces: Warder Team, Breacher Team, Repair Crew.

### Tier 1

- Tread Assembly:
  - Requirement: Muster Hall + Smelter Grid.
  - Produces: Maul Rover, Bastion Carrier, Cinder Mortar.
- Range Beacon:
  - Requirement: Muster Hall.
  - Provides artillery spotting and defensive warning radius.
- Excavation Post:
  - Requirement: Scrap Harvester.
  - Improves reclaim efficiency and opens fortified expansion sites.
- Upgrades:
  - Reinforced Treads: tracked unit health increase.
  - Salvage Protocol: wreck reclaim yield increase.
  - Embedded Turrets: Bastion Carrier garrison firepower increase.

### Tier 2

- Siege Crucible:
  - Requirement: Tread Assembly + Excavation Post.
  - Produces: Anvil Walker, Ruin Launcher, Bastion AA Rig.
- Aero Furnace:
  - Requirement: Range Beacon + Smelter Grid.
  - Produces: Ashwing Bomber, Hoist Lifter.
- Core Archive:
  - Requirement: Data Node captured + Forge Nexus upgrade.
  - Unlocks advanced munitions and command upgrades.
- Upgrades:
  - Seismic Shells: siege splash radius increase.
  - Furnace Plating: walker and heavy vehicle armor increase.
  - Battlefield Fabrication: engineer repair and fortification speed increase.

### Tier 3

- Cataclysm Engine:
  - Requirement: Siege Crucible + Aero Furnace + Core Archive.
  - Produces: Worldbreaker Colossus.
  - Unlocks: Meteor Salvo, Iron Mandate.
- Meteor Salvo:
  - Delayed multi-impact artillery strike over a broad area.
- Iron Mandate:
  - Global buff choice between armor overdrive or reclaim conversion surge.

### Obsidian Production Flow Summary

- Open with Muster Hall and reclaim economy to absorb pressure.
- Use Tread Assembly to establish ground presence and fortified expansion.
- Advance into Siege Crucible for battlefield control and attrition dominance.
- Reach Cataclysm Engine when map control and reclaim income support heavy investment.

## Faction C: Veyari Ascendancy (Alien MVP)

Identity: adaptive alien force with bio-gravity manipulation, zone denial growths, and high-impact precision strikes that rely on map anchors.

### Tier 0

- Descent Spire:
  - Starts match.
  - Produces: Echo Skimmer, Brood Architect.
  - Unlocks: Biomass Conduit, Resonance Well, Clutch Hive.
- Biomass Conduit:
  - Generates Power-equivalent bio-energy throughput.
- Resonance Well:
  - Extracts Alloy-equivalent material through alien resonance drilling.
- Clutch Hive:
  - Produces: Needle Brood, Rift Claw, Spore Warden.

### Tier 1

- Carapace Forge:
  - Requirement: Clutch Hive + Biomass Conduit.
  - Produces: Skitter Lance, Bulwark Husk, Mire Spitter.
- Phase Relay:
  - Requirement: Clutch Hive.
  - Provides sensor distortion and stealth reveal pulse.
- Tendril Node:
  - Requirement: Resonance Well.
  - Expands alien creep influence and forward deployment radius.
- Upgrades:
  - Accelerated Moulting: light unit speed and turn-rate increase.
  - Chitin Lattice: frontline durability increase.
  - Predatory Echo: short-duration tracking pulse against retreating enemies.

### Tier 2

- Gravity Crucible:
  - Requirement: Carapace Forge + Tendril Node.
  - Produces: Rift Behemoth, Singularity Lobber, Veil Thorn Battery.
- Sky Brood Nexus:
  - Requirement: Phase Relay + Biomass Conduit.
  - Produces: Talon Ray, Spire Carrier.
- Synapse Archive:
  - Requirement: Data Node captured + Descent Spire upgrade.
  - Unlocks advanced adaptation and command upgrades.
- Upgrades:
  - Event Horizon Spines: siege splash and slow increase.
  - Synaptic Overcast: command aura improves nearby reaction speed.
  - Predation Cycle: bonus damage against isolated targets.

### Tier 3

- World Nerve:
  - Requirement: Gravity Crucible + Sky Brood Nexus + Synapse Archive.
  - Produces: Ascendant Leviathan.
  - Unlocks: Gravity Bloom, Dominion Pulse.
- Gravity Bloom:
  - Area field that distorts movement and projectile travel.
- Dominion Pulse:
  - Global buff choice between regeneration surge or acceleration surge.

### Veyari Production Flow Summary

- Open with Clutch Hive control groups to secure early map vision and harassment.
- Transition to Carapace Forge for durable lane presence and flank threat.
- Hit Tier 2 through Gravity Crucible for ground break or Sky Brood Nexus for air-control pressure.
- Reach World Nerve when Data access and mid-map tendril control are stable.

## Neutral and Shared Map Tech

- Data Node:
  - Capturable strategic point required for Tier 2 research structures.
- Watchtower Relay:
  - Optional capturable vision structure.
- Debris Field:
  - Reclaimable battlefield resource source, more valuable to Obsidian Forge.

## Vertical Slice Tech Scope

Implement first:

- Tier 0 and Tier 1 economy and ground production for both factions.
- One representative Tier 2 unlock path per faction.
- No Tier 3 gameplay required for earliest playable build, but names and role targets are fixed for future planning.
- Colony and civilian systems are planned in full, but only one T1 colony-defense path is required for earliest playable validation.
- MVP duel implementation target:
  - Use Helion Directorate as complete human faction.
  - Use Veyari Ascendancy as complete alien faction.
  - Validate smart combat behaviors on a standards-compliant duel map before expanding to additional factions.

## Validation Notes

- Faction asymmetry must be visible by Tier 1.
- Tech transitions should create new decisions, not just larger numbers.
- Resource pressure must force tradeoffs between expansion, army size, and tier advancement.
- Colony and civilian content must increase strategic objectives without creating mandatory non-interactive macro loops.
