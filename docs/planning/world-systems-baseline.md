# World Systems and Environment Design Baseline

This document defines the world readability contract for structures, lighting, and day-night behavior.

## Scope

- MVP structure classes from Tether Point through one T2 path.
- Lighting and cycle rules for readability-first combat.
- Integration rules between material zones and day-night phases.

## S-2001 Structure Shading and Material Zones

### Shared Material Zone Schema

| Zone | Purpose | Readability Contract |
| --- | --- | --- |
| Zone A | Primary body mass | Largest value-stable region used for silhouette recognition. |
| Zone B | Faction accent | Color identity lane visible in top and oblique views. |
| Zone C | Emissive indicator | State signal for active, damaged, and production busy states. |
| Zone D | Damage overlay | Burn, crack, or corrosion layer for health-state readability. |

### MVP Building Material Zone Map

| Structure Class | Zone A | Zone B | Zone C | Zone D |
| --- | --- | --- | --- | --- |
| Tether Point | central tower shaft and radial base | vertical faction bands on buttresses | crown beacon and command pulse nodes | base fractures and tower scorch strips |
| Power Core | capacitor housing and outer frame | side panel edge strips | capacitor seam glow and overload flashes | panel burn and cracked conduit overlays |
| Alloy Extractor | intake frame and processing body | extractor arm trims | ore-flow channel lights | abrasion and slag buildup masks |
| Barracks-Equivalent | shell walls and roof mass | front gate flank accents | unit-ready gate indicators | blast marks around gate and roof edges |
| Vehicle Structure | assembly hall body and floor plates | crane rail stripe and bay trims | bay occupancy lights and assembly lane signals | hull soot and impact dents near exits |
| Sensor or Uplink Structure | relay pedestal and support body | mast ring accents | mast pulse emitter and ping flashes | corroded mast joints and signal-fail bands |
| Expansion Hub or Radius Extender | ring body and support column | ring segment accents | radius pulse halo and node indicators | cracked ring segments and power bleed traces |
| Light Defense Node | fortified casing and mount | turret ring accents | target-lock lens and fire-ready indicator | blast scoring around barrel housing |
| Advanced Ground Structure | dual tower cores and central foundry mass | tower spine accents | unlock-state beacons and forge heart | heavy structural fracture overlays |
| Air Structure | launch deck and superstructure | frame edge accents | launch vector rails and ready beacons | thermal burn patterns and deck damage |

### Shading Rules

- Ambient occlusion:
  - AO must support depth but not consume small footprint structures at night.
  - AO multiplier target range: 0.55 to 0.75.
- Specular limits:
  - Structural body max specular: 0.35.
  - Accent max specular: 0.25 to prevent faction-tint glare washout.
- Damage readability:
  - Damaged: emissive flicker and overlay activation at 60 percent health.
  - Critical: increased flicker and overlay density at 30 percent health.
  - Destroyed: emissive disabled and structure value shifted to low-luminance rubble profile.

## S-2002 Lighting Model and Day-Night Cycle Contract

### Lighting Roles by Phase

| Phase | Duration Share | Ambient Role | Directional Role | Fill Role | Readability Priority |
| --- | --- | --- | --- | --- | --- |
| Dawn | 20 percent | medium warm lift | low-angle long shadow | cool soft fill | silhouette recovery from dark phase |
| Day | 40 percent | high neutral lift | strong top-oblique key | moderate fill | maximum clarity and role recognition |
| Dusk | 20 percent | medium cool falloff | low-angle warm key | subtle neutral fill | maintain combat clarity during transition |
| Night | 20 percent | low blue-neutral floor | moon or sky key at low intensity | emissive-assisted fill | preserve faction and damage readability |

### Global Cycle Parameters

- Default cycle length: 16 minutes per full loop.
- Phase count: 4 (dawn, day, dusk, night).
- Transition interpolation window: 12 seconds between phases.
- Multiplayer lockstep requirement: all clients use deterministic cycle phase clock.

### Readability Floor (Night)

- Minimum unit or structure edge contrast ratio target: 2.8:1.
- Minimum emissive brightness for Zone C indicators: 0.45 normalized intensity.
- Maximum darkness penalty allowed on Zone A at night: 40 percent from day baseline.
- If contrast floor fails, emissive and fill-light floor are raised before AO changes.

