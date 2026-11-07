#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

user="${SSH_USER:-devops}"

command_to_run="${REMOTE_COMMAND:-df -h /}"

log() {
  local level="$1"
  shift
  printf '%s [%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$level" "$*"
}

run_remote_check() {
  local host="$1"
  log INFO "Checking ${host}"

  if ssh \
    -o BatchMode=yes \
    -o ConnectTimeout=5 \
    -o StrictHostKeyChecking=accept-new \
    "${user}@${host}" \
    "${command_to_run}"; then
    log INFO "Host ${host} check completed"
  else
    log ERROR "Host ${host} check failed"
  fi
}

main() {
  log INFO "Multi-server check started"

  local servers=()
  if (($# > 0)); then
    servers=("$@")
  else
    servers=(server1.example.com server2.example.com server3.example.com)
  fi

  for host in "${servers[@]}"; do
    [[ -n "$host" ]] || continue
    run_remote_check "$host"
    printf '\n'
  done

  log INFO "Multi-server check completed"
}

main "$@"
