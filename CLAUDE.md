# CLAUDE.md

- The local database runs with `docker compose up -d` and is reachable through the `db` MCP server.
- The `db` server connects as `reader`, a read-only user. Don't try to write to the database.
- Commit messages follow Conventional Commits (`feat:`, `fix:`, `chore:`).
