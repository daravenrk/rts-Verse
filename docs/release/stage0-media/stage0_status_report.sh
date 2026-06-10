#!/bin/zsh

set -u

repo_root="$(cd "$(dirname "$0")/../../.." && pwd)"
media_dir="$repo_root/docs/release/stage0-media"
next_steps="$repo_root/docs/planning/next-steps.md"

print_header() {
  echo "Stage 0 Status Report"
  echo "- repo: $repo_root"
  echo "- timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
}

run_media_audit() {
  echo ""
  echo "[1/2] Media audit"
  zsh "$media_dir/prepublish_audit.sh"
}

run_tracker_check() {
  echo ""
  echo "[2/2] Next-steps blocker check"
  grep -nE "^- \[ \]" "$next_steps" || true
}

print_header
run_media_audit
run_tracker_check
