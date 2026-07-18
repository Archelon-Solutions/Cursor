# README Structure Reference

> Load when: writing or optimizing READMEs, AGENTS.md, or onboarding docs for AI context.

## Why structure matters

Agents read README first. A well-structured README saves thousands of tokens per session by answering "how do I run this?" without codebase search.

## Optimal README template (< 150 lines)

```markdown
# Project Name

One-sentence description of what this does and who it's for.

## Quick Start

\`\`\`bash
git clone <repo>
cd <repo>
<install command>
<run command>
\`\`\`

## Commands

| Command | Purpose |
|---------|---------|
| `<build>` | Build for production |
| `<dev>` | Start dev server |
| `<test>` | Run test suite |
| `<lint>` | Lint and format |

## Architecture

Brief 2–3 sentence overview. Details: [docs/wiki/overview.md](docs/wiki/overview.md)

## Project Structure

| Path | Purpose |
|------|---------|
| `src/` | Application source |
| `tests/` | Test files |
| `docs/` | Documentation and wiki |

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `DATABASE_URL` | Yes | PostgreSQL connection string |
| `API_KEY` | Yes | External API key |

Copy `.env.example` to `.env` and fill in values.

## Contributing

- Branch: `feature/<description>` or `fix/<description>`
- PRs require passing tests
- See [CONTRIBUTING.md](CONTRIBUTING.md) for details
```

## AGENTS.md template (< 80 lines)

```markdown
# Agent Instructions

## Hard constraints
- Do not commit secrets
- Do not modify production configs without approval
- Minimal scope: smallest correct diff

## Commands
- Build: `<command>`
- Test: `<command>`
- Lint: `<command>`

## Task routing
| Task | Load |
|------|------|
| New feature | `plan-then-build` skill |
| Architecture question | `docs/wiki/index.md` |
| README/docs | `readme-optimize` skill |
| Token/cost concern | `token-audit` skill |
| Model selection | `model-orchestrate` skill |

## Canonical examples
- Component pattern: `src/components/Button.tsx`
- API route pattern: `src/api/users.ts`
- Test pattern: `tests/users.test.ts`
```

## Anti-patterns

| Anti-pattern | Why it's bad | Fix |
|-------------|-------------|-----|
| 500-line README | Eats context every session | Move depth to wiki |
| Duplicating rules in README | Triples token cost | Link to `.cursor/rules/` |
| Pasting API docs | Stale quickly | Link to OpenAPI/schema files |
| No commands table | Agent searches for how to run | Add table near top |
| Vague architecture section | Agent does broad codebase search | Link to wiki overview |

## LLM-friendly doc principles

1. **Tables over prose** for commands, env vars, directory structure.
2. **Links over paste** for architecture, API docs, style guides.
3. **One canonical example** per pattern (link to a real file).
4. **Front-load essentials** — quick start and commands in the first 50 lines.
5. **Version your docs** — `updated` field in wiki pages; date in README changelog.

## Measuring effectiveness

A good README lets an agent:
- [ ] Install and run the project without searching
- [ ] Find the test command without asking
- [ ] Locate architecture docs without `@codebase`
- [ ] Identify canonical code patterns from links
- [ ] Complete all of the above in < 2,000 tokens of README context
