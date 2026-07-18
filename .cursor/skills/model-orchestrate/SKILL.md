---
name: model-orchestrate
description: Advisor-orchestrator workflow — use thinking models to plan and review, fast models to execute, subagents for parallel focused work. Use for model selection, orchestration, advisor pattern, or cost-performance trade-offs.
---

# Model Orchestrate

## Pattern: Advisor → Executor → Reviewer

```
┌─────────────┐     plan      ┌──────────────┐
│  Thinking   │ ────────────► │  Saved Plan  │
│  Model      │               │  .cursor/    │
│  (Advisor)  │ ◄──────────── │  plans/      │
└─────────────┘   human edit  └──────┬───────┘
                                     │ execute
                              ┌──────▼───────┐
                              │  Fast Model  │
                              │  (Executor)  │
                              └──────┬───────┘
                                     │ review
                              ┌──────▼───────┐
                              │  Thinking    │
                              │  (Reviewer)  │
                              └──────────────┘
```

## Step-by-step

### 1. Advisor phase (thinking model)
Prompt:
> "Do NOT write code. Analyze [goal]. Research the codebase. Produce a step-by-step plan with file paths, risks, and success criteria. Save to `.cursor/plans/`."

### 2. Human gate
- Edit plan markdown directly.
- Remove scope creep; add constraints.

### 3. Executor phase (fast model)
Prompt:
> "Implement steps 1–3 of `.cursor/plans/<name>.md`. Do not deviate. Run tests after each step."

### 4. Reviewer phase (thinking model, brief)
Prompt:
> "Review the diff against the plan. Flag security issues, missed edge cases, and deviations. Be concise."

### 5. Fix phase (fast model)
Apply reviewer feedback.

## Subagent orchestration
For large tasks, the advisor delegates to focused subagents:

| Subagent | Scope | Model |
|----------|-------|-------|
| `explore` | Find files, map architecture | Fast |
| `implement` | Write code per plan step | Fast |
| `review` | Security/bug review | Thinking |
| `test` | Run and fix tests | Fast |

Orchestrator (thinking model) assigns tasks, collects results, decides next step.

## Multi-model comparison
For high-stakes or ambiguous tasks:
1. Select 2–3 models in Cursor's model picker.
2. Submit the same planning prompt.
3. Compare plans side-by-side.
4. Merge best elements into one plan before execution.

## Cost math
- Planning: ~5–15% of total tokens but prevents 50%+ waste from wrong implementations.
- Execution: 70–85% of tokens — keep this phase on cheap models.
- Review: ~5–10% — brief thinking model pass.

Reference: `.cursor/reference/model-selection.md`
