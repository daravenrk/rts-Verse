#!/bin/zsh

set -u

strict=0
if [[ "${1:-}" == "--strict" ]]; then
  strict=1
fi

base_dir="$(cd "$(dirname "$0")" && pwd)"

required_shots=(
  "stage0-shot-01-opening-expansion.png"
  "stage0-shot-02-contested-objective.png"
  "stage0-shot-03-faction-asymmetry.png"
)
optional_shots=(
  "stage0-shot-04-resource-denial.png"
  "stage0-shot-05-hud-readability.png"
  "stage0-shot-06-end-state.png"
)
optional_clips=(
  "stage0-clip-01-opening-to-contest.mp4"
  "stage0-clip-02-objective-swing.mp4"
)

missing_required=()
found_count=0

for file in "${required_shots[@]}"; do
  if [[ -f "$base_dir/$file" ]]; then
    ((found_count += 1))
  else
    missing_required+=("$file")
  fi
done

for file in "${optional_shots[@]}"; do
  [[ -f "$base_dir/$file" ]] && ((found_count += 1))
done

clip_count=0
for file in "${optional_clips[@]}"; do
  [[ -f "$base_dir/$file" ]] && ((clip_count += 1))
done

captions_ok=0
[[ -f "$base_dir/captions-stage0.md" ]] && captions_ok=1

echo "Stage 0 prepublish audit"
echo "- media folder: $base_dir"
echo "- screenshots found: $found_count"
echo "- clips found: $clip_count"
if (( captions_ok == 1 )); then
  echo "- captions file: present"
else
  echo "- captions file: missing (captions-stage0.md)"
fi

if (( ${#missing_required[@]} > 0 )); then
  echo "- missing required screenshots:"
  for file in "${missing_required[@]}"; do
    echo "  - $file"
  done
else
  echo "- required screenshots: all present"
fi

if (( found_count < 3 || found_count > 6 )); then
  echo "- screenshot count policy: out of range (must be 3 to 6)"
  policy_ok=0
else
  echo "- screenshot count policy: ok"
  policy_ok=1
fi

overall_ok=1
(( ${#missing_required[@]} > 0 )) && overall_ok=0
(( captions_ok == 0 )) && overall_ok=0
(( policy_ok == 0 )) && overall_ok=0

if (( overall_ok == 1 )); then
  echo "Audit result: READY"
else
  echo "Audit result: NOT READY"
fi

if (( strict == 1 && overall_ok == 0 )); then
  exit 1
fi

exit 0
