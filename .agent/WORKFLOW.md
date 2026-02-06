# Workflow

Mandatory development workflow for SwifWeb.

## PLAN → IMPLEMENT → AUDIT

Every non-trivial task follows:

1. **PLAN** — define the exact goal, approved paths, primary owner/IDs, supporting context, invariants, risks, and completion evidence. Write the plan under `.artifacts/planning/` before mutation.
2. **IMPLEMENT** — execute the reviewed scope without unrelated expansion. If a material premise fails, stop and update the plan before continuing.
3. **AUDIT** — inspect the real diff, run the smallest meaningful verification, check Git scope, synchronize only durable knowledge that changed, and record review evidence under `.artifacts/reviews/`.

Each iteration also records the resulting patch or a compact patch summary under `.artifacts/patches/`. Trivial typo or format-only work may use one short artifact per required category.

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

## Documentation Synchronization

Use `skills/documentation_sync_skill.md` when durable repository knowledge changes. Update only the owning documents; keep implementation logs and external comparison evidence transient.

## Patch Audit

Use `skills/patch_review_skill.md` for a formal change-set review. A patch is not accepted until scope, owning architecture rules, relevant Web semantics, verification evidence, documentation coherence, and final Git state pass.

## Git Safety

Follow `COMMIT_RULES.md`. Never stage, commit, or push unless explicitly authorized.
