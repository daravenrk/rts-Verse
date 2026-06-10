# Stage 0 Operator Closure Worksheet

Use this worksheet during the external Stage 0 execution window to close T-0046 through T-0050 in one deterministic pass.

## Operator Session Metadata

- Date:
- Time (local start):
- Operator:
- Branch:
- Goal: Close Stage 0 external publication blockers with complete evidence and tracker updates.

## Execution Sequence

| Order | Task ID | Action | Required Output | Result |
| --- | --- | --- | --- | --- |
| 1 | T-0046 | Capture 3 to 6 screenshots and optional clips, then finalize gameplay-first captions | Finalized media set and captions-stage0.md | Todo |
| 2 | T-0047 | Stage media package in docs/release/stage0-media/ and run prepublish audit | prepublish_audit.sh pass with zero unresolved findings | Todo |
| 3 | T-0048 | Publish Stage 0 itch.io Coming Soon page per runbook | Public page live with Pre-Alpha label and no download | Todo |
| 4 | T-0049 | Complete evidence template and record publish verification notes | stage0-publication-evidence-template.md fully populated | Todo |
| 5 | T-0050 | Update trackers and close parked objectives | next-steps, change-log, scenario notes updated | Todo |

## Validation Commands

- `zsh docs/release/stage0-media/prepublish_audit.sh`
- `zsh docs/release/stage0-media/stage0_status_report.sh`
- `grep -nE "Stage 0|itch.io|T-0046|T-0050" docs/tracking/change-log.md`
- `grep -nE "Stage 0" docs/tracking/scenario-validation-notes.md`
- `grep -nE "^\- \[ \]" docs/planning/next-steps.md`

## Publish Verification Notes

- Public page URL:
- Pre-Alpha label visible above fold: yes or no
- Download disabled for Stage 0: yes or no
- First update post URL or confirmation:
- Media count uploaded: screenshots [count], clips [count]
- Deviations from runbook:

## Tracker Update Checklist

- [ ] Mark all Stage 0 closure tasks complete in docs/planning/next-steps.md.
- [ ] Add publication event line in docs/tracking/change-log.md.
- [ ] Add Stage 0 publication validation section in docs/tracking/scenario-validation-notes.md.
- [ ] Confirm stage0-publication-evidence-template.md reflects final publication metadata.
- [ ] Update DEV_NEXT_STEPS parked objective lane from parked to closed.

## Completion Gate

- [ ] No unchecked Stage 0 closure items remain in docs/planning/next-steps.md.
- [ ] status report shows no unresolved Stage 0 blocker notes.
- [ ] Evidence and tracker updates include URL, timestamp, and media inventory.
