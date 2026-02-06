# Forbidden Patterns

Authoritative owner for acceptance-blocking patterns across SwifWeb changes.

## Stable Boundary Rules

### FORBID-001 — Invented browser semantics

Reject a browser-facing API that has no standards evidence or assigns project-specific behavior to a standard identity.

### FORBID-002 — Canonical behavior replacement

Reject Swift sugar that removes, hides, or changes the canonical operation, defaults, failure, ordering, identity, or side effects.

### FORBID-003 — Duplicate concept authority

Reject duplicate Web models, mutable state owners, or architecture rule owners across targets/docs when one semantic owner should exist.

### FORBID-004 — Unjustified target coupling

Reject a new dependency/re-export used only for convenience, umbrella access, or diagram symmetry without a concrete semantic/API need.

### FORBID-005 — Competing bridge infrastructure

Reject independent JavaScriptKit dependency paths or feature-local copies of shared conversion/lifetime/error policy. API-specific JS calls through `WebFoundation` remain valid under `FOUNDATION-004`.

### FORBID-006 — Lost failures or value states

Reject swallowed exceptions/rejections, false success on absent browser globals, and accidental collapse of missing/`undefined`/`null`/conversion-failure states.

### FORBID-007 — Unbounded closure/listener lifetime

Reject retained `JSClosure`/listener collections with no usable cleanup strategy, mismatched detach identity, or avoidable capture cycles.

### FORBID-008 — False implementation claims

Reject docs/reviews that describe planned, partial, native-inert, or unverified behavior as currently complete standards support.

## Enforcement

Any applicable forbidden pattern blocks patch acceptance. The review must cite the exact pattern and affected owner evidence; this document is not a substitute for inspecting the concrete code and Web semantics.

## Related Owners

Use `ARCH_INDEX.md` to route from a forbidden finding to the exact semantic, module, API, event, DOM, CSS, foundation, or runtime owner that defines the required correction.
