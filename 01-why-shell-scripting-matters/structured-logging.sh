#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

log_file="${LOG_FILE:-./output.log}"

log() {
  local level="$1"
  shift
  printf '%s [%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$level" "$*"
}

main() {
  mkdir -p "$(dirname "$log_file")"
  {
    log INFO "Logging demo started"
    log INFO "Current user: $(whoami)"
    log INFO "Kernel: $(uname -r)"
    log INFO "Available disk blocks:"
    df -h /
    log INFO "Logging demo completed"
  } | tee -a "$log_file"
}

main "$@"

