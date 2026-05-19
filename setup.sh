#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

RETENTION_DB="${RETENTION_DB:-.retention/retention.db}"
mkdir -p "$(dirname "$RETENTION_DB")"

if ! command -v sqlite3 >/dev/null 2>&1; then
  echo "sqlite3 is required for the public local demo" >&2
  exit 1
fi

sqlite3 "$RETENTION_DB" < schema.sql
sqlite3 "$RETENTION_DB" "
INSERT OR IGNORE INTO memories(id, project, memory_type, status, summary, created_at)
VALUES
  ('mem_recent_decision', '${RETENTION_PROJECT:-local}', 'decision', 'hot', 'Recent launch decision', datetime('now', '-3 days')),
  ('mem_old_lesson', '${RETENTION_PROJECT:-local}', 'lesson', 'warm', 'Old lesson ready for archive preview', datetime('now', '-45 days')),
  ('mem_old_message', '${RETENTION_PROJECT:-local}', 'message', 'cold', 'Old message ready for archive preview', datetime('now', '-75 days'));
"

echo "Agent Retention store ready: $RETENTION_DB"
