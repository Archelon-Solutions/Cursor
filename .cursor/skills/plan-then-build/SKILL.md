---
name: plan-then-build
description: Plan Mode workflow for complex features — research codebase, ask clarifying questions, create reviewable plan, then execute with a cheaper model. Use for multi-file changes, architecture decisions, unclear requirements, or when the user says plan, design, architect, or scope.
---

# Plan Then Build

## When to use
- Multi-file or cross-system changes
- Unclear requirements needing exploration
- Architectural decisions with trade-offs
- Any task where fixing a bad implementation costs more tokens than planning

## Steps

### 1. Plan (thinking model)
1. Switch to Plan Mode (`Shift+Tab`) or explicitly plan before coding.
2. Research codebase: find relevant files, patterns, and constraints.
3. Ask 1–3 clarifying questions if requirements are ambiguous.
4. Produce a markdown plan with:
   - Goal and non-goals
   - Files to create/modify (with paths)
   - Ordered implementation steps
   - Success criteria (test command, expected behavior)
   - Risks and rollback plan

### 2. Review (human)
- Edit the plan: remove unnecessary steps, add constraints, correct file paths.
- Click **Save to workspace** → `.cursor/plans/<feature>.md`.

### 3. Execute (fast model)
- Switch to Composer, Auto, or another fast execution model.
- Reference the saved plan: "Implement step 1 of `.cursor/plans/<feature>.md`."
- Implement one step at a time; verify success criteria after each.

### 4. Recover from mismatch
- If output doesn't match intent: **revert**, refine the plan, re-run.
- Do not iterate 10+ turns trying to fix a wrong approach in-chat.

## Done criteria
- All plan steps completed
- Success criteria verified (tests pass, behavior confirmed)
- Plan file updated if approach changed during implementation
