#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

RETENTION_DB="${RETENTION_DB:-.retention/retention.db}"
RETENTION_PROJECT="${RETENTION_PROJECT:-local}"

sql_escape() {
  printf "%s" "$1" | sed "s/'/''/g"
}

require_db() {
  if ! command -v sqlite3 >/dev/null 2>&1; then
    echo "sqlite3 is required" >&2
    exit 1
  fi
  if [[ ! -f "$RETENTION_DB" ]]; then
    echo "Database not found at $RETENTION_DB. Run ./setup.sh first." >&2
    exit 1
  fi
}

days_from_arg() {
  local value="${1:-30d}"
  printf "%s" "$value" | tr -cd '0-9'
}
