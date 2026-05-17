# Risk Register

Track risks with clear ownership and mitigation.

| ID | Risk | Impact | Likelihood | Owner | Mitigation | Trigger | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R-001 | Scope growth before core loop is stable | High | Medium | Project owner | Enforce milestone scope gates in implementation plan | New features added without acceptance criteria | Open |
| R-002 | Late architecture decisions for simulation model | High | Medium | Tech lead | Record decisions early in ADR log and review before implementation | Rework in gameplay systems | Open |
| R-003 | Documentation process overhead slows implementation throughput | Medium | Medium | Project owner | Timebox doc updates and use templates for quick updates | Frequent delays attributed to tracking effort | Monitoring |
| R-004 | Vision drift or derivative mechanics reduce originality | High | Medium | Tech lead | Enforce original faction and unit design criteria in game vision and ADR reviews | Milestone features map too directly to reference titles | Open |
| R-005 | Roster scope exceeds first playable slice capacity | High | Medium | Project owner | Enforce unit-list vertical slice lock and defer nonessential Tier 2 and Tier 3 content | M2 slips because too many units are implemented at once | Open |
| R-006 | Spawn or resource asymmetry creates hidden balance bias | High | Medium | Tech lead | Validate maps with F-07 and enforce map-standards.md parity rules | One spawn consistently outperforms the other in testing | Open |
| R-007 | Economy pacing produces single-base stalemates or runaway snowball | High | Medium | Project owner | Tune against economy-standards.md and validate with F-08 | Matches repeatedly stall or end from uncontestable early lead | Open |

## Status Values

- Open
- Monitoring
- Mitigated
- Closed
