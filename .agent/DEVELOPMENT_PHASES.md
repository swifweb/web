# Development Phases

## 1. Analysis

- Identify requested behavior and target Web API.
- Confirm existing ownership in `MODULES.md`.
- Artifact: `.artifacts/planning/<task>-analysis.md`.

## 2. Planning

- Select exact files and invariants.
- Run `API_CHECKLIST.md` for API additions.
- Artifact: `.artifacts/planning/<task>-plan.md`.

## 3. Codex Prompt

- Write explicit implementation scope.
- Include no-go rules and dependency limits.
- Artifact: `.artifacts/planning/<task>-prompt.md`.

## 4. Patch Review

- Validate diff scope, spec alignment, naming alignment, bridge safety.
- Artifact: `.artifacts/reviews/<task>-review.md`.

## 5. Iteration

- Apply corrections until all gates pass.
- Final patch artifact: `.artifacts/patches/<task>.patch`.
