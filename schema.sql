PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS memories (
  id TEXT PRIMARY KEY,
  project TEXT NOT NULL,
  memory_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'hot',
  summary TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_accessed_at TEXT,
  archived_at TEXT
);

CREATE TABLE IF NOT EXISTS archive_memories (
  id TEXT PRIMARY KEY,
  project TEXT NOT NULL,
  memory_type TEXT NOT NULL,
  status TEXT NOT NULL,
  summary TEXT NOT NULL,
  created_at TEXT NOT NULL,
  last_accessed_at TEXT,
  archived_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS retention_config (
  memory_type TEXT PRIMARY KEY,
  hot_days INTEGER NOT NULL,
  warm_days INTEGER NOT NULL,
  archive_after_days INTEGER NOT NULL
);

INSERT OR IGNORE INTO retention_config(memory_type, hot_days, warm_days, archive_after_days)
VALUES
  ('decision', 14, 90, 365),
  ('lesson', 30, 180, 365),
  ('message', 7, 30, 60),
  ('knowledge', 90, 365, 3650);

CREATE INDEX IF NOT EXISTS idx_memories_project_created
ON memories(project, created_at);
