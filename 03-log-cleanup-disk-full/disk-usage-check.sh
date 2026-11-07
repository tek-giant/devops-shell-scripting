#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

threshold="${DISK_THRESHOLD:-85}"

log() {
  local level="$1"
  shift
  printf '%s [%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$level" "$*"
}

check_path() {
  local path="$1"
  local usage
  usage=$(df -P "$path" | awk 'NR==2 {gsub("%","",$5); print $5}')

  if [[ -z "$usage" ]]; then
    log ERROR "Unable to read usage for $path"
    return
  fi

  if (( usage >= threshold )); then
    log WARN "$path is at ${usage}% usage"
  else
    log INFO "$path is at ${usage}% usage"
  fi
}

main() {
  log INFO "Disk usage check started"

  local paths=()
  if (($# > 0)); then
    paths=("$@")
  else
    paths=(/ /var /tmp)
  fi

  for path in "${paths[@]}"; do
    [[ -n "$path" ]] || continue
    check_path "$path"
  done
  log INFO "Disk usage check completed"
}

main "$@"
