---
name: wiki-maintain
description: Maintain an LLM wiki — compile project knowledge into docs/wiki/ with index, topic pages, and surgical updates. Use for knowledge base, wiki, llm-wiki, context compilation, or reducing re-read costs.
---

# Wiki Maintain (LLM-as-Wiki)

## Concept
Instead of re-reading hundreds of files each session, compile knowledge into topic-based markdown pages once. Query the wiki; update surgically when code changes.

## Directory structure
```
docs/wiki/
├── index.md          # Catalog: every page + one-line summary
├── overview.md       # System summary (auto-updated)
├── architecture/     # Modules, services, data flow
├── concepts/         # Domain concepts, patterns
├── operations/       # Deploy, runbooks, env setup
└── decisions/        # ADRs, trade-offs
```

## Operations

### Initialize (`/wiki-init`)
1. Scan repo: README, package manifests, main entry points, ADRs.
2. Propose topic list; get human approval.
3. Generate `index.md`, `overview.md`, and initial topic pages.
4. Add wiki pointer to README and AGENTS.md.

### Ingest (new source added)
1. Read the new source (doc, PR, design note).
2. Read `docs/wiki/index.md` to find affected pages.
3. Update only relevant pages; note contradictions.
4. Update `index.md` and `overview.md`.

### Query (answer from wiki)
1. Read `index.md` first.
2. Load 2–5 relevant topic pages (not the whole wiki).
3. Answer from compiled knowledge; cite wiki page paths.

### Lint (health check)
- Orphan pages (not in index)
- Stale pages (`updated` > 30 days behind related code)
- Duplicate topics
- Broken cross-links

## Page format
```markdown
---
title: Authentication Flow
tags: [auth, security]
updated: 2026-07-18
sources: [src/auth/, docs/adr/003-jwt.md]
---

# Authentication Flow

One-paragraph summary.

## Details
...

## Related
- [Session Management](./concepts/sessions.md)
```

## Rules
- Surgical updates only — never regenerate the entire wiki unless requested.
- Raw sources (code, papers) are read-only; wiki is the synthesized layer.
- Keep each page under 300 lines.

Reference: `.cursor/reference/llm-wiki-pattern.md`
