#!/bin/zsh

set -u

repo_root="$(cd "$(dirname "$0")/../../.." && pwd)"
evidence_file="$repo_root/docs/tracking/stage0-publication-evidence-template.md"
next_steps_file="$repo_root/docs/planning/next-steps.md"
change_log_file="$repo_root/docs/tracking/change-log.md"
scenario_notes_file="$repo_root/docs/tracking/scenario-validation-notes.md"

print_header() {
  echo "Stage 0 Postpublish Gate"
  echo "- repo: $repo_root"
  echo "- timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
}

check_metadata_fields() {
  echo ""
  echo "[1/4] Evidence metadata completeness"

  local missing=0
  local patterns=(
    "^- Date:[[:space:]]*$"
    "^- Time \(local\):[[:space:]]*$"
    "^- Operator:[[:space:]]*$"
    "^- Public page URL:[[:space:]]*$"
    "^- Page status label visible as Pre-Alpha: yes or no[[:space:]]*$"
    "^- Download disabled for Stage 0: yes or no[[:space:]]*$"
    "^- First update post published: yes or no[[:space:]]*$"
    "^- Screenshot count:[[:space:]]*$"
    "^- Clip count:[[:space:]]*$"
  )

  for pattern in "${patterns[@]}"; do
    if grep -nE "$pattern" "$evidence_file" >/dev/null; then
      grep -nE "$pattern" "$evidence_file"
      missing=1
    fi
  done

  if (( missing == 0 )); then
    echo "- metadata fields: complete"
  else
    echo "- metadata fields: incomplete"
  fi

  return $missing
}

check_evidence_checklist() {
  echo ""
  echo "[2/4] Evidence checklist state"

  local unchecked_count
  unchecked_count="$(grep -nE "^- \[ \]" "$evidence_file" | wc -l | tr -d ' ')"

  if [[ "$unchecked_count" == "0" ]]; then
    echo "- evidence checklist: complete"
    return 0
  fi

  echo "- evidence checklist: incomplete"
  grep -nE "^- \[ \]" "$evidence_file" || true
  return 1
}

check_stage0_next_steps() {
  echo ""
  echo "[3/4] Stage 0 next-steps closure rows"

  local stage0_open
  stage0_open="$(grep -nE "^- \[ \] (Publish Stage 0 itch.io Coming Soon page|Run post-publish validation checklist and record public URL, timestamp, media count, and first update-post confirmation|Update closure trackers in one pass: next-steps, change-log, and scenario-validation-notes with publication evidence)" "$next_steps_file" || true)"

  if [[ -z "$stage0_open" ]]; then
    echo "- stage0 next-steps rows: complete"
    return 0
  fi

  echo "- stage0 next-steps rows: incomplete"
  echo "$stage0_open"
  return 1
}

check_tracker_propagation() {
  echo ""
  echo "[4/4] Tracker propagation markers"

  local change_log_marker
  local scenario_marker
  change_log_marker="$(grep -nE "Published itch.io Stage 0 Coming Soon page|Stage 0 publication" "$change_log_file" || true)"
  scenario_marker="$(grep -nE "Stage 0 Publication Closure Validation|Stage 0 external publication closure" "$scenario_notes_file" || true)"

  if [[ -n "$change_log_marker" ]]; then
    echo "- change-log marker: present"
  else
    echo "- change-log marker: missing"
  fi

  if [[ -n "$scenario_marker" ]]; then
    echo "- scenario-validation marker: present"
  else
    echo "- scenario-validation marker: missing"
  fi

  if [[ -n "$change_log_marker" && -n "$scenario_marker" ]]; then
    return 0
  fi
  return 1
}

print_header

overall_ok=0
missing_metadata=0
missing_evidence_checks=0
missing_next_steps=0
missing_tracker_markers=0

check_metadata_fields || missing_metadata=1
check_evidence_checklist || missing_evidence_checks=1
check_stage0_next_steps || missing_next_steps=1
check_tracker_propagation || missing_tracker_markers=1

if (( missing_metadata == 0 && missing_evidence_checks == 0 && missing_next_steps == 0 && missing_tracker_markers == 0 )); then
  overall_ok=1
fi

echo ""
if (( overall_ok == 1 )); then
  echo "Postpublish gate result: READY"
  exit 0
fi

echo "Postpublish gate result: NOT READY"
exit 1
