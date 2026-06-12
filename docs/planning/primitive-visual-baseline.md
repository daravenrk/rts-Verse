# Primitive Visual Baseline (MVP)

This document defines a primitive-first visual language for MVP units and structures.

## Scope

- MVP factions: Helion and Veyari.
- MVP structures: shared buildable baseline from Tether Point through one T2 path.
- Goal: role readability at RTS camera distance without close-up detail dependency.
- Battlefield map items and strategic annotations use the same primitive marker language so objectives remain readable at gameplay zoom.

## S-1001 Shared Primitive and Shader Language

### Primitive Shape Grammar by Role Class

| Role Class | Primary Shapes | Secondary Shapes | Silhouette Anchor | Readability Rule |
| --- | --- | --- | --- | --- |
| Builder Infantry | capsule, narrow box | backpack box, wrist cylinders | elevated tool arm or growth limb | Builder profile must show non-rifle forward silhouette at default zoom. |
| Rifle Infantry | capsule torso, box shoulder | small barrel cylinders | forward horizontal weapon line | Rifle line must be distinct from breach by shorter barrel mass. |
| Breach Infantry | capsule torso, wedge forearm | front-heavy box mass | oversized frontal assault shape | Breach silhouette must read as front-loaded at all yaw angles. |
| Support Infantry | capsule torso, rounded backpack | side canisters | rear support pack | Support profile must show visible utility mass not present on rifle class. |
| Light Vehicle | low box hull, wheel or leg cylinders | top rail or fin | long-and-low side profile | Light vehicle must remain lower and longer than mainline armor. |
| Mainline Armor | thick box hull, broad turret | side plate wedges | wide frontal block | Tank profile must exceed light vehicle width by clear margin. |
| Siege Vehicle | long rear hull, elevated barrel | stabilizer legs | long barrel or launch arc | Siege role must show range intent with exaggerated forward extension. |
| Mobile AA | mid box hull, dual vertical pods | radar mast | dual upward launcher silhouette | AA role must present upward-facing weapon profile at a glance. |
| Aircraft Utility | narrow body capsule, side fins | cargo tail or support vanes | high wing or carriage profile | Utility air shape must look transport or support focused, not strike focused. |
| Aircraft Strike | arrowhead or predatory wedge | wing pylons | aggressive forward taper | Strike air role must look attack-biased from top and oblique views. |
| Building Core | large box base, central tower | radial buttress blocks | tallest center mass | Core building must anchor player orientation from far zoom. |
| Building Utility | medium box footprint, exposed module | pipe or conduit cylinders | one readable top icon shape | Utility buildings must stay legible from top-down without text. |
| Building Production | broad base, framed gate | side intake blocks | obvious front output face | Production role must show exit direction and faction accent lane. |

### Shader Baseline

- Use one shared material stack per actor:
  - Base body color (value-stable under all light phases).
  - Faction accent layer (Helion warm amber-cyan, Veyari toxic lime-crimson).
  - Emissive signal layer for active state, low health warning, and production busy state.
  - Edge-contrast layer for silhouette separation at low zoom.
- Specular discipline:
  - Infantry and utility units: low specular to avoid glare flicker.
  - Armor and major structures: medium specular cap only on upper planes.
  - Never allow mirror-like highlights on faction accent zones.
- Ambient occlusion discipline:
  - AO depth should support form reading but not erase small units at night.
  - AO intensity must stay below the readability floor where idle silhouettes remain identifiable.
- Damage readability:
  - Damaged: desaturated base, intermittent emissive instability, visible scorch mask.
  - Destroyed: emissive off, heavy darkening, broken silhouette chunk removal.

### Camera-Angle Readability Requirements

- Default gameplay zoom:
  - Each role class must be identifiable in under one second.
- Zoomed-out review:
  - Faction tint and primary role class must remain separable.
- Rotated camera review (45, 90, 135 degrees yaw):
  - Silhouette anchors must remain visible without relying on decals.

## S-1002 Helion MVP Primitive Recipes

| Unit | Primitive Recipe | Silhouette Intent | Material and Shader Zones | Animation-Sensitive Parts |
| --- | --- | --- | --- | --- |
| Line Engineer | capsule torso, narrow leg capsules, rectangular tool rig on right arm | Utility-forward profile with tool extension | body: matte steel gray; accent: amber stripe; emissive: wrist tool glow | tool arm pivot, backpack conduit pulse |
| Lancer Squad | capsule torso, compact shoulder boxes, short rifle cylinder | Clean rifle line with balanced human-industrial posture | body: muted navy; accent: cyan shoulder trim; emissive: muzzle pulse | rifle recoil, chest hit react |
| Breach Team | thicker capsule torso, front wedge shield arm, short heavy barrel | Front-heavy breach wedge for close assault read | body: dark graphite; accent: amber forearm plates; emissive: charge vent | shield arm raise, forward lunge |
| Strider Bike | low box chassis, two large wheel cylinders, rear fin wedge | Fast flanker with long-low side profile | body: gunmetal; accent: cyan side rail; emissive: engine streak | front fork lean, rear thruster burst |
| Ember Tank | broad box hull, centered turret box, short thick cannon cylinder | Mainline armor block with stable frontal mass | body: olive steel; accent: amber hatch ring; emissive: heat seam on turret | turret yaw, recoil and brace settle |
| Sunforge Artillery | long box hull, elevated barrel cylinder, two stabilizer leg boxes | Range-first silhouette with long cannon reach | body: ash gray; accent: cyan stabilization marks; emissive: chamber charge line | deploy legs, barrel elevate, pack state |

Helion faction expression rule:

- Forms remain angular, clean, and manufactured with disciplined symmetry.

## S-1003 Veyari MVP Primitive Recipes

| Unit | Primitive Recipe | Silhouette Intent | Material and Shader Zones | Animation-Sensitive Parts |
| --- | --- | --- | --- | --- |
| Brood Architect | tapered capsule trunk, asymmetric limb cylinders, dorsal sac sphere | Builder-creature read with asymmetrical growth silhouette | body: desaturated purple-brown; accent: lime vascular lines; emissive: growth nodes | tendril extension, sac pulse |
| Needle Brood | narrow capsule body, spine wedges on back, forelimb spike cones | Swarm rifle profile with organic forward spikes | body: muted chitin gray; accent: crimson streaks; emissive: spine vent | spine flare, recoil twitch |
| Rift Claw | thick front capsule, oversized claw cone pair, crouched hind cylinders | Breach predator profile with obvious melee-first mass | body: dark marrow tone; accent: lime claw veins; emissive: strike charge | claw wind-up, lunge and recover |
| Skitter Lance | thin box carapace, four leg cylinders, rear needle tail cone | Fast skirmisher read with agile side profile | body: charcoal chitin; accent: crimson lane marks; emissive: flank sacs | stride cycle, tail snap |
| Bulwark Husk | heavy carapace box, front plate wedges, short maw cannon cylinder | Durable mainline armor with rounded fortress shell | body: deep moss-black; accent: lime seam glow; emissive: core slit | plate flex, heavy recoil |
| Mire Spitter | swollen rear sac sphere, low front carriage box, mortar tube cylinder | Siege profile with visible payload reservoir | body: damp clay tone; accent: crimson hazard ridges; emissive: acid pressure veins | deploy anchor, sack compression, mortar arc |

Veyari faction expression rule:

- Forms remain organic, asymmetric, and pressure-shaped while preserving role clarity.

## S-1004 MVP Building Primitive Recipes

