# API Design Rules

## Strict Invariants

- Every API wrapper must map to a real Web API.
- No invented API surface without a spec reference.
- Naming must align with Web naming semantics.
- Swift sugar is additive only and must not replace canonical semantics.

## Required Inputs For New API

- Spec or MDN reference.
- Target owning module.
- Dependency set constrained by `MODULES.md`.
- Bridge requirements constrained by `FOUNDATION_RULES.md`.

## Naming Rules

- Preserve canonical concept names.
- Use Swift casing while keeping Web term identity.
- Do not repurpose existing names for different semantics.

## Wrapper Shape Rules

- Prefer thin wrapper over abstraction layers.
- Keep bridge calls explicit and auditable.
- Keep API behavior close to browser behavior.

## Compliance

- Run `API_CHECKLIST.md` before implementation and review.
