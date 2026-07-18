# Install Guide — Add to Your Cursor Account

This hub provides rules, skills, reference docs, and user-rule templates for efficient AI-assisted development across all your projects.

## Quick setup (5 minutes)

### Step 1: User Rules (global, all projects)

1. Open Cursor → **Settings** → **Rules**
2. Open `user-rules/USER-RULES.md` from this repo
3. Copy the content between the `---` markers
4. Paste into **User Rules** and save

This applies communication, code, token, and model-routing preferences to every project.

### Step 2: Import as Remote Rules (per project or global)

**Option A — Per project (recommended for team repos):**

1. Open the target project in Cursor
2. Go to **Customize** (sidebar) → **Rules** → **Add Rule**
3. Select **Remote Rule (GitHub)**
4. Enter: `https://github.com/Archelon-Solutions/Cursor`
5. Cursor pulls rules and skills from this repo automatically

**Option B — Copy into project:**

```bash
# From your target project root:
cp -r /path/to/Cursor/.cursor ./
cp /path/to/Cursor/AGENTS.md ./
```

Then customize `companion.mdc` with project-specific commands.

**Option C — Symlink global skills (all projects):**

```bash
mkdir -p ~/.cursor/skills
ln -sf /path/to/Cursor/.cursor/skills/* ~/.cursor/skills/
```

Skills in `~/.cursor/skills/` are available in every project.

### Step 3: Verify in Cursor

1. Open **Customize** → **Rules**: you should see `companion` (always apply) and other rules
2. Open **Customize** → **Skills**: you should see `plan-then-build`, `token-audit`, etc.
3. In Agent chat, type `/` — built-in and custom skills should appear

### Step 4: Bootstrap a project wiki (optional, high impact)

In any project where you want token savings:

1. Open Agent chat in that project
2. Say: "Use the wiki-maintain skill to initialize `docs/wiki/` for this project"
3. The agent scans the repo and creates `index.md`, `overview.md`, and topic pages

## What each layer does

| Layer | Location | Scope | Token cost |
|-------|----------|-------|-----------|
| User Rules | Cursor Settings | All projects | Every prompt |
| Rules | `.cursor/rules/*.mdc` | Per project | Always-on or glob-scoped |
| Skills | `.cursor/skills/*/SKILL.md` | Per project or global | On-demand (~30–50 tokens until triggered) |
| Reference | `.cursor/reference/*.md` | Per project | Only when skill/rule links to it |
| Wiki | `docs/wiki/` | Per project | Index + 2–5 pages per query |
| Plans | `.cursor/plans/` | Per project | Loaded when referenced |

## Recommended workflow

### Daily development
1. Use **Auto** or **Composer** for routine tasks
2. Use **Plan Mode** (`Shift+Tab`) for multi-file or architectural work
3. One chat per task; start fresh when switching features

### Weekly maintenance
1. Check Usage dashboard for token spikes
2. Run `token-audit` skill if costs are high
3. Update wiki pages for areas you changed this week

### New project onboarding
1. Run `project-bootstrap` skill
2. Customize `companion.mdc` with project commands
3. Add stack-specific rules with globs (e.g., `**/*.tsx`)

## Model orchestration cheat sheet

```
Complex task?
  → Plan Mode (thinking model) → save plan
  → Review/edit plan
  → Execute (Composer/Auto)
  → Brief review (thinking model)
  → Fix (fast model)

Routine task?
  → Auto or Composer directly

Unsure which model?
  → Multi-model comparison on the planning prompt
```

## Troubleshooting

| Issue | Fix |
|-------|-----|
| Rules not appearing | Check `.cursor/rules/` exists; restart Cursor |
| Skills not discovered | Ensure `SKILL.md` is inside a named folder under `.cursor/skills/` |
| High token usage | Run `token-audit` skill; check always-on rules size |
| Agent ignores wiki | Add pointer in `AGENTS.md`: "Read `docs/wiki/index.md` first" |
| Remote rules not syncing | Re-add the GitHub URL; check repo is public or Cursor has access |

## Keeping this hub updated

This repo is the source of truth. When you improve a rule or skill:
1. Edit in this repo
2. Commit and push
3. Remote rules auto-sync; copied/symlinked projects need manual `git pull` or re-copy

## External resources

See `.cursor/reference/cursor-resources.md` for the full curated list.
