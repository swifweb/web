# Workflow

Mandatory development workflow for SwifWeb.

## PLAN → IMPLEMENT → AUDIT

Every non-trivial task follows:

1. **PLAN** — research current facts, define the exact goal, approved paths, primary owner/IDs, supporting context, invariants, risks, and completion evidence. Externalize substantial research/plan state under `.artifacts/planning/<slug>/` according to `ARTIFACTS_WORKFLOW.md`.
2. **IMPLEMENT** — execute the reviewed scope without unrelated expansion. Large or multi-behavior executor work is decomposed into numbered surgical task files before execution. If a material premise fails, stop the affected path and re-plan.
3. **AUDIT** — inspect the real source/diff/Git state, run the smallest meaningful verification, use focused numbered correction tasks when needed, and synchronize only durable knowledge that changed.

Small typo/format-only work may skip a formal artifact plan but still requires scope/result verification.

For substantial iterative work, `.agent/DEVELOPMENT_ORCHESTRATION.md` and `.agent/ARTIFACTS_WORKFLOW.md` are mandatory operational guidance. Detailed implementation/correction mechanics live in task files; the executor receives one short generic `COORDINATOR_PROMPT.md`, executes approved tasks sequentially, and appends evidence after every task.

## Spec-First Vertical Development

For browser APIs, move vertically through the smallest complete slice:

```text
confirm specification surface
→ identify existing target/model ownership
→ implement the canonical bridge behavior
→ add only justified Swift convenience
→ verify observable semantics and lifetime
```

Do not require an entire API family to be complete before a useful narrow wrapper can land. Do not use incremental delivery as permission for knowingly incompatible naming or semantics.

## Verification

Start with the smallest check that can confirm or reject the change, then expand according to scope and risk.

Possible evidence includes:

- targeted source/caller audit;
- `swift package dump-package` for manifest validity;
- a focused SwiftPM build or test target;
- wasm/browser behavior when runtime semantics changed;
- rendered DOM/CSS/string output inspection;
- exact Markdown link and architecture-ID audit;
- final `git diff` and `git status --short --untracked-files=all` inspection.

Compilation alone does not prove browser semantics, event identity, promise failure mapping, or closure cleanup.

Executor reports and `EXECUTION_REPORT.md` are evidence, not proof. Independent audit inspects the actual repository after execution.

## Documentation Synchronization

Use `skills/documentation_sync_skill.md` when durable repository knowledge changes. Update only the owning documents; keep implementation logs, task mechanics, external comparison evidence, and transient Git/session facts in `.artifacts/**`.

After meaningful research, design, implementation, validation, correction, or audit, perform the cheap public-content capture check owned by `PUBLIC_CONTENT_IDEAS.md` using only information already in context. If no genuinely valuable README/docs/website/release/publication material appeared, do not open the bank. If the check is positive, open only the compact router plus the relevant thematic shard and append the smallest useful entry while the example/reasoning/evidence is fresh.

## Patch Audit

Use `skills/patch_review_skill.md` for a formal change-set review. A patch is not accepted until scope, owning architecture rules, relevant Web semantics, verification evidence, documentation coherence, and final Git state pass.

If audit finds implementation defects, create a focused numbered correction wave under `.artifacts/corrections/**` rather than sending one large correction prompt. Independently re-audit after the correction wave.

## Git Safety

Follow `COMMIT_RULES.md`. Never stage, unstage, commit, push, or rewrite history unless explicitly authorized for that exact operation and scope.
