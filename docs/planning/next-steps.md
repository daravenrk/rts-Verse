# Next Steps Tracker

Keep this list short, actionable, and current.

## Current Sprint

- [x] Create architecture and planning documentation baseline.
- [x] Define coding conventions for scenes, scripts, and assets.
- [x] Define initial vertical slice requirements and acceptance criteria.
- [x] Create first gameplay task breakdown for M2.
- [ ] Assign owners and estimates for M2 seed backlog tasks.
- [ ] Execute first pass of M2 validation flows F-01 and F-02.
- [x] Add faction asymmetry acceptance checks to M2 validation flows.
- [x] Create default startup scene at scenes/core/Main.tscn with single-responsibility bootstrap flow.
- [x] Configure project.godot run/main_scene to scenes/core/Main.tscn after scene creation.
- [ ] Add startup bootstrap checklist: input profile load, core manager init, gameplay scene transition.
- [ ] Convert tech-tree vertical-slice lock into scene and script implementation checklist.
- [ ] Build first duel map using map-standards.md.
- [ ] Define initial numeric price bands for vertical-slice units and structures.
- [ ] Add a carrier and airfield air-wing validation checklist for Fighter and Corvette basing behavior.
- [ ] Define first-pass numeric pricing and upkeep rules for colony and civilian units and structures.
- [ ] Prototype one colony-defense path (Militia Barracks to Security Command Post) in scenario validation.
- [ ] Add placeholder names and initial flavor notes for third human, alien, and robot factions.
- [ ] Update all planning baselines to specify American, Chinese, Civilian/Colony, Alien, and Robot (robot is fully unique, non-humanoid).
- [ ] Add a dedicated planning section for the robot faction’s unique roster and structures.
- [ ] Map all existing and planned units/structures to the new 5-tier model.
- [ ] Update test flows and backlog for 5-tier progression coverage.
- [ ] Update test flows and backlog for five-faction coverage.
- [ ] Define first-pass global stockpile caps and depletion behavior for Alloy, Power, Data, and Reclaim.
- [ ] Define random world event table with bounded positive and negative resource effects.
- [ ] Add UI and telemetry checklist for global stockpile visibility and world event announcements.
- [ ] Define era transition triggers and pacing targets for Survival, Augmented, Autonomous, and Network warfare phases.
- [ ] Draft first-pass ideology paths for Purists, Symbiotes, and Cybernetic Ascendants with strengths and failure modes.
- [ ] Define One Box original-core penalty rules and distributed network recovery mechanics.
- [ ] Define maintenance-instability resource model for high-tier automation (upkeep, bandwidth, cooling, logistics).
- [ ] Add infrastructure warfare design checklist for system-targeting superweapons and command disruption effects.
- [ ] Define Descent access-node control rules and orbital corridor contest mechanics.
- [ ] Define Descent event catalog (debris, storms, gravity anomalies, surges, contamination, resource blooms) with bounded cadence.
- [ ] Define dynamic evolution branch thresholds for machine, alien, and hybrid progression from shared human opening.
- [ ] Add player-facing readability rules for branch state, Descent status, and event warning windows.
- [ ] Implement MVP faction pair: Helion (Human) and Veyari (Alien) with full roster-lock completeness checks.
- [ ] Run F-16 Human vs Alien MVP Combat Completeness and record failures by dependency type.
- [ ] Run F-17 Map-Aware Tactical Combat Intelligence and tune lane selection, objective timing, and regroup logic.
- [ ] Implement default keyboard and mouse bindings from planning/controls-standards.md.
- [ ] Implement MVP HUD components: resource bar, minimap, command card, alerts, and queue display.
- [ ] Run F-18 Keyboard and Mouse Command Coverage and resolve command gap defects.
- [ ] Run F-19 Camera and HUD Usability Validation and tune camera responsiveness.
- [ ] Run F-20 Resource Discovery and Security Dominance Loop and tune objective control pacing.
- [ ] Run F-21 Opening Clarity and Parity Gate and tune early-phase cognitive load.
- [ ] Run startup smoke pass from cold launch and capture bootstrap logs for failure triage.
- [ ] Add explicit map annotations for primary, secondary, and high-risk resource zones in first duel scenario.
- [ ] Place all required strategic map items from planning/map-standards.md MVP Map Item Catalog on first duel map.
- [ ] Place all required tactical terrain items from planning/map-standards.md MVP Map Item Catalog on first duel map.
- [ ] Assign stable item IDs to all interactive map items and add them to scenario validation notes.
- [ ] Prototype exactly one optional MVP extension item after required map items pass checklist validation.
- [ ] Implement shared Tether Point primary base behavior for Helion, Obsidian, and Veyari command structures.
- [ ] Implement MVP T0 buildables from Tether Point unlock chain: Power Core, Alloy Extractor, and Barracks-equivalent.
- [ ] Implement MVP T1 buildables: Vehicle Structure, Sensor/Uplink Structure, and Expansion Hub or Radius Extender.
- [ ] Add command-penalty and recovery-state telemetry for controlled Tether Point destruction tests.
- [ ] Run F-22 Tether Point and Buildable Chain Integrity across both spawns for all MVP factions.
- [x] Implement splash scene as first visual state before any menu interaction.
- [x] Implement startup gate: transition to main menu on first key press or auto-transition at 5 seconds.
- [x] Implement main menu options with Skirmish enabled and Campaign disabled labeled Coming Soon.
- [x] Add startup telemetry fields for transition reason (keypress or timeout) and timestamp.
- [ ] Run F-23 Startup Splash and Main Menu Gate and record deterministic behavior results.
- [ ] Define first-pass camera default and zoom bands for small 3D unit readability.
- [ ] Implement MVP unit animation state mapping to predefined subspace baseline.
- [ ] Run F-24 Small-Scale 3D Readability and Animation Subspace Compliance and record gaps by unit role.
- [ ] Define campaign mission order baseline with Veyari as first perspective block and Helion as final perspective block.
- [ ] Implement skirmish faction selector to allow any available faction and disable unavailable factions with Coming Soon labels.
- [ ] Run F-25 Campaign Perspective Order and Skirmish Availability Gate and capture menu-state evidence.
- [ ] Select primary environment type for first duel map and document why it fits MVP combat goals.
- [ ] Apply Helion center-Tether placement rule to any Helion-authored start layout and document any near-center exceptions.
- [ ] Run F-26 Environment Type and Helion Center-Tether Readability and capture first-engagement notes.
- [ ] Define concrete unlock thresholds for advanced systems (maintenance, instability, civilization stress).
- [ ] Draft itch.io page copy using planning/itch-io-launch-and-feedback-plan.md blueprint sections.
- [ ] Prepare Stage 0 media bundle (screenshots or clips) with gameplay-first captions.
- [ ] Publish itch.io Stage 0 Coming Soon page with transparent Pre-Alpha status.
- [ ] Define structured feedback template fields and publish feedback instructions on itch page.
- [ ] Start weekly feedback triage cadence and publish first feedback-response devlog summary.

