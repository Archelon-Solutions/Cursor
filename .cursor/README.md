# .cursor Directory Index

Thin entry point for agents. Load deep content on demand — never inline reference docs here.

## Rules (`.cursor/rules/`)

| File | Activation | Purpose |
|------|-----------|---------|
| `companion.mdc` | alwaysApply | Session-wide stance (< 200 words) |
| `ponytail.mdc` | alwaysApply | Lazy senior dev — YAGNI, stdlib first, minimal code ([source](https://github.com/DietrichGebert/ponytail)) |
| `token-optimization.mdc` | agent-requested | Token and context efficiency |
| `model-orchestration.mdc` | agent-requested | Advisor → executor model routing |
| `development-standards.mdc` | agent-requested | Cross-project dev standards |
| `documentation.mdc` | globs: `**/*.md` | README and wiki conventions |

## Skills (`.cursor/skills/`)

| Skill | Trigger phrases |
|-------|----------------|
| `plan-then-build` | plan, design, architect, multi-file, scope |
| `token-audit` | token cost, usage, optimization, context bloat |
| `wiki-maintain` | wiki, knowledge base, llm-wiki, compile context |
| `readme-optimize` | README, onboarding docs, AGENTS.md |
| `model-orchestrate` | model selection, advisor, orchestrator |
| `project-bootstrap` | new project, setup .cursor, onboarding |
| `ponytail` | lazy mode, yagni, simplest solution, minimal code |
| `ponytail-review` | review diff for over-engineering |
| `ponytail-audit` | audit whole repo for bloat |
| `ponytail-debt` | harvest deferred `ponytail:` shortcuts |
| `ponytail-gain` | benchmark impact scoreboard |
| `ponytail-help` | ponytail command reference |

## Reference (`.cursor/reference/`)

| File | Topic |
|------|-------|
| `token-management.md` | Token audit, rules budget, chat hygiene |
| `model-selection.md` | Plan/execute/review, subagent orchestration |
| `llm-wiki-pattern.md` | Karpathy wiki pattern, directory layout |
| `readme-structure.md` | AI-optimized README and AGENTS.md templates |
| `cursor-resources.md` | Curated external links and built-in skills |

## Plans (`.cursor/plans/`)

Saved Plan Mode outputs. Create via Plan Mode → "Save to workspace".

## Architecture principle

```
AGENTS.md (thin, always present)
    ↓ routes to
Rules (thin always-on + glob-scoped)
    ↓ routes to
Skills (on-demand workflows)
    ↓ links to
Reference (deep docs, loaded lazily)
```

Optimize for intentional loading. The agent gets a map; retrieval does the rest.
