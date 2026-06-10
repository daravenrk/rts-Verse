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
- [x] Add startup bootstrap checklist: input profile load, core manager init, gameplay scene transition.
- [ ] Convert tech-tree vertical-slice lock into scene and script implementation checklist.
- [ ] Build first duel map using map-standards.md.
- [x] Define initial numeric price bands for vertical-slice units and structures.
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
- [x] Implement default keyboard and mouse bindings from planning/controls-standards.md.
- [x] Implement MVP HUD components: resource bar, minimap, command card, alerts, and queue display.
- [x] Run F-18 Keyboard and Mouse Command Coverage and resolve command gap defects.
- [x] Run F-19 Camera and HUD Usability Validation and tune camera responsiveness.
- [x] Run F-20 Resource Discovery and Security Dominance Loop and tune objective control pacing.
- [x] Run F-21 Opening Clarity and Parity Gate and tune early-phase cognitive load.
- [x] Run startup smoke pass from cold launch and capture bootstrap logs for failure triage.
- [x] Add explicit map annotations for primary, secondary, and high-risk resource zones in first duel scenario.
- [x] Place all required strategic map items from planning/map-standards.md MVP Map Item Catalog on first duel map.
- [x] Place all required tactical terrain items from planning/map-standards.md MVP Map Item Catalog on first duel map.
- [x] Assign stable item IDs to all interactive map items and add them to scenario validation notes.
- [x] Prototype exactly one optional MVP extension item after required map items pass checklist validation.
- [x] Implement shared Tether Point primary base behavior for Helion, Obsidian, and Veyari command structures.
- [x] Implement MVP T0 buildables from Tether Point unlock chain: Power Core, Alloy Extractor, and Barracks-equivalent.
- [x] Implement MVP T1 buildables: Vehicle Structure, Sensor/Uplink Structure, and Expansion Hub or Radius Extender.
- [x] Add command-penalty and recovery-state telemetry for controlled Tether Point destruction tests.
- [x] Run F-22 Tether Point and Buildable Chain Integrity across both spawns for all MVP factions.
- [x] Implement splash scene as first visual state before any menu interaction.
- [x] Implement startup gate: transition to main menu on first key press or auto-transition at 5 seconds.
- [x] Implement main menu options with Skirmish enabled and Campaign disabled labeled Coming Soon.
- [x] Add startup telemetry fields for transition reason (keypress or timeout) and timestamp.
- [x] Run F-23 Startup Splash and Main Menu Gate and record deterministic behavior results.
- [x] Define first-pass camera default and zoom bands for small 3D unit readability.
- [x] Implement MVP unit animation state mapping to predefined subspace baseline.
- [x] Run F-24 Small-Scale 3D Readability and Animation Subspace Compliance and record gaps by unit role.
- [x] Define campaign mission order baseline with Veyari as first perspective block and Helion as final perspective block.
- [x] Implement skirmish faction selector to allow any available faction and disable unavailable factions with Coming Soon labels.
- [x] Run F-25 Campaign Perspective Order and Skirmish Availability Gate and capture menu-state evidence.
- [x] Select primary environment type for first duel map and document why it fits MVP combat goals.
- [x] Confirm Tether Point spawn positions are map-defined and work correctly for both Helion and Veyari at all valid spawn locations.
- [x] Run F-26 Environment Type Readability and capture first-engagement notes.
- [x] Define concrete unlock thresholds for advanced systems (maintenance, instability, civilization stress).
- [x] Draft itch.io page copy using planning/itch-io-launch-and-feedback-plan.md blueprint sections.
- [ ] Prepare Stage 0 media bundle (screenshots or clips) with gameplay-first captions.
- [ ] Publish itch.io Stage 0 Coming Soon page with transparent Pre-Alpha status.
- [x] Define structured feedback template fields and publish feedback instructions on itch page.
- [x] Start weekly feedback triage cadence and publish first feedback-response devlog summary.

## Ready Queue

- [x] Establish folder conventions for gameplay systems.
- [x] Define deterministic simulation constraints.
- [x] Convert economy-standards.md into first balance sheet draft.
- [x] Draft test scenarios for core loop validation.

## Blocked

