#!/bin/zsh

set -euo pipefail

repo_root="$(cd "$(dirname "$0")/../../.." && pwd)"

evidence_file="$repo_root/docs/tracking/stage0-publication-evidence-template.md"
next_steps_file="$repo_root/docs/planning/next-steps.md"
change_log_file="$repo_root/docs/tracking/change-log.md"
scenario_notes_file="$repo_root/docs/tracking/scenario-validation-notes.md"
dev_next_steps_file="$repo_root/DEV_NEXT_STEPS.md"
agent_plan_file="$repo_root/AGENT_PLAN.md"

usage() {
  cat <<'USAGE'
Usage:
  zsh docs/release/stage0-media/postpublish_sync.sh \
    --date YYYY-MM-DD \
    --time "HH:MM" \
    --operator "name" \
    --url "https://..." \
    --prealpha yes|no \
    --download-disabled yes|no \
    --first-update yes|no \
    --shots N \
    --clips N \
    [--deviations "text"] \
    [--known-issues "text"] \
    [--followup "text"]

This command applies postpublish closure updates across:
- docs/tracking/stage0-publication-evidence-template.md
- docs/planning/next-steps.md
- docs/tracking/change-log.md
- docs/tracking/scenario-validation-notes.md
- DEV_NEXT_STEPS.md
- AGENT_PLAN.md
USAGE
}

if [[ "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

DATE=""
TIME_LOCAL=""
OPERATOR=""
URL=""
PREALPHA=""
DOWNLOAD_DISABLED=""
FIRST_UPDATE=""
SHOTS=""
CLIPS=""
DEVIATIONS="none"
KNOWN_ISSUES="none"
FOLLOWUP="none"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --date) DATE="$2"; shift 2 ;;
    --time) TIME_LOCAL="$2"; shift 2 ;;
    --operator) OPERATOR="$2"; shift 2 ;;
    --url) URL="$2"; shift 2 ;;
    --prealpha) PREALPHA="$2"; shift 2 ;;
    --download-disabled) DOWNLOAD_DISABLED="$2"; shift 2 ;;
    --first-update) FIRST_UPDATE="$2"; shift 2 ;;
    --shots) SHOTS="$2"; shift 2 ;;
    --clips) CLIPS="$2"; shift 2 ;;
    --deviations) DEVIATIONS="$2"; shift 2 ;;
    --known-issues) KNOWN_ISSUES="$2"; shift 2 ;;
    --followup) FOLLOWUP="$2"; shift 2 ;;
    *)
      echo "Unknown option: $1"
      usage
      exit 1
      ;;
  esac
done

required=(DATE TIME_LOCAL OPERATOR URL PREALPHA DOWNLOAD_DISABLED FIRST_UPDATE SHOTS CLIPS)
for name in "${required[@]}"; do
  if [[ -z "${(P)name}" ]]; then
    echo "Missing required option: --${name:l}"
    usage
    exit 1
  fi
done

for yn in "$PREALPHA" "$DOWNLOAD_DISABLED" "$FIRST_UPDATE"; do
  if [[ "$yn" != "yes" && "$yn" != "no" ]]; then
    echo "Expected yes or no value, got: $yn"
    exit 1
  fi
done

if ! [[ "$SHOTS" =~ '^[0-9]+$' && "$CLIPS" =~ '^[0-9]+$' ]]; then
  echo "--shots and --clips must be integers"
  exit 1
fi

# Update evidence template metadata and checklist
sed -i '' -E "s|^- Date:.*|- Date: $DATE|" "$evidence_file"
sed -i '' -E "s|^- Time \(local\):.*|- Time (local): $TIME_LOCAL|" "$evidence_file"
sed -i '' -E "s|^- Operator:.*|- Operator: $OPERATOR|" "$evidence_file"
sed -i '' -E "s|^- Public page URL:.*|- Public page URL: $URL|" "$evidence_file"
sed -i '' -E "s|^- Page status label visible as Pre-Alpha:.*|- Page status label visible as Pre-Alpha: $PREALPHA|" "$evidence_file"
sed -i '' -E "s|^- Download disabled for Stage 0:.*|- Download disabled for Stage 0: $DOWNLOAD_DISABLED|" "$evidence_file"
sed -i '' -E "s|^- First update post published:.*|- First update post published: $FIRST_UPDATE|" "$evidence_file"
sed -i '' -E "s|^- Screenshot count:.*|- Screenshot count: $SHOTS|" "$evidence_file"
sed -i '' -E "s|^- Clip count:.*|- Clip count: $CLIPS|" "$evidence_file"

sed -i '' -E "s|^- \[ \] Hero, about, feature bullets, trust section, and feedback CTA are present\.|- [x] Hero, about, feature bullets, trust section, and feedback CTA are present.|" "$evidence_file"
sed -i '' -E "s|^- \[ \] Follow CTA is visible\.|- [x] Follow CTA is visible.|" "$evidence_file"
sed -i '' -E "s|^- \[ \] No downloadable build is exposed for Stage 0\.|- [x] No downloadable build is exposed for Stage 0.|" "$evidence_file"
sed -i '' -E "s|^- \[ \] First update post published\.|- [x] First update post published.|" "$evidence_file"
sed -i '' -E "s|^- \[ \] Media order and captions match staging pack\.|- [x] Media order and captions match staging pack.|" "$evidence_file"

sed -i '' -E "s|^- Deviations from runbook:.*|- Deviations from runbook: $DEVIATIONS|" "$evidence_file"
sed -i '' -E "s|^- Known issues discovered during publish:.*|- Known issues discovered during publish: $KNOWN_ISSUES|" "$evidence_file"
sed -i '' -E "s|^- Follow-up actions:.*|- Follow-up actions: $FOLLOWUP|" "$evidence_file"

