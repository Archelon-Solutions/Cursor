# Install Globally — Every Project on Your Account

This guide sets up the Archelon Dev Hub so rules and skills apply to **all projects**, not just this repo.

## How global install works

| Method | What it covers | Scope |
|--------|---------------|-------|
| **Plugin** (`~/.cursor/plugins/local/archelon-dev-hub`) | Rules + Skills | All projects (recommended) |
| **Global skills** (`~/.cursor/skills/`) | Skills only | All projects (backup) |
| **User Rules** (Cursor Settings) | Plain-text preferences | All projects (required) |

Cursor does **not** natively read `~/.cursor/rules/*.mdc` globally. The **plugin** is the supported way to get file-based rules everywhere.

---

## Quick install (2 minutes)

### Step 1: Install the plugin

**Option A — Clone directly (recommended, no local repo needed):**

```bash
git clone https://github.com/Archelon-Solutions/Cursor.git ~/.cursor/plugins/local/archelon-dev-hub
```

**Option B — Symlink from an existing clone:**

```bash
cd /path/to/Cursor
./setup/install-global.sh
```

**Option C — One-liner install script:**

```bash
curl -fsSL https://raw.githubusercontent.com/Archelon-Solutions/Cursor/main/setup/install-global.sh | bash -s -- --clone
```

> Use branch `cursor/dev-resources-hub-7a82` until the PR is merged to `main`.

### Step 2: Enable in Cursor

1. Open **Cursor → Settings**
2. Enable: **"Include third-party Plugins, Skills, and other configs"**
3. Run: **Developer → Reload Window**

### Step 3: Verify

Open **Customize** (sidebar):

| Tab | What you should see |
|-----|-------------------|
| **Rules** | `companion` (Always) + `ponytail` (Always) + token-optimization, model-orchestration, development-standards, documentation |
| **Skills** | plan-then-build, token-audit, wiki-maintain, readme-optimize, model-orchestrate, project-bootstrap, ponytail (+ 5 ponytail variants) |

Filter by **User** scope to confirm they're global, not project-only.

### Step 4: User Rules (one-time paste)

1. Open `user-rules/GLOBAL-USER-RULES.md` (or from the plugin path)
2. Copy content between the `---` markers
3. Paste into **Cursor → Settings → Rules → User Rules**
4. Save

User Rules are plain text and sync with your Cursor account. They complement the plugin's file-based rules.

### Ponytail (included)

[Ponytail](https://github.com/DietrichGebert/ponytail) is bundled — lazy senior dev mode (YAGNI, stdlib first, minimal code).

- **Rule:** `ponytail.mdc` (Always)
- **Skills:** `ponytail`, `ponytail-review`, `ponytail-audit`, `ponytail-debt`, `ponytail-gain`, `ponytail-help`

Standalone install without the full hub:

```bash
./setup/install-ponytail.sh
```

---

## What you get in every project

### Always active (via plugin rules)
- `companion`: production-first, minimal scope, token-aware defaults
- `ponytail`: lazy senior dev — YAGNI ladder, stdlib first, no unnecessary deps

### On-demand (via plugin skills — agent loads when relevant)
| Skill | Triggers on |
|-------|------------|
| `plan-then-build` | plan, design, architect, multi-file |
| `token-audit` | token cost, usage, optimization |
| `wiki-maintain` | wiki, knowledge base, llm-wiki |
| `readme-optimize` | README, onboarding docs |
| `model-orchestrate` | model selection, advisor, orchestrator |
| `project-bootstrap` | new project, setup .cursor |
| `ponytail` | yagni, lazy mode, simplest solution, minimal code |
| `ponytail-review` | review diff for over-engineering |
| `ponytail-audit` | whole-repo bloat audit |
| `ponytail-debt` | harvest deferred shortcuts |
| `ponytail-help` | ponytail reference |

### Per-project (optional, when you want project-specific wiki)
Run in any project: *"Use wiki-maintain skill to initialize docs/wiki/"*

---

## Updating

```bash
# If cloned to plugin dir:
cd ~/.cursor/plugins/local/archelon-dev-hub && git pull

# Or:
./setup/install-global.sh --update
```

Then **Developer → Reload Window**.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Plugin not showing | Path must be `~/.cursor/plugins/local/archelon-dev-hub/` (not `cache/local`) |
| Rules/skills missing | Enable third-party plugins in Settings; reload window |
| Team plan blocks local plugins | Ask org admin to enable user-local plugin loading |
| Skills work but rules don't | Check Customize → Rules → filter User scope |
| Windows path issues | Use `mklink /D` instead of `ln -s` for the plugin directory |

---

## Architecture

```
Your Cursor Account
├── User Rules (Settings)          ← plain-text, always on
├── Plugin: archelon-dev-hub       ← rules + skills, all projects
│   ├── .cursor/rules/*.mdc
│   └── .cursor/skills/*/SKILL.md
└── ~/.cursor/skills/ (symlinked)  ← backup skill discovery

Each Project (optional)
└── docs/wiki/                     ← per-project knowledge base
```

## Per-project bootstrap (optional)

To copy config into a specific project (e.g., for teammates via git):

```bash
./setup/bootstrap-project.sh /path/to/project
```

This is only needed if teammates don't have the global plugin installed.
