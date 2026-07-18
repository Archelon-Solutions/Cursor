# LLM Wiki Pattern Reference

> Load when: setting up, maintaining, or querying a project knowledge base.

## Core idea (Karpathy pattern)

Instead of retrieving from raw documents at query time (RAG), the LLM **incrementally builds and maintains a persistent wiki** — structured, interlinked markdown files between you and raw sources.

Knowledge is **compiled once and kept current**, not re-derived on every query.

## Three layers

| Layer | Owner | Purpose |
|-------|-------|---------|
| **Raw sources** | Human | Code, papers, design docs — read-only for the agent |
| **Wiki** | LLM | Synthesized topic pages, cross-references, summaries |
| **Schema** | Human + LLM | `AGENTS.md` + wiki conventions — co-evolved over time |

## Directory layout

```
docs/wiki/
├── index.md              # Catalog: every page + one-line summary
├── overview.md           # System-wide summary (auto-updated)
├── architecture/         # Modules, services, data flow
│   ├── index.md
│   └── api-layer.md
├── concepts/             # Domain concepts
├── operations/           # Deploy, runbooks
├── decisions/            # ADRs
└── sources/              # Source document summaries
```

## Key files

### index.md (navigation catalog)
The agent reads this FIRST on every wiki query. Lists every page with:
- Relative link
- One-line summary
- Tags
- Last updated date

At ~100–200 pages, this stays under 3,000 tokens and replaces full-repo search.

### overview.md (system summary)
High-level architecture, tech stack, key flows. Updated on every ingest.

### Topic pages
- YAML frontmatter: `title`, `tags`, `updated`, `sources`
- One topic per page, < 300 lines
- Cross-links to related pages
- "Sources" field lists which raw files informed this page

## Operations

| Operation | Trigger | Action |
|-----------|---------|--------|
| **Init** | New project | Scan repo, propose topics, generate initial pages |
| **Ingest** | New doc/code area | Read source, update affected wiki pages surgically |
| **Query** | Question | Read index → load 2–5 relevant pages → answer |
| **Lint** | Periodic | Find orphans, stale pages, broken links, duplicates |

## Surgical update rules

1. Read `index.md` to find affected pages.
2. Update ONLY those pages (never full rebuild unless requested).
3. Note contradictions with existing wiki content.
4. Update `index.md` and `overview.md`.
5. Log the operation in a `docs/wiki/log.md` entry.

## Scale limits and fixes

| Scale | Issue | Fix |
|-------|-------|-----|
| < 100 pages | Works with index.md alone | — |
| 100–200 pages | Index gets long | Category sub-indexes |
| 200+ pages | Context overflow risk | Directory-level indexes + stricter page budgets |
| 500+ pages | Index too large for one read | Hierarchical indexes + tag-based routing |

## Token savings

| Without wiki | With wiki |
|-------------|-----------|
| Agent scans 200+ files per session | Agent reads index (1 file) + 2–5 topic pages |
| ~50,000–200,000 tokens per exploration | ~2,000–5,000 tokens per query |
| Knowledge fragments across chats | Knowledge compounds in repo |

## Tools and extensions

- [Karpathy LLM Wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — original pattern
- [Microsoft LLM Wiki VS Code extension](https://github.com/microsoft/llmwiki) — MCP server for wiki ops
- [llm-wiki-compiler](https://github.com/ussumant/llm-wiki-compiler) — compile codebases into topic articles
- [nashsu/llm_wiki](https://github.com/nashsu/llm_wiki) — three-layer architecture with purpose.md

## Integration with Cursor

1. Add wiki path to `AGENTS.md`: "For architecture questions, read `docs/wiki/index.md` first."
2. Use `wiki-maintain` skill for ingest/query/lint operations.
3. Do NOT put wiki content in rules — keep rules thin, wiki deep.
