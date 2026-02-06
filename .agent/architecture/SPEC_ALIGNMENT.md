# Spec Alignment

Authoritative owner for standards evidence and preservation of browser-observable semantics.

## Scope

This chunk governs browser-facing behavior and naming. It does not own SwiftPM placement (`MODULES.md`), Swift surface mechanics (`API_DESIGN_RULES.md`), or JavaScript lifetime implementation (`RUNTIME_BRIDGE.md`).

## Stable Boundary Rules

### SPEC-001 — Primary standards evidence

Every new browser-facing concept must trace to a current primary Web specification. Use MDN as supplementary developer documentation, not as sole authority when normative behavior is material. Record exact evidence in the planning/review artifact.

### SPEC-002 — Observable browser semantics

Preserve observable behavior: defaults, state transitions, exceptions/rejections, event ordering, cancellation, mutability, side effects, serialization, and identity. Swift adaptation must not silently substitute a different model.

### SPEC-003 — Concept identity and naming

Keep standard concept identity and exact boundary string names. Swift casing, labels, overloads, and typed enums are allowed only when their mapping to the Web name/value remains unambiguous.

### SPEC-004 — Honest support claims

Do not infer completeness from an API/target name. Unsupported members, partial mappings, runtime restrictions, and intentional deviations must not be documented as full conformance.

### SPEC-005 — Compatibility and runtime behavior

Do not add speculative browser-version workarounds. When compatibility handling is necessary, cite concrete evidence, preserve the standard path, and make fallback behavior explicit. Native/non-wasm behavior must not pretend a browser global exists.

### SPEC-006 — Project-owned extensions

SwifWeb may add application composition or ergonomic facilities, but they must be clearly project-owned and cannot redefine a standard type or operation under the same identity.

## Evidence Procedure

Route current standards research through `../REFERENCE_PROJECTS.md`. Compare the exact specification surface with current source, record gaps/deviations in transient review evidence, and promote only stable rules or verified debt into `.agent/**`.

## Related Owners

- `API_DESIGN_RULES.md` — Swift wrapper design
- `RUNTIME_BRIDGE.md` — interop implementation semantics
- `ARCHITECTURE.md` — SwifWeb-owned application layer
