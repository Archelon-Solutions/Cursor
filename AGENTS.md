# Agent Instructions

## Hard constraints
- Production-first: no destructive ops without approval.
- Minimal scope: smallest correct diff.
- Token-aware: one task per chat; `@file` over `@codebase`.

## Task routing

| When you need to… | Load |
|-------------------|------|
| Plan a complex feature | `plan-then-build` skill |
| Reduce token usage | `token-audit` skill + `token-optimization` rule |
| Choose models / orchestrate | `model-orchestrate` skill + `model-orchestration` rule |
| Maintain project knowledge | `wiki-maintain` skill → `docs/wiki/index.md` |
| Write or fix README/docs | `readme-optimize` skill |
| Bootstrap a new project | `project-bootstrap` skill |
| Deep reference on any topic | `.cursor/reference/` (load on demand) |

## This repo
Personal Cursor configuration hub for Archelon Solutions. Rules, skills, and reference docs are designed to be copied, symlinked, or imported as remote rules into any project.

## Commands
| Command | Purpose |
|---------|---------|
| Browse rules | `.cursor/rules/` |
| Browse skills | `.cursor/skills/` |
| Browse reference | `.cursor/reference/` |
| Setup guide | `setup/INSTALL.md` |
| User rules template | `user-rules/USER-RULES.md` |

## Index
See `.cursor/README.md` for the full catalog.
