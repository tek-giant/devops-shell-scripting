#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

log_file="${LOG_FILE:-}"

log() {
  local level="$1"
  shift
  printf '%s [%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$level" "$*"
}

run_check() {
  local title="$1"
  shift
  log INFO "$title"
  "$@"
  printf '\n'
}

main() {
  log INFO "System check started on $(hostname)"
  run_check "Hostname and uptime:" bash -c 'hostname; uptime'
  run_check "Disk usage:" df -h
  run_check "Memory usage:" free -h
  run_check "Load average:" bash -c 'cat /proc/loadavg'
  log INFO "System check completed"
}

if [[ -n "$log_file" ]]; then
  mkdir -p "$(dirname "$log_file")"
  exec > >(tee -a "$log_file") 2>&1
fi

main "$@"

