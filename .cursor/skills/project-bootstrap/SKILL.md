---
name: project-bootstrap
description: Bootstrap a new project with Cursor config — copy rules, skills, AGENTS.md, wiki scaffold, and README template. Use when starting a new repo, onboarding a project to Cursor, or setting up .cursor directory.
---

# Project Bootstrap

## Prerequisites
- This hub repo cloned or available as remote rules source
- Target project repo initialized with git

## Steps

### 1. Copy core config
Copy from this hub to the target project:
```
.cursor/rules/companion.mdc          → always-on stance
.cursor/rules/development-standards.mdc
.cursor/rules/token-optimization.mdc
.cursor/rules/model-orchestration.mdc
.cursor/rules/documentation.mdc
.cursor/skills/                      → all skills (or cherry-pick)
.cursor/reference/                   → all reference docs
AGENTS.md                            → thin entry point
```

### 2. Customize
- Edit `companion.mdc`: add project-specific commands (build, test, lint).
- Add stack-specific rules with globs (e.g., `**/*.tsx` for React).
- Remove skills not relevant to the project.

### 3. Scaffold wiki
```
docs/wiki/
├── index.md       # "Wiki initialized YYYY-MM-DD. Pages: (none yet)"
└── overview.md    # Placeholder — run wiki-maintain to populate
```

### 4. Optimize README
Run `readme-optimize` skill on the project README.

### 5. Remote rules (optional)
In Cursor → Customize → Rules → Add Rule → Remote Rule (GitHub):
`https://github.com/Archelon-Solutions/Cursor`

### 6. User rules (global)
Copy `user-rules/USER-RULES.md` content into Cursor Settings → Rules → User Rules.

## Verify
- [ ] `alwaysApply` rules < 2,000 tokens combined
- [ ] README has commands table and architecture link
- [ ] AGENTS.md routes tasks to skills
- [ ] Wiki index exists (even if empty)
- [ ] No duplicate content across README, AGENTS.md, and rules

## Symlink option (global skills)
```bash
ln -s /path/to/Cursor/.cursor/skills/* ~/.cursor/skills/
```

Reference: `setup/INSTALL.md`
