# API Design Rules

Authoritative owner for the Swift public shape of browser API wrappers.

## Required Inputs

Before adding or materially changing a wrapper, identify the exact specification surface, existing owning target/type, direct dependencies, JavaScript runtime/lifetime behavior, compatibility impact, and focused verification evidence. Run `API_CHECKLIST.md` in planning and audit.

## Stable Boundary Rules

### API-001 — Real concept or explicit extension

A browser-facing type/member maps to a real standard concept. Project-owned conveniences are allowed only when clearly named/scoped as SwifWeb facilities and not presented as standard API.

### API-002 — Canonical surface first

Keep the standard operation, state, and options recognizable. Implement or preserve the canonical mapping before adding builders, overloads, aliases, or async sugar.

### API-003 — Semantic Swift types

Use a shared existing type only when it represents the same Web semantics. Typed enums/structs must preserve standard raw values, extensibility needs, optionality, and unknown-value behavior.

### API-004 — Options and defaults

Option wrappers preserve field names, omission vs explicit value, defaults, and mutual constraints. Do not eagerly materialize defaults when omission has different browser behavior.

### API-005 — Async and errors

Callback, promise, throwing, and async surfaces preserve completion timing and failure semantics under `RUNTIME_BRIDGE.md`. Convenience adapters must not swallow rejection or invent synchronous guarantees.

### API-006 — Mutability and identity

Reflect whether the Web property is read-only, mutable, live, snapshot, or identity-sensitive. Do not expose a Swift stored value that can drift from a live JavaScript source.

### API-007 — Additive ergonomics

Swift conveniences must delegate to the canonical behavior, remain narrow, and avoid new semantics. Do not rename a standard concept into framework vocabulary solely for fluency.

### API-008 — Documentation and availability truth

Document the standard reference, significant constraints, runtime availability, and deliberate incompleteness. Do not claim target/type existence as full API coverage.

## Compliance

A new or materially changed public wrapper cannot pass review until `API_CHECKLIST.md` has concrete evidence for each applicable item and all affected owner IDs remain satisfied.

## Related Owners

- `SPEC_ALIGNMENT.md` — normative behavior/naming evidence
- `MODULES.md` — placement/dependencies
- `RUNTIME_BRIDGE.md` — runtime mapping
