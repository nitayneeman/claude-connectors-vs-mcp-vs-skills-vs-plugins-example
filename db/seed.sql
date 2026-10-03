CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  published BOOLEAN NOT NULL DEFAULT false,
  published_at DATE
);

INSERT INTO posts (title, slug, published, published_at) VALUES
  ('Getting Started with MCP', 'getting-started-with-mcp', true, '2026-08-12'),
  ('Writing Your First Skill', 'writing-your-first-skill', true, '2026-09-02'),
  ('Packaging a Claude Code Plugin', 'packaging-a-claude-code-plugin', false, NULL);

-- A read-only user for the MCP server
CREATE USER reader WITH PASSWORD 'reader';
GRANT CONNECT ON DATABASE dev TO reader;
GRANT USAGE ON SCHEMA public TO reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO reader;
