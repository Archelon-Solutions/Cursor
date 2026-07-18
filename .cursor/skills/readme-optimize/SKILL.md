---
name: readme-optimize
description: Optimize README and project docs for AI context efficiency — structure, commands table, architecture pointers, and anti-bloat. Use when creating or improving README, onboarding docs, or AGENTS.md.
---

# README Optimize

## Goal
A README that gives agents everything to start working in <2,000 tokens.

## Template structure

```markdown
# Project Name
One-sentence description.

## Quick Start
\`\`\`bash
# install
# run
# test
\`\`\`

## Commands
| Command | Purpose |
|---------|---------|
| `npm run dev` | Start dev server |
| `npm run test` | Run tests |
| `npm run lint` | Lint |

## Architecture
See [docs/wiki/overview.md](docs/wiki/overview.md) for system design.

## Key directories
| Path | Purpose |
|------|---------|
| `src/api/` | REST handlers |
| `src/lib/` | Shared utilities |

## Environment
Copy `.env.example` → `.env`. Required: `DATABASE_URL`, `API_KEY`.

## Contributing
Branch: `feature/<name>`. PRs need tests for behavior changes.
```

## Optimization rules
1. **Commands table** — agents need this most; put it early.
2. **Link, don't paste** — architecture details live in wiki/ADR files.
3. **Canonical examples** — point to one well-written file per pattern.
4. **Under 150 lines** — move depth to `docs/wiki/`.
5. **No duplication** — if it's in AGENTS.md or rules, link instead.

## AGENTS.md (thin entry point)
Keep AGENTS.md under 80 lines:
- Hard constraints (safety, scope)
- Route-by-task table (which skill/rule to load)
- Link to `.cursor/README.md`

## Done criteria
- README readable in under 1 minute
- Agent can run, test, and find architecture without `@codebase` search
- No overlap with `.cursor/rules/` content

Reference: `.cursor/reference/readme-structure.md`
