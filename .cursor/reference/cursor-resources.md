# Cursor Resources Catalog

> Curated resources for effective AI-assisted development in Cursor.

## Official Cursor documentation

| Resource | URL | Topic |
|----------|-----|-------|
| Agent best practices | https://cursor.com/blog/agent-best-practices | Planning, context, rules, skills |
| Plan Mode | https://cursor.com/docs/agent/plan-mode | Pre-implementation planning |
| Rules | https://cursor.com/docs/context/rules | `.cursor/rules/*.mdc` format |
| Skills | https://cursor.com/docs/context/skills | `.cursor/skills/*/SKILL.md` format |
| Subagents | https://cursor.com/docs/context/subagents | Focused agent delegation |
| MCP | https://cursor.com/docs/context/mcp | Model Context Protocol servers |
| Cloud Agents | https://cursor.com/docs/cloud-agent | Background agent workflows |
| Hooks | https://cursor.com/docs/context/hooks | Agent lifecycle automation |
| Usage dashboard | https://cursor.com/dashboard | Token usage monitoring |

## Built-in Cursor skills (type `/` in Agent chat)

| Skill | Purpose |
|-------|---------|
| `/create-rule` | Create scoped rules |
| `/create-skill` | Create agent skills |
| `/create-subagent` | Create custom subagents |
| `/migrate-to-skills` | Convert rules/commands to skills |
| `/review` | Code review |
| `/review-security` | Security review |
| `/review-bugbot` | Bug-focused review |
| `/plan` | Plan Mode |
| `/split-to-prs` | Split large changes into PRs |
| `/babysit` | Monitor PR feedback and CI |

## Token optimization

| Resource | URL |
|----------|-----|
| Tokenminning: Cursor | https://tokenminning.ai/ides/cursor |
| Developer Toolkit: Token management | https://developertoolkit.ai/en/cursor-ide/advanced-techniques/token-management/ |
| Efficient .cursor directory (DEV) | https://dev.to/shrouwoods/an-efficient-cursor-directory-less-context-better-agents-kl0 |

## LLM-as-Wiki

| Resource | URL |
|----------|-----|
| Karpathy LLM Wiki gist | https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f |
| Microsoft LLM Wiki | https://github.com/microsoft/llmwiki |
| llm-wiki-compiler | https://github.com/ussumant/llm-wiki-compiler |
| nashsu/llm_wiki | https://github.com/nashsu/llm_wiki |

## Rules and skills patterns

| Resource | URL |
|----------|-----|
| sbstjn: Skills, rules, agents best practices | https://sbstjn.com/blog/cursor-skills-rules-agents-best-practices/ |
| sbstjn: Skills repo (reference implementation) | https://codeberg.org/sbstjn/skills |
| TrinityTuts: Cursor rules guide 2026 | https://trinitytuts.com/cursor-rules-explained-complete-cursorrules-guide-2026 |

## Model selection

| Resource | URL |
|----------|-----|
| Strategic model selection (Pareto) | https://danielfridljand.de/post/cursor-model-selection-strategy |
| Learn Cursor: Agent overview | https://www.learncursor.dev/learn/cursor-agents/agent-overview |

## Community patterns

| Pattern | Description |
|---------|-------------|
| Plan → Execute → Review | Thinking model plans, fast model executes, thinking model reviews |
| LLM Wiki | Compile knowledge into `docs/wiki/` instead of re-reading sources |
| Subagent orchestration | Large model delegates focused tasks to cheaper subagents |
| One task per chat | Fresh context per task; use `@Past Chats` for continuity |
| Remote rules from GitHub | Share rules across projects via GitHub repo link |
| Symlink global skills | `~/.cursor/skills/` → shared skill library |

## This hub's structure

```
.cursor/
├── README.md              # Index (you are in reference/)
├── rules/                 # Scoped rules (.mdc)
├── skills/                # On-demand workflows (SKILL.md)
├── reference/             # Deep docs (loaded lazily)
│   ├── token-management.md
│   ├── model-selection.md
│   ├── llm-wiki-pattern.md
│   ├── readme-structure.md
│   └── cursor-resources.md  ← this file
└── plans/                 # Saved Plan Mode outputs
```
