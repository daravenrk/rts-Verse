# Architecture Decision Log

Status values: Proposed, Accepted, Deprecated, Superseded

## ADR-0001 Documentation Baseline

- Date: 2026-05-17
- Status: Accepted
- Context: The project had no architecture or planning artifacts, which made technical decisions and delivery state hard to trace.
- Decision: Establish a lightweight documentation system under docs with architecture, research, planning, and tracking files.
- Consequences:
  - Positive: Clear history and handoff for future contributors.
  - Positive: Easier to connect implementation work to verified decisions.
  - Tradeoff: Requires regular maintenance discipline.
- Validation approach:
  - Functional: Team can record a decision in this file with status and rationale.
  - Process: Every implementation task links to an ADR or documented assumption.

## ADR-0002 Conventions and Delivery Quality Baseline

- Date: 2026-05-17
- Status: Accepted
- Context: The documentation baseline existed, but no explicit conventions, backlog format, test strategy, or done criteria were defined.
- Decision: Add project conventions, task backlog, testing strategy, and definition of done under planning to standardize execution quality.
- Rationale:
  - Reduce ambiguity in naming, folder layout, and validation expectations.
  - Improve milestone predictability by requiring task-level traceability.
- Tradeoffs:
  - Adds process overhead for small changes.
  - Requires regular backlog and test-flow maintenance.
- Alternatives considered:
  - Keep conventions implicit in code reviews only.
  - Delay governance docs until after first gameplay implementation.
- Validation approach:
  - Functional: Contributors can create tasks and execute test flows from documented templates.
  - Integration: Plan, next steps, and tracking registers reference and use the new docs.
  - Smoke: M1 foundations are verifiably complete with linked governance artifacts.
  - Observability: Test execution notes include pass or fail outcomes and follow-up tasks.
- Related plan items:
  - M1 Project Foundations
- Related research:
  - Entry-0002 in research/research-log.md

## ADR Template

## ADR-XXXX Title

- Date: YYYY-MM-DD
- Status: Proposed | Accepted | Deprecated | Superseded
- Context:
- Decision:
- Rationale:
- Tradeoffs:
- Alternatives considered:
- Validation approach:
  - Functional:
  - Integration:
  - Smoke:
  - Observability:
- Related plan items:
- Related research:
