# itch.io Launch and Feedback Collation Plan

Use this plan to stage release visibility while protecting game quality and collecting actionable feedback.

## Objective

- Build interest before full public demo release.
- Convert page visitors into followers and testers.
- Route incoming feedback into prioritized, testable implementation work.

## Release Stages

## Stage 0 Coming Soon Page (No Download)

- Goal: establish audience and gather wishlists or follows before playable stability is complete.
- Required page content:
  - One-line value proposition focused on resource-control RTS identity.
  - 3 to 5 differentiator bullets tied to game-vision pillars.
  - 3 to 6 in-engine screenshots or short clips with captions.
  - Transparent status label: Pre-Alpha.
  - CTA: Follow for closed test access.
- Exit criteria:
  - At least one update post published.
  - Media set is coherent and representative of real gameplay direction.

## Stage 1 Closed Prototype Distribution

- Goal: gather controlled signal on controls, readability, and early loop quality.
- Access mode:
  - Restricted keys or private page upload.
- Build requirements:
  - Startup and scene-load smoke pass complete.
  - Functional checks for selection, movement, gather, and win/loss loops.
  - Known-issues section included in page body.
- Feedback focus prompts:
  - Early-game readability.
  - Input responsiveness and command confidence.
  - Expansion pressure and comeback windows.
- Exit criteria:
  - Top 5 blocker issues triaged and assigned.
  - At least one iteration patch shipped after feedback round.

## Stage 2 Public Demo Page

- Goal: maximize discovery and conversion while preserving trust through transparency.
- Required page content:
  - Trailer focused on gameplay decisions, not lore-only montage.
  - Feature list aligned with playable systems in build.
  - Build version label and changelog link.
  - Feedback instructions with explicit categories.
- Exit criteria:
  - Public build meets minimum quality gate from this plan.
  - Feedback pipeline can process weekly inflow without backlog collapse.

## Page Blueprint

## Hero Section

- Title: short and memorable.
- Tagline: one sentence describing tactical fantasy and decision pressure.
- Primary CTA: Download Demo or Follow Development.

## About Section

- Paragraph 1: match fantasy and conflict frame.
- Paragraph 2: what players actually do each match.
- Paragraph 3: why this game is distinct from other RTS titles.

## Feature Bullets

- Keep to 5 bullets max.
- Each bullet must map to implemented or near-term systems.
- Prefer decision-oriented language over lore-only language.

## Media Order

- Clip 1: opening expansion and first tactical decision.
- Clip 2: contested objective fight and denial play.
- Clip 3: faction asymmetry moment.
- Clip 4: win/loss state clarity and HUD readability.

## Trust Section

- Current build status.
- Known issues.
- Next milestone target date window.

## Feedback CTA

- Explicitly ask for:
  - Reproduction steps.
  - Build version.
  - Expected behavior vs actual behavior.
  - Screenshot or short clip where possible.

## Feedback Collation Workflow

## Intake Channels

- itch.io comments on game page.
- itch.io devlog comment threads.
- Optional external form linked from page.

## Intake Schema

Every feedback item should be recorded with:

- Feedback ID.
- Date.
- Build version.
- Source channel.
- Category: controls, readability, balance, performance, crash, UX, other.
- Severity: blocker, major, minor, suggestion.
- Reproducibility: always, intermittent, unknown.
- Summary.
- Steps to reproduce.
- Expected result.
- Actual result.
- Attachments available: yes or no.
- Owner.
- Status: new, triaged, in progress, validated, closed, deferred.

## Triage Rules

- Blocker crashes and hard-locks: same-day triage.
- Control/input failures and unreadable state: next patch priority.
- Balance suggestions without reproducible evidence: hold for batch review.
- Duplicate reports: link to canonical issue and merge evidence.

## Weekly Feedback Review Cadence

- Frequency: once per week minimum during active playtest windows.
- Outputs:
  - Top 3 validated issues to fix next.
  - Top 3 suggestions to investigate.
  - One public devlog update summarizing what changed from player feedback.

## Success Metrics

## Interest Metrics

- Page views per week.
- Follows per week.
- Download-to-view conversion rate.
- Devlog engagement (comments per post).

## Quality Metrics

- Crash or blocker reports per 100 sessions.
- Median time from report to triage.
- Median time from triage to fix validation.
- Percentage of reports closed with reproduction evidence.

## Minimum Public Demo Quality Gate

Release publicly only when all checks pass:

- Functional:
  - Core loop (selection, movement, gather, win/loss) is repeatedly playable.
- Integration:
  - Input, HUD feedback, and scenario state remain coherent through full match flow.
- Smoke:
  - Build launches from clean install and reaches first playable state without manual intervention.
- Observability:
  - Logs and player report templates are sufficient to diagnose top issue categories.

## Execution Checklist

- [ ] Create itch.io draft page and reserve branding assets.
- [ ] Draft page copy from blueprint sections.
- [ ] Prepare first media bundle and captions.
- [ ] Define known-issues and feedback instructions block.
- [ ] Publish Stage 0 Coming Soon page.
- [ ] Run closed prototype round (Stage 1) and collect structured reports.
- [ ] Triage top issues and ship one iteration patch.
- [ ] Promote to public demo page (Stage 2) after quality gate passes.