| Structure Class | Primitive Recipe | Top Silhouette Rule | Side Silhouette Rule | Faction Mapping Rule |
| --- | --- | --- | --- | --- |
| Tether Point | large base disk or square, tall center spire, three radial buttress blocks | center landmark must be strongest map anchor | center spire must exceed nearby structures by clear height | Helion uses segmented tower plates; Veyari uses bio-rib tower rings |
| Power Core | medium box base, vertical capacitor cylinders | capacitor tops must read as power icon from top | side cylinders must show energy status by emissive stripe | Helion capacitor fins; Veyari growth pod columns |
| Alloy Extractor | low box frame with two intake arms | intake arms must point to resource node center | side profile must show extraction direction clearly | Helion mechanical clamp arms; Veyari siphon tendril roots |
| Barracks-Equivalent | broad rectangle with front gate notch | gate notch must be visible from top view | front face must indicate infantry output lane | Helion armored gate frame; Veyari brood-mouth gate arch |
| Vehicle Structure | large rectangle, side service bays, top crane bar | top crane or gantry must denote vehicle production | side bay openings must read as heavy output | Helion rail gantry; Veyari tendon gantry |
| Sensor or Uplink Structure | compact base, tall antenna mast or bio-sensor spine | mast tip must stand out from production structures | side profile must read as signal relay, not factory | Helion tri-mast antenna; Veyari resonance spine |
| Expansion Hub or Radius Extender | medium ring base, central beacon column | ring footprint must imply build-radius source | beacon must be visible above nearby cover clutter | Helion beacon pillar; Veyari pulse totem |
| Light Defense Node | small fortified base, elevated turret cup | turret cup must stay readable against terrain clutter | side profile must show directional fire arc | Helion plated turret node; Veyari thorn turret cyst |
| Advanced Ground Structure | heavy base with dual high towers | dual tower shape marks advanced tier at top view | side silhouette must read as large tech unlock point | Helion twin forge towers; Veyari dual crucible sacs |
| Air Structure | wide pad base with raised launch frame | launch frame shape must be visible from high zoom | side silhouette must imply lift or launch path | Helion rigid launch frame; Veyari wing-rib launch cradle |

Building material zone standard:

- Zone A: structural body (largest value-stable area).
- Zone B: faction accent strip or panel (directional and readable).
- Zone C: emissive activity indicator (state and health readability).
- Zone D: damage overlay band (burn or corrosion pass).

## S-1005 Angle-Readability Completion Gate

### Review Checklist

Use this checklist for every MVP unit and building before closure.

| Check ID | Check | Pass Rule | Failure Mode |
| --- | --- | --- | --- |
| AR-01 | Default zoom silhouette | Role class identified in under one second | silhouette collapse |
| AR-02 | Zoom-out faction separation | Helion and Veyari remain separable by tint and shape | tint ambiguity |
| AR-03 | Rotated camera identity | At 45, 90, 135 yaw, role anchor remains visible | rotation confusion |
| AR-04 | Night readability floor | Emissive and edge contrast preserve actor identification | glare loss or dark loss |
| AR-05 | Damage state clarity | Damaged and destroyed states are distinguishable without UI text | state ambiguity |
| AR-06 | Production structure orientation | Output-facing side is identifiable for barracks and vehicle structures | orientation confusion |
| AR-07 | Command anchor priority | Tether Point remains highest-recognition anchor near base | base-anchor collapse |

### Completion Rule

A unit or building passes only if all AR checks pass at default zoom, zoom-out, and rotated camera review.

### Known Failure Modes

- Silhouette collapse from too many similarly sized primitives.
- Tint ambiguity when faction accents cover less than 10 percent of visible area.
- Glare loss from over-bright specular on upper surfaces.
- Rotation confusion when role anchors exist only on one side.

## Validation Evidence (2026-06-10)

- Functional review:
  - Confirmed primitive recipes exist for all Helion MVP units.
  - Confirmed primitive recipes exist for all Veyari MVP units.
  - Confirmed recipes exist for all shared MVP structure classes.
- Integration review:
  - Confirmed shader and material-zone rules align with F-24 readability policy and animation-subspace baseline.
- Smoke review:
  - Confirmed angle-readability checklist can be applied end-to-end without undocumented criteria.

## Validation Evidence (2026-06-11)

- Functional review:
  - Confirmed MapItem markers now render as primitive silhouettes for zone annotations, spawn markers, resource nodes, cover, chokepoints, and relay towers.
- Smoke review:
  - Confirmed the first duel map still passes F-24 after map-item primitive integration.
