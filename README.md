# agent-retention

Retention and archival for agent memory.

Agent memory fails in two ways: it forgets too much, or it remembers everything
as equally active. This repo demonstrates a small lifecycle model: hot, warm,
cold, archived, still findable.

## Quick Start

```bash
git clone https://github.com/a-mad-av8r/agent-retention
cd agent-retention
cp .env.example .env
./setup.sh
./scripts/retention-preview --older-than 30d
./scripts/retention-run --dry-run
./scripts/retention-verify
```

The demo seeds a few memory records so the preview command has something to
show immediately.

## What Is Included

- `schema.sql` with active memory, archive memory, and retention config tables.
- `scripts/retention-preview`, `scripts/retention-run`,
  `scripts/retention-verify`, `scripts/retention-report`, and
  `scripts/retention-diagnose`.
- Example policy and status-aware archival notes.
- Lifecycle and archive schema docs.

## What Is Deliberately Out

- Production workers and schedulers.
- Legal hold, customer data policy, and billing-linked retention.
- EnGenAI internal retention policy.
- Full multimodal artifact lifecycle.

## Series Map

| Part | Repo | Focus |
| --- | --- | --- |
| 1 | [agent-cortex](https://github.com/a-mad-av8r/agent-cortex) | Operating memory core |
| 2 | [agent-telepathy](https://github.com/a-mad-av8r/agent-telepathy) | Event awareness |
| 3 | [agent-handoffs](https://github.com/a-mad-av8r/agent-handoffs) | Structured transfer |
| 4 | [agent-roles](https://github.com/a-mad-av8r/agent-roles) | Role boundaries |
| 5 | [agent-retention](https://github.com/a-mad-av8r/agent-retention) | Memory lifecycle |
| 6 | [agent-multimodel](https://github.com/a-mad-av8r/agent-multimodel) | Shared protocol across tools |

## Author

Amad Malik - Founder and CEO/CTO of Adaptech AI Ltd, building EnGenAI
([engenai.app](https://engenai.app)).

[LinkedIn](https://www.linkedin.com/in/amadmalik/) | [GitHub](https://github.com/a-mad-av8r)
