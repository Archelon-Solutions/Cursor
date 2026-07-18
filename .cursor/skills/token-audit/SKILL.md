---
name: token-audit
description: Audit and reduce Cursor token usage — rules, MCP servers, chat hygiene, memories, and model selection. Use when the user asks about token cost, usage dashboard, context bloat, or optimization.
---

# Token Audit

## Inputs needed
- Optional: screenshot or description of Usage dashboard spikes
- Which projects have heavy `.cursor/rules/` or many MCP servers

## Audit steps

### 1. Measure
- Open `cursor.com/dashboard` → Usage.
- Note: input tokens vs output, cache reads, model breakdown.

### 2. Rules audit
- List all `alwaysApply: true` rules across user + project settings.
- Target: combined always-on rules < 2,000 tokens.
- Move long content to `.cursor/reference/` or Skills.
- Add `globs` to file-specific rules.

### 3. MCP audit
- Settings → MCP: disable servers not needed for current task.
- Each enabled server injects tool schemas every Agent turn.

### 4. Chat audit
- Are marathon threads used for unrelated tasks? → one task per chat.
- Is `@codebase` overused? → prefer `@file` / `@folder`.
- Are 8+ files attached per prompt? → reduce to 2–4.

### 5. Memories audit
- Settings → Rules → Memories: prune stale or verbose entries.
- Disable Memories if not needed for cross-session recall.

### 6. Model audit
- Is a frontier model used for routine refactors? → switch to Auto/Composer.
- Is planning skipped on complex tasks? → Plan Mode saves tokens long-term.

### 7. Wiki audit
- Does the agent re-scan the whole repo each session?
- If yes, initialize or update `docs/wiki/` (see `wiki-maintain` skill).

## Output
Produce a prioritized action list with estimated impact:
1. Quick wins (disable MCP, new chat per task)
2. Medium (rule scoping, model routing)
3. Structural (wiki setup, subagent orchestration)

Reference: `.cursor/reference/token-management.md`
