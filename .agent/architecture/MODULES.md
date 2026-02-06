# Modules

Authoritative owner for SwiftPM target identity, source placement, dependency direction, and cross-target reuse.

## Verified Current Facts

- `Package.swift` is the current target/product/dependency authority.
- Core layer targets are `WebFoundation`, `Events`, `DOMEvents`, `DOM`, `CSS`, and `Web`.
- Focused targets cover workers, messaging, fetch/streams/transports, browser globals/capabilities, and DOM-adjacent APIs.
- `WebFoundation` directly declares JavaScriptKit products; other targets consume its re-exported bridge surface through target dependencies.

## Stable Boundary Rules

### MODULE-001 — Manifest authority

Resolve current products, targets, and dependency edges from `Package.swift`. Documentation groups are navigation aids and must not become a second manifest.

### MODULE-002 — One natural owner

A shared Web concept has one natural target owner. Re-export or depend on that owner when semantics are identical; do not duplicate a model to avoid a justified dependency.

### MODULE-003 — Evidence-based dependency edges

Add a target dependency only for a concrete source/API need consistent with platform semantics. Avoid convenience coupling, umbrella imports, and architecture changes motivated only by visual hierarchy.

### MODULE-004 — Core layer roles

- `WebFoundation` owns shared interop and base values.
- `Events` owns generic event primitives/listener machinery.
- `DOMEvents` owns DOM-focused event conveniences.
- `DOM` owns document/window/element abstractions.
- `CSS` owns typed CSS representation and stylesheet behavior.
- `Web` owns SwifWeb application composition.

Changing these roles requires updating the owner, manifest, source map, and affected routing in one reviewed task.

### MODULE-005 — Focused API-family ownership

Place a browser API in its existing focused target when one exists. Create a target only when the API is independently consumable or needs a real dependency boundary; do not create a target per type or merge families solely because they are adjacent in a browser global.

### MODULE-006 — Export discipline

Re-export only when downstream consumers intentionally need the dependency's public concepts as part of the target's surface. Do not use exports to conceal accidental coupling or competing ownership.

### MODULE-007 — Tests follow behavior ownership

Focused tests belong with the target/behavior they prove. A cross-layer `WebTests` case is appropriate only when high-level composition is the behavior under test; manifest declarations remain required for tests to run under SwiftPM.

## Change Checklist

For a new or moved target, verify manifest validity, directory/product naming, direct dependency necessity, public exports, downstream callers, tests, `SOURCE_MAP.md`, and compatibility/migration impact.

## Related Owners

- `ARCHITECTURE.md` — top-level layer intent
- `FOUNDATION_RULES.md` — JavaScriptKit/shared bridge boundary
- `API_DESIGN_RULES.md` — wrapper ownership inputs