## S-2006 Structure Shading and Day-Night Integration

### Integration Rules

- Zone B faction accents must remain hue-distinct at all phases using phase-aware saturation guardrails.
- Zone C emissive indicators scale by phase:
  - Day: 0.65 multiplier.
  - Dusk or dawn: 0.85 multiplier.
  - Night: 1.00 multiplier.
- AO and night fill interplay must not collapse narrow structures into terrain silhouettes.
- Phase transitions must use smooth interpolation for ambient, directional, fill, and emissive channels to avoid visual pop.

### Dark-Phase Simulation Checklist

| Check ID | Check | Pass Rule |
| --- | --- | --- |
| LS-01 | Faction color persistence | Helion and Veyari accents remain visually distinct at night. |
| LS-02 | Damage state visibility | Damaged and destroyed states are distinguishable at night without UI text. |
| LS-03 | Small footprint readability | Power Core, Alloy Extractor, and Light Defense Node remain identifiable at default zoom. |
| LS-04 | Transition stability | No abrupt exposure or emissive pop at day-dusk-night boundaries. |

## Civilizational Era Transition Triggers and Pacing Targets

Define four warfare eras with explicit trigger gates so complexity arrives in readable, controlled layers.

### Era Definitions

- Survival Warfare:
  - Opening baseline focused on expansion, scouting, and first tactical control.
- Augmented Warfare:
  - Mid-opening to midgame layer where branch identity and enhancement systems begin to diverge.
- Autonomous Warfare:
  - Midgame to late-midgame layer where machine-scale coordination and automation stress become first-order constraints.
- Network Warfare:
  - Late-game layer where distributed command systems, disruption tools, and systemic resilience decide outcomes.

### Trigger Contract (First Pass)

| Transition | Trigger Requirements | Earliest Allowed Time | Target Arrival Band | Hard Delay Guardrail |
| --- | --- | --- | --- | --- |
| Survival -> Augmented | 1 T2 structure online, 1 Data objective controlled for at least 60 seconds, and 1 branch-choice unlock completed | 08:00 | 09:00 to 13:00 | 16:00 |
| Augmented -> Autonomous | 2 active Data-linked systems, 1 automation or doctrine chain completed, and sustained two-zone economy for 120 seconds | 15:00 | 17:00 to 23:00 | 27:00 |
| Autonomous -> Network | Original core plus at least 2 relay or shard network nodes active, 1 network-level system unlocked, and one successful resilience recovery event | 24:00 | 26:00 to 34:00 | 38:00 |

### Pacing Targets by Era

| Era | Pacing Target | Complexity Budget | Readability Requirement |
| --- | --- | --- | --- |
| Survival Warfare | Fast tactical commitments with low systemic overhead | low | Players understand expansion and contest priorities without advanced-system UI dependency |
| Augmented Warfare | Introduce branch tradeoffs and first nonlinear power spikes | medium | Transition cues must identify what unlocked and why within one HUD alert cycle |
| Autonomous Warfare | Increase army and economy throughput with maintenance-side constraints | medium-high | New burdens (upkeep, bandwidth, cooling) must surface before failures become catastrophic |
| Network Warfare | Reward distributed resilience, disruption timing, and macro adaptation | high | Branch or network state must remain interpretable under peak combat load |

### Transition Safeguards

- A transition cannot fire during unresolved critical alert states (for example, base-loss hard warning) unless forced by scripted scenario rules.
- Each transition must emit a single authoritative transition payload with transition id, source era, target era, and trigger proof fields.
- If hard delay guardrail is reached without trigger completion, apply assisted unlock window with reduced bonus scaling to avoid deadlocked progression.
- Era transitions must never invalidate prior-tech investments; they add systems, they do not hard-replace opening viability.

## Validation Evidence (2026-06-10)

- Functional:
  - Material zones defined for all shared MVP building classes.
  - Day-night phase roles and deterministic cycle parameters defined.
- Integration:
  - Shading and lighting integration rules map emissive, AO, and transition behavior to readability floors.
- Smoke:
  - LS-01 through LS-04 checklist is executable with explicit pass criteria.