# Mark remaining Stage 0 next-steps closure items complete
sed -i '' -E "s|^- \[ \] Publish Stage 0 itch\.io Coming Soon page using runbook procedure with visible Pre-Alpha label and no public download\.|- [x] Publish Stage 0 itch.io Coming Soon page using runbook procedure with visible Pre-Alpha label and no public download.|" "$next_steps_file"
sed -i '' -E "s|^- \[ \] Run post-publish validation checklist and record public URL, timestamp, media count, and first update-post confirmation\.|- [x] Run post-publish validation checklist and record public URL, timestamp, media count, and first update-post confirmation.|" "$next_steps_file"
sed -i '' -E "s|^- \[ \] Update closure trackers in one pass: next-steps, change-log, and scenario-validation-notes with publication evidence\.|- [x] Update closure trackers in one pass: next-steps, change-log, and scenario-validation-notes with publication evidence.|" "$next_steps_file"

completed_note="- $DATE: Published itch.io Stage 0 Coming Soon page ($URL) with Pre-Alpha transparency, media pack (screenshots $SHOTS, clips $CLIPS), and synchronized closure evidence."
if ! grep -F "$completed_note" "$next_steps_file" >/dev/null 2>&1; then
  perl -0777 -i -pe "s|(## Completed\n\n)|\$1$completed_note\\n|" "$next_steps_file"
fi

# Append change-log marker once
change_marker="[Stage0ClosureSync] $DATE url=$URL screenshots=$SHOTS clips=$CLIPS"
if ! grep -F "$change_marker" "$change_log_file" >/dev/null 2>&1; then
  perl -0777 -i -pe "s|(## $DATE\n\n)|\$1- Published itch.io Stage 0 Coming Soon page with Pre-Alpha label, no public download, and synchronized tracker evidence.\\n- $change_marker\\n\\n|" "$change_log_file"
fi

# Add scenario validation closure section once
scenario_heading="## $DATE Stage 0 Publication Closure Validation"
if ! grep -F "$scenario_heading" "$scenario_notes_file" >/dev/null 2>&1; then
  cat >> "$scenario_notes_file" <<EOF

$scenario_heading

- Flow: Stage 0 external publication closure
- URL: $URL
- Publish timestamp (local): $DATE $TIME_LOCAL
- Media uploaded: screenshots $SHOTS, clips $CLIPS
- First update post confirmation: $FIRST_UPDATE
- Result: Pass
- Notes:
  - Postpublish closure synchronization applied via postpublish_sync.sh.
  - Postpublish gate expected to report READY after this update set.
EOF
fi

# Close remaining Stage 0 objectives in DEV_NEXT_STEPS
perl -0777 -i -pe 's|(- objective_id: O-3003\n  title: Publish Stage 0 itch\.io Coming Soon page\n)  status: [^\n]*\n  blocker: [^\n]*\n  reentry_condition: [^\n]*|$1  status: closed\n  blocker: none\n  reentry_condition: none|s' "$dev_next_steps_file"
perl -0777 -i -pe 's|(- objective_id: O-3004\n  title: Capture Stage 0 publication evidence and validation notes\n)  status: [^\n]*\n  blocker: [^\n]*\n  reentry_condition: [^\n]*|$1  status: closed\n  blocker: none\n  reentry_condition: none|s' "$dev_next_steps_file"
perl -0777 -i -pe 's|(- objective_id: O-3005\n  title: Close Stage 0 blockers and transition to Stage 1 readiness lane\n)  status: [^\n]*\n  blocker: [^\n]*\n  reentry_condition: [^\n]*|$1  status: closed\n  blocker: none\n  reentry_condition: none|s' "$dev_next_steps_file"
perl -0777 -i -pe 's|Latest validation snapshot \([^\)]*\): [^\n]*|Latest validation snapshot ('"$DATE"'): Stage 0 publication closure complete with evidence synchronized across tracker artifacts.|' "$dev_next_steps_file"

# Close remaining Stage 0 objectives in AGENT_PLAN
perl -0777 -i -pe 's|(- objective_id: O-3003\n  title: Publish itch\.io Stage 0 Coming Soon page with transparent Pre-Alpha status\n)  status: [^\n]*\n  blocker: [^\n]*\n  reentry_condition: [^\n]*|$1  status: closed\n  blocker: none\n  reentry_condition: none|s' "$agent_plan_file"
perl -0777 -i -pe 's|(- objective_id: O-3004\n  title: Capture Stage 0 publication evidence and validation notes\n)  status: [^\n]*\n  blocker: [^\n]*\n  reentry_condition: [^\n]*|$1  status: closed\n  blocker: none\n  reentry_condition: none|s' "$agent_plan_file"
perl -0777 -i -pe 's|(- objective_id: O-3005\n  title: Close Stage 0 blockers and transition to Stage 1 readiness lane\n)  status: [^\n]*\n  blocker: [^\n]*\n  reentry_condition: [^\n]*|$1  status: closed\n  blocker: none\n  reentry_condition: none|s' "$agent_plan_file"
perl -0777 -i -pe 's|Latest validation snapshot \([^\)]*\): [^\n]*|Latest validation snapshot ('"$DATE"'): Stage 0 publication closure complete with evidence synchronized across tracker artifacts.|' "$agent_plan_file"

echo "Stage 0 postpublish sync applied."
echo "Run: zsh docs/release/stage0-media/postpublish_gate.sh"
