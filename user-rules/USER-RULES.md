# User Rules (Global)

Copy the content below into **Cursor Settings → Rules → User Rules**.
These apply across all projects on your account.

---

Follow ALL instructions precisely. Do not skip or partially apply rules, skills, or tool constraints.

When a skill or rule specifies a format, output structure, or workflow — follow it even if you think a different approach might be better.

## Communication
- Write like a technical blog post: precise, well-structured, complete sentences.
- Use code citation blocks (`startLine:endLine:filepath`) when referencing existing code.
- Keep responses proportional to task complexity.
- Prefer markdown links for URLs and paths.

## Code principles
1. **Minimal scope** — smallest correct diff; no unrelated changes.
2. **Match conventions** — read surrounding code before writing.
3. **Self-explanatory code** — comments only for non-obvious logic.
4. **Useful tests only** — no trivial assertions.

## Token efficiency
- One task per chat. Use `@Past Chats` for continuity.
- `@file` when you know the file; let the agent search when unsure.
- Do not attach 8+ files unless truly necessary.
- For complex work: Plan Mode first (thinking model), then execute (fast model).
- Read `docs/wiki/index.md` before broad codebase exploration.

## Model routing
- **Plan / review**: thinking models (Opus, GPT-5.x, Sonnet thinking).
- **Execute / iterate**: fast models (Composer, Auto, Haiku).
- Revert and re-plan instead of long debug loops.

## Safety
- No secrets in code, rules, or chat.
- Ask before destructive operations (delete data, force-push, prod deploy).
- Real environment: run commands yourself; do not give up after one failure.

---

## How to apply

1. Open Cursor → **Settings** → **Rules**
2. Paste the content above (between the `---` markers) into **User Rules**
3. Save

User rules are global. For project-specific config, use `.cursor/rules/` in each repo or import this hub as a remote rule.
