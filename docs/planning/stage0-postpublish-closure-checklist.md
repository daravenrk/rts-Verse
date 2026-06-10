# Stage 0 Postpublish Closure Checklist

Use this checklist immediately after manual itch.io publication to close the final two blocked tasks in one pass.

## Preconditions

- Stage 0 page is live on itch.io.
- Media package was uploaded from docs/release/stage0-media/.
- First update post is published.

## Closure Steps

1. Fill out docs/tracking/stage0-publication-evidence-template.md.
2. Update docs/planning/next-steps.md:
   - mark Prepare Stage 0 media bundle as complete.
   - mark Publish itch.io Stage 0 Coming Soon page as complete.
   - add one dated completed note with public URL and media count.
3. Update docs/tracking/change-log.md with publication event summary.
4. Update docs/tracking/scenario-validation-notes.md with:
   - publication verification command output or operator evidence summary,
   - URL,
   - timestamp,
   - first update post confirmation.
5. Run final gate command:
   - grep -nE "^- \[ \]" docs/planning/next-steps.md
6. Confirm no unchecked Stage 0 tasks remain.

## Suggested Validation Commands

- grep -nE "Prepare Stage 0 media bundle|Publish itch.io Stage 0 Coming Soon page" docs/planning/next-steps.md
- grep -nE "Stage 0|itch.io" docs/tracking/change-log.md
- grep -nE "Stage 0 Publication" docs/tracking/scenario-validation-notes.md

## Completion Condition

- Closure is complete when both Stage 0 tasks are checked and evidence is logged in all three tracking files.
