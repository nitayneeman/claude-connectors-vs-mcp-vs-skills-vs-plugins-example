# claude-connectors-vs-mcp-vs-skills-vs-plugins-example

An example project for the article "Claude Connectors vs MCP vs Skills vs Plugins - What Goes Where". It covers everything that's added on the machine, so it works in Claude Code only:

| File | What it is |
| --- | --- |
| `.mcp.json` | A local MCP server ([DBHub](https://github.com/bytebase/dbhub)) that queries a local Postgres database |
| `CLAUDE.md` | Instructions that load into every session |
| `.claude/skills/release-notes/SKILL.md` | A project skill that loads only when a task needs it |
| `plugins/blog-tools/` | A plugin that bundles the Notion MCP server with a skill |
| `.claude-plugin/marketplace.json` | Turns this repo into a marketplace, so we can install the plugin |

Connectors aren't here because they live on the claude.ai account (Customize > Connectors), not in a repo.

## Usage

Start the database (Postgres on port `5433`, with a read-only `reader` user):

```bash
docker compose up -d
```

Then run `claude` in the repo and approve the `db` server from `.mcp.json`. Now we can ask Claude something like "Which posts aren't published yet?".

The `release-notes` skill works on merged pull requests, so it's meant for a repo of our own. Copying `.claude/skills/release-notes/` there lets us trigger it directly with `/release-notes`.

To install the plugin:

```
/plugin marketplace add nitayneeman/claude-connectors-vs-mcp-vs-skills-vs-plugins-example
/plugin install blog-tools@example-marketplace
```

The plugin's Notion server needs its own authorization, which `/mcp` handles.

## Where Each Piece Came From

- `/mcp` lists the servers: `db` comes from `.mcp.json`, `notion` from the plugin, and anything with a `claude.ai` prefix is a connector.
- `/skills` lists the skills: `release-notes` from the project and `blog-post` from the plugin.
