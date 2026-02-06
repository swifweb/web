# Foundation Rules

Authoritative owner for the shared JavaScript interoperability boundary centered on `WebFoundation`.

## Verified Current Facts

- `Package.swift` declares JavaScriptKit products only on the `WebFoundation` target.
- `Sources/WebFoundation/Exports.swift` re-exports JavaScriptKit.
- Feature targets import `WebFoundation` and legitimately use re-exported `JSValue`, `JSObject`, and `JSClosure` for API-specific wrappers.

## Stable Boundary Rules

### FOUNDATION-001 — Dependency ownership

`WebFoundation` owns the package-level JavaScriptKit dependency path. A feature target must not independently add/import a competing bridge dependency when the shared boundary suffices.

### FOUNDATION-002 — Intentional re-export

The JavaScriptKit re-export is a deliberate current compatibility surface. Changing or narrowing it is a migration affecting downstream targets and requires caller analysis, not a local cleanup.

### FOUNDATION-003 — Shared primitive ownership

Reusable JS conversion protocols, base wrapper/value types, URL/buffer/form/blob/storage primitives, and generic interop helpers belong in `WebFoundation` when multiple targets share the same semantics.

### FOUNDATION-004 — Feature-specific bridge access

Feature targets may call browser globals and manipulate JavaScriptKit values through `WebFoundation` for their own standard API. This is not a boundary violation. They must still follow `RUNTIME_BRIDGE.md` and must not fork shared conversion, error, or lifetime policy.

### FOUNDATION-005 — No foundation dumping ground

Do not move API-specific request/options/event/domain types into `WebFoundation` merely for reuse convenience. Keep standard ownership with the focused target unless the concept is genuinely cross-platform and semantically shared.

## Related Owners

- `RUNTIME_BRIDGE.md` — runtime/lifetime semantics
- `MODULES.md` — target dependency/export rules
- `API_DESIGN_RULES.md` — feature wrapper shape