## Ready Queue

- [x] Establish folder conventions for gameplay systems.
- [ ] Define deterministic simulation constraints.
- [ ] Convert economy-standards.md into first balance sheet draft.
- [x] Draft test scenarios for core loop validation.

## Blocked

- None currently.

## Completed

- 2026-05-17: Documentation baseline created under docs.
- 2026-05-17: Project conventions, task backlog, testing strategy, and definition of done added.
- 2026-05-17: Game vision established for Command and Conquer plus Total Annihilation inspired identity.
- 2026-05-17: Full faction tech tree and unit list baselines added for Helion Directorate and Obsidian Forge.
- 2026-05-17: Map layout and economy standards added for spawns, resource locations, pricing, and map control.
- 2026-05-17: Any-faction core roster baseline added, including Carrier, Fighter, Corvette, and shared basing constraints.
- 2026-05-17: Colony and civilian unit/building baselines added, including militia and logistics role boundaries.
- 2026-05-17: Five-faction baseline (3 human, 1 alien, 1 robot) added to planning and architecture docs.
- 2026-05-17: Five-tier tech tree baseline added for all factions.
- 2026-05-17: Unified global stockpile economy direction documented, including finite resources and random world event volatility.
- 2026-05-17: Civilizational transition vision documented with four-era battlefield arc, One Box premise, and distributed network warfare direction.
- 2026-05-17: Three-way collision direction documented with Humanity, One Box, alien systems, and Descent-centered escalation model.
- 2026-05-17: MVP Human-vs-Alien solution documented with complete Veyari alien faction, duel roster lock, and smart map-fighting validation flows.
- 2026-05-17: UI and controls baseline documented with keyboard and mouse bindings, HUD standards, and validation flows.
- 2026-05-17: Resource discovery and resource security documented as the primary gameplay objective across vision and architecture.
- 2026-05-17: Competitive-clarity-first and phase-gated-complexity model documented for opening parity and escalation pacing.

## Owner Map

- Architecture decisions: Tech lead
- Plan maintenance: Project owner
- Research updates: Any contributor making a design-impacting change
