# Architecture

Authoritative owner for SwifWeb's package purpose, top-level layer model, and framework-vs-Web-platform boundary.

## Scope

This chunk owns the overall package shape and role of the high-level `Web` layer. Target placement/dependencies belong to `MODULES.md`; standards fidelity belongs to `SPEC_ALIGNMENT.md`; bridge details belong to `FOUNDATION_RULES.md` and `RUNTIME_BRIDGE.md`.

## Verified Current Facts

- `Package.swift` exposes static library products for six broad layers—`WebFoundation`, `Events`, `DOMEvents`, `DOM`, `CSS`, and `Web`—plus focused Web API and worker products.
- `Web` currently contains application building, routing, middleware, controllers/pages, localization, forms, and preview support.
- The target graph is layered but not a single linear chain; the manifest is authoritative for concrete dependencies.

## Stable Boundary Rules

### ARCH-001 — Web framework identity

SwifWeb is a Swift framework for browser applications and Web-platform wrappers. Do not introduce game-runtime, server-runtime, native-GUI, or alternate-browser abstractions into the package core without a separately reviewed product boundary.

### ARCH-002 — Layered package, concrete target graph

Use the broad layer roles for reasoning, but use `Package.swift` for actual target dependencies. Do not invent a cleaner fictional hierarchy or change dependencies merely to make a diagram symmetrical.

### ARCH-003 — Canonical and ergonomic surfaces

Browser-facing layers expose recognizable Web concepts. Typed Swift conveniences may sit above them, but must preserve access to the canonical semantics owned by `SPEC_ALIGNMENT.md` and `API_DESIGN_RULES.md`.

### ARCH-004 — Project-owned application layer

Routing, middleware, builders, controllers/pages, localization, forms, and preview facilities under `Web` are SwifWeb framework features, not claimed Web standards. They may compose standard wrappers but must not redefine the underlying browser semantics.

### ARCH-005 — Incremental capability truth

Implement useful capability in narrow vertical slices. A target or type name does not imply complete standards coverage; docs and reviews must describe partial or platform-limited behavior honestly.

## Related Owners

- `MODULES.md` — target ownership and dependency rules
- `SPEC_ALIGNMENT.md` — browser-semantic authority
- `API_DESIGN_RULES.md` — public wrapper shape
- `FOUNDATION_RULES.md` — shared interop boundary
