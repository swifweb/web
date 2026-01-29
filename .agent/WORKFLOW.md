# Workflow

## Roles

- ChatGPT: planner, reviewer, invariants checker.
- Codex: executor that edits files.

## Iteration Loop

1. Analysis and plan.
2. Create/update planning artifact in `.artifacts/planning/`.
3. Execute patch in Codex.
4. Export/update patch artifact in `.artifacts/patches/`.
5. Review patch using `.agent/REVIEW_RULES.md` and produce review artifact in `.artifacts/reviews/`.
   Review must validate `SYSTEM_RULES.md` before checklist evaluation.
6. Repeat until acceptance criteria are met.

## Artifact Strictness

- Trivial change: artifact content may be short but must exist.
- Non-trivial change: include scope, affected files, invariants, and risk checks.
- Architecture/API change: include explicit spec-alignment check.

## Patch Acceptance Gates

- Scope is minimal and intentional.
- Spec-alignment is preserved.
- Module boundaries are preserved.
- No direct JS bridge bypass outside `WebFoundation` rules.
- Review is incomplete if `.agent/REVIEW_RULES.md` is not used.
- Review artifacts must reflect checklist execution from `.agent/REVIEW_RULES.md`.
- Patch acceptance requires review-gate completion.
