# Change Log

Track high-level project changes with links to decisions and plans.

## 2026-06-09

- Implemented startup bootstrap checklist in startup script for input profile load, core manager init, and gameplay scene transition state tracking.
- Ran cold-launch startup smoke pass in headless mode and captured bootstrap checklist logs for failure triage baseline.
- Updated sprint tracker to mark startup bootstrap checklist task complete.
- Implemented skirmish faction selector UI gate with explicit availability states and disabled Coming Soon entries for unavailable factions.
- Ran headless skirmish scene smoke check and captured faction availability logs for selector initialization.
- Added campaign perspective-order runtime data source with Veyari-first and Helion-last sequence.
- Wired campaign-order summary into skirmish UI and status telemetry so menu state and campaign-order data remain synchronized.
- Executed F-25 validation in headless skirmish scene run and captured logs proving available and unavailable faction states plus Veyari-first and Helion-last campaign ordering.

## 2026-05-17

- Added project documentation baseline under docs.
- Added architecture decision log, research log, implementation plan, and next-steps tracker.
- Added risk and assumptions registers for governance.
- Added project conventions for naming, folders, scene/script structure, and documentation expectations.
- Added planning artifacts: task backlog, testing strategy, and definition of done.
- Logged ADR-0002 and research entry for conventions and delivery-quality baseline.
- Added project game vision with explicit RTS identity pillars and vertical slice success signals.
- Logged ADR-0003 and research entry for vision alignment.
- Added full faction tech tree and unit list baselines for Helion Directorate and Obsidian Forge.
- Logged ADR-0004 and research entry for progression and roster definition.
- Added map standards for starting locations, expansion layout, contested objectives, and resource placement.
- Added economy and pricing standards for Alloy, Power, Data, pricing bands, and resource-control expectations.
- Logged ADR-0005 and research entry for map and economy standards.
- Logged ADR-0010 and research entry for unified finite global stockpiles with random world event volatility.
- Expanded game vision with four-era civilizational transition identity, One Box premise, maintenance-instability differentiator, and infrastructure warfare framing.
- Logged ADR-0011 and research entry for civilizational transition multiplayer identity and distributed network warfare direction.
- Expanded vision with three-way civilizational collision framing and The Descent as persistent world catalyst.
- Logged ADR-0012 and research entry for Descent-centered architecture and dynamic evolution baseline.
- Added implementation, testing, tech-tree, and sprint tracking updates for Descent objectives and branch emergence validation.
- Added Human-vs-Alien MVP solution with complete Helion and Veyari faction definitions for implementation-first combat scope.
- Logged ADR-0013 and research entry for complete-faction MVP duel baseline and smart map-fighting requirements.
- Added F-16 and F-17 validation flows plus backlog tasks for map-aware tactical behavior.
- Added UI and controls standards for keyboard and mouse bindings, camera controls, command grid, HUD layout, and alerts.
- Logged ADR-0014 and research entry for RTS input and UI baseline.
- Added F-18 and F-19 validation flows plus backlog and sprint tasks for controls and HUD implementation.
- Logged ADR-0015 and research entry establishing resource discovery and security as the primary match objective.
- Added F-20 validation flow and next-step tasks for resource-zone discovery, control, denial, and recapture pacing.
- Logged ADR-0016 and research entry for competitive-clarity-first and phase-gated complexity direction.
- Added F-21 validation flow and implementation tasks for opening-parity and complexity-unlock pacing.
