# Token Management Reference

> Load when: auditing usage, designing rules, or debugging context bloat.

## How tokens are spent in Cursor

Every Agent turn re-sends:
1. **System prompt + rules** (always-on rules on every turn)
2. **MCP tool schemas** (every enabled server)
3. **Attached context** (@files, @folders, @codebase)
4. **Chat history** (grows with each turn; summarized after many messages)
5. **Tool results** (file reads, grep output, terminal output)

## Priority fixes (highest impact first)

| Fix | Typical savings | Effort |
|-----|----------------|--------|
| One task per chat | 30–60% on long sessions | Low |
| Scope rules with globs | 20–50% on input tokens | Medium |
| Disable unused MCP | 10–30% per server | Low |
| Plan before build | 40–70% on complex tasks | Low |
| LLM wiki instead of re-scan | 60–90% on large codebases | High (one-time) |
| Auto/Composer for routine work | 60–90% vs frontier models | Low |

## Rules sizing guide

| Rule type | Target size | Activation |
|-----------|------------|------------|
| Global stance | < 200 words | `alwaysApply: true` |
| Stack/framework | 200–500 words | `globs` |
| Deep reference | 500–800 words | agent-requested |
| Compliance/manual | any | manual only |

## @-mention strategy

| Mention | Cost | When to use |
|---------|------|-------------|
| `@file` | Low | You know the exact file |
| `@folder` | Medium | Need directory structure |
| `@codebase` | High | Exploratory, no starting point |
| `@Past Chats` | Medium | Selective history from prior session |
| `@Branch` | Medium | Review current branch changes |
| `@Docs` | Varies | Framework/library documentation |

## Memories

Memories persist facts across sessions. Useful for project decisions; costly when large fragments attach to every request.

- Review: Settings → Rules → Memories
- Prune stale entries monthly
- Disable if you don't need cross-session recall

## Weekly audit ritual

1. Check Usage dashboard for spikes.
2. Count always-on rule tokens (aim < 2,000).
3. List enabled MCP servers; disable unused.
4. Review longest chat sessions — could they have been shorter?
5. Check if wiki is up to date for active projects.

## External resources

- [Cursor: Agent best practices](https://cursor.com/blog/agent-best-practices)
- [Tokenminning: Cursor guide](https://tokenminning.ai/ides/cursor)
- [Developer Toolkit: Token management](https://developertoolkit.ai/en/cursor-ide/advanced-techniques/token-management/)
