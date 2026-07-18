# Global User Rules — Copy to Cursor Account

**One-time setup:** Cursor → **Settings** → **Rules** → **User Rules** → paste everything between the `---` lines below → Save.

These rules apply to **every project** on your account. They work together with the `archelon-dev-hub` plugin (rules + skills installed via `setup/install-global.sh`).

---

Follow ALL instructions precisely. Do not skip or partially apply rules, skills, or tool constraints.

## Global plugin (archelon-dev-hub)
The `archelon-dev-hub` plugin provides global rules and skills. Use them automatically:
- **Rules**: companion (always), token-optimization, model-orchestration, development-standards, documentation
- **Skills**: plan-then-build, token-audit, wiki-maintain, readme-optimize, model-orchestrate, project-bootstrap

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

## Token efficiency (every project)
- One task per chat. Use `@Past Chats` for continuity.
- `@file` when you know the file; let the agent search when unsure.
- Do not attach 8+ files unless truly necessary.
- For complex work: use `plan-then-build` skill or Plan Mode (Shift+Tab) before coding.
- Before broad codebase exploration, check if `docs/wiki/index.md` exists and read it first.
- For token cost concerns, use the `token-audit` skill.

## Model routing (every project)
- **Plan / review**: thinking models (Opus, GPT-5.x, Sonnet thinking).
- **Execute / iterate**: fast models (Composer, Auto, Haiku).
- Revert and re-plan instead of long debug loops.
- For orchestration details, use the `model-orchestrate` skill.

## Safety
- No secrets in code, rules, or chat.
- Ask before destructive operations (delete data, force-push, prod deploy).
- Real environment: run commands yourself; do not give up after one failure.

---

## Install the plugin (if not done yet)

Run once on your machine:

```bash
git clone https://github.com/Archelon-Solutions/Cursor.git ~/.cursor/plugins/local/archelon-dev-hub
```

Or if you already have the repo cloned:

```bash
./setup/install-global.sh
```

Then: enable third-party plugins in Settings → Developer: Reload Window.

Full guide: `setup/INSTALL.md`
