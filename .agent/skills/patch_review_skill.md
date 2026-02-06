# Patch Review Skill

Use when reviewing a concrete SwifWeb patch or change set.

## Checklist

1. **Scope/Git** — compare against the pre-work status; changed paths match approved scope and unrelated user work is untouched.
2. **Intent** — inspect the actual diff and direct callers; confirm it delivers the requested behavior rather than only compiling.
3. **Standards** — for browser-facing work, verify the exact primary spec, observable semantics, names/defaults/errors/identity, and honest support claims.
4. **Architecture** — affected IDs still have one owner; target ownership/dependencies and canonical-vs-ergonomic boundaries remain valid.
5. **Bridge/lifetime** — when relevant, inspect value states, receiver identity, promise/callback completion, closure/listener cleanup, and wasm/native truth.
6. **Focused domain** — apply event, DOM, or CSS owner hazards only when the patch touches that domain.
7. **Verification** — run the smallest meaningful manifest/build/test/runtime/rendered-output/link check proportional to risk.
8. **Docs** — use `documentation_sync_skill.md` only for durable knowledge actually changed.
9. **Final state** — inspect exact diff/status, produce the review artifact, and report any residual risk or unverified behavior.

Any applicable `FORBID-*` pattern blocks acceptance. Do not review hypothetical subsystems outside the patch.
