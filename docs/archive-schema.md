# Archive Schema

`archive_memories` keeps the same core fields as `memories` plus an
`archived_at` timestamp.

That symmetry matters: archived memory should not become an unstructured dump.
It should remain searchable, reportable, and capable of being restored if the
project needs it again.
