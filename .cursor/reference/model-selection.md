# Model Selection Reference

> Load when: choosing models, designing orchestration workflows, or comparing cost vs capability.

## The two-phase pattern

**Phase 1 — Plan** (thinking model, 5–15% of tokens):
- Understand requirements
- Research codebase
- Produce step-by-step plan with file paths
- Identify risks and success criteria

**Phase 2 — Execute** (fast model, 70–85% of tokens):
- Implement from the locked plan
- Run tests, iterate on failures
- Keep scope tight to plan steps

**Phase 3 — Review** (thinking model, 5–10% of tokens):
- Brief security/quality review of diff
- Flag deviations from plan
- Return to fast model for fixes

## Model categories

### Thinking / frontier models
Best for: planning, architecture, security review, subtle debugging, documentation.

Characteristics: slower, more expensive per token, better reasoning, may overthink simple tasks.

### Fast / execution models
Best for: implementing from a clear plan, boilerplate, routine refactors, test fixes.

Characteristics: fast, cheap, good code generation when instructions are precise.

### Auto mode
Cursor selects from a pool of frontier models based on capacity. Good daily driver for mixed work. Turn off when you need a specific model's traits.

## Decision tree

```
Is the task well-defined with a clear plan?
├── Yes → Fast model (Composer, Auto, Haiku)
└── No → Is it architectural or multi-file?
    ├── Yes → Plan Mode with thinking model → then fast model
    └── No → Is it a quick one-file fix?
        ├── Yes → Fast model
        └── No → Thinking model briefly, then fast
```

## Multi-model comparison

Cursor lets you select multiple models and run the same prompt in parallel.

Best for:
- Ambiguous architecture choices
- Comparing code style approaches
- High-stakes changes where you want a second opinion

Workflow:
1. Submit planning prompt to 2–3 models
2. Compare plans side-by-side
3. Merge best elements
4. Execute with one fast model

## Subagent orchestration

| Role | Model | Responsibility |
|------|-------|---------------|
| Orchestrator | Thinking | Decompose task, assign subagents, integrate results |
| Explorer | Fast | Find files, map code structure |
| Implementer | Fast | Write code per plan step |
| Reviewer | Thinking | Security, bugs, plan adherence |
| Tester | Fast | Run tests, fix failures |

The orchestrator should never implement directly — it delegates and synthesizes.

## Cost-performance tips

1. **Never use a frontier model for the entire task** — plan/review on thinking, execute on fast.
2. **Save plans to `.cursor/plans/`** — future sessions resume from the plan, not chat history.
3. **Revert and re-plan** instead of 10+ turn debug loops on thinking models.
4. **Use `/review` and `/review-security` skills** for focused review instead of open-ended thinking model chats.

## External resources

- [Cursor: Plan Mode docs](https://cursor.com/docs/agent/plan-mode)
- [Cursor: Agent best practices](https://cursor.com/blog/agent-best-practices)
- [Strategic model selection (Pareto analysis)](https://danielfridljand.de/post/cursor-model-selection-strategy)
