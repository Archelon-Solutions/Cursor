# Cursor Development Hub

Personal Cursor configuration for **Archelon Solutions** — rules, skills, reference docs, and setup guides for efficient AI-assisted development across all projects.

## What's included

| Component | Path | Purpose |
|-----------|------|---------|
| **User Rules template** | `user-rules/USER-RULES.md` | Global preferences (copy to Cursor Settings) |
| **Agent entry point** | `AGENTS.md` | Thin routing table for agents |
| **Rules** | `.cursor/rules/*.mdc` | Scoped instructions (1 always-on + 4 on-demand) |
| **Skills** | `.cursor/skills/*/SKILL.md` | On-demand workflows (6 skills) |
| **Reference** | `.cursor/reference/*.md` | Deep docs loaded lazily (5 references) |
| **Setup guide** | `setup/INSTALL.md` | How to add to your Cursor account |

## Skills

| Skill | What it does |
|-------|-------------|
| `plan-then-build` | Plan Mode workflow: think → review → execute → recover |
| `token-audit` | Audit and reduce token usage across rules, MCP, chats |
| `wiki-maintain` | LLM-as-wiki: compile and maintain `docs/wiki/` |
| `readme-optimize` | AI-optimized README and AGENTS.md structure |
| `model-orchestrate` | Advisor → executor → reviewer model routing |
| `project-bootstrap` | Copy config into new projects |

## Key patterns

### Token optimization
- Thin always-on rules (< 2,000 tokens combined)
- One task per chat; `@file` over `@codebase`
- LLM wiki instead of re-scanning the repo each session
- Plan before build to avoid wasted implementation tokens

### Model orchestration
- **Thinking models** (Opus, GPT-5.x) for planning and review
- **Fast models** (Composer, Auto) for execution
- **Subagents** for parallel focused work delegated by an orchestrator

### LLM-as-wiki
- Compile project knowledge into `docs/wiki/index.md` + topic pages
- Surgical updates on code changes (not full rebuilds)
- 60–90% token savings on large codebases

## Quick start

1. **Global setup**: Copy `user-rules/USER-RULES.md` → Cursor Settings → User Rules
2. **Per project**: Import as Remote Rule from `https://github.com/Archelon-Solutions/Cursor`
3. **Verify**: Customize → Rules and Skills should show the config
4. **Details**: See [setup/INSTALL.md](setup/INSTALL.md)

## Architecture

```
User Rules (global)          ← Cursor Settings
    ↓
AGENTS.md (thin entry)       ← per project
    ↓
.cursor/rules/ (scoped)      ← always-on + globs
    ↓
.cursor/skills/ (on-demand)  ← triggered by task match
    ↓
.cursor/reference/ (lazy)     ← deep docs when needed
    ↓
docs/wiki/ (per project)     ← compiled knowledge base
```

## Resources

Curated external links: [.cursor/reference/cursor-resources.md](.cursor/reference/cursor-resources.md)

Key sources:
- [Cursor Agent Best Practices](https://cursor.com/blog/agent-best-practices)
- [Karpathy LLM Wiki Pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- [Tokenminning: Cursor Guide](https://tokenminning.ai/ides/cursor)

## License

Private configuration for Archelon Solutions. Adapt freely for your own use.