- Stage 0 media and page publication tasks:
	- Blocker: screenshot or clip assets and manual itch.io publication step require external authoring/platform actions.
	- Re-entry condition: produce media bundle and execute platform publish steps in operator workflow.

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
- 2026-06-09: Startup bootstrap checklist implemented in Main bootstrap flow for input profile load, core manager initialization, and gameplay scene transition state tracking.
- 2026-06-09: Startup cold-launch smoke pass executed in headless mode and bootstrap logs captured for triage baseline.
- 2026-06-09: Skirmish faction selector implemented with availability gating; Helion and Veyari selectable while unavailable factions remain visible and disabled with Coming Soon labels.
- 2026-06-09: Campaign perspective order data source added with Veyari-first and Helion-last sequence wired into skirmish state display and logs.
- 2026-06-09: F-25 executed via headless skirmish scene validation; faction availability gate and campaign-order evidence captured in runtime logs.
- 2026-06-10: F-23 executed with both timeout and keypress paths in headless runs, including deterministic startup payload logs for transition reason and menu state.
- 2026-06-10: Deterministic simulation constraints documented in conventions and validated with dedicated F-27 startup observability flow.
- 2026-06-10: Economy standards upgraded with first MVP balance-sheet draft covering T0 to T1 structures, Helion and Veyari unit costs, and first-pass upkeep rules.
- 2026-06-10: First duel map primary environment declared as Radial Impact Zone with no secondary type for MVP and rationale aligned to objective-pressure readability goals.
- 2026-06-10: Concrete MVP unlock thresholds defined for maintenance load, instability pressure, and civilization stress events, including earliest windows and telemetry requirements.
- 2026-06-10: Stage 0 itch.io page copy draft completed from blueprint sections, including hero, about, feature bullets, trust block, and feedback CTA.
- 2026-06-10: Structured player-facing feedback template and publish-ready submission instructions added for itch page rollout.
- 2026-06-10: First duel map scene added with map-defined Tether spawn markers and headless validation logs confirming slot-stable positions for both Helion and Veyari assignments.
- 2026-06-10: Shared Tether Point role behavior implemented with Helion, Obsidian, and Veyari command-structure mapping plus controlled command-penalty and recovery-state telemetry hooks.
- 2026-06-10: MVP T0 and T1 Tether-linked buildable chain implemented with dependency checks and stable build-item telemetry across both slots.
- 2026-06-10: F-22 matrix executed in headless runs across Helion, Obsidian, and Veyari for both spawn slots with destruction and recovery logging evidence.
- 2026-06-10: Weekly feedback triage cadence kickoff and first feedback-response devlog summary draft added to launch workflow.
- 2026-06-10: First-pass camera defaults and zoom bands for small 3D readability added to controls standards for F-24 baseline.
- 2026-06-10: MVP animation subspace per-unit mapping baseline confirmed in unit-list and linked as F-24 source-of-truth.
- 2026-06-10: First duel map now includes required strategic and tactical item catalog, explicit resource-zone annotations, stable map item IDs, and one optional neutral relay prototype with scenario-note evidence.
- 2026-06-10: Default RTS keyboard and mouse binding profile implemented in startup input initialization from controls-standards baseline and validated in headless startup run.
- 2026-06-10: MVP HUD baseline layer initialized in duel map runtime with resource bar, minimap, command card, alerts, and queue placeholders.
- 2026-06-10: F-26 environment readability validated with first-engagement notes and faction-agnostic Tether spawn evidence captured in scenario validation notes.
- 2026-06-10: Environment catalog expanded into skirmish and campaign variant packs using explicit one-primary and one-secondary composition rules.
- 2026-06-10: F-24 baseline executed in headless duel-map hook with camera-band logging and 12-of-12 MVP unit animation baseline state coverage.
- 2026-06-10: F-18 command coverage baseline executed in headless duel-map hook with acknowledgements across move, attack, attack-move, gather, repair, patrol, hold, stop, and control-group workflows.
- 2026-06-10: F-19 HUD synchronization baseline executed with alert and queue state updates plus camera center feedback from control-group recall.
- 2026-06-10: F-20 resource-discovery and security-dominance baseline executed with deterministic objective timing and resource-loop telemetry in duel-map runtime hook.
- 2026-06-10: F-21 opening parity and clarity gate executed with advanced-system lock verification and faction timing delta checks within parity threshold.
- 2026-06-10: Helion and Veyari opening stabilization model guardrails documented in economy standards and aligned to F-21 telemetry thresholds.

## Owner Map

- Architecture decisions: Tech lead
- Plan maintenance: Project owner
- Research updates: Any contributor making a design-impacting change
