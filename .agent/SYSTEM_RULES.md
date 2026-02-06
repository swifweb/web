# System Rules

Global invariants for SwifWeb development.

## Planning and Evidence

- Every non-trivial change requires a written plan before implementation.
- Stable documentation reflects verified implementation state or reviewed architecture, not temporary history.
- Planned APIs and targets must never be described as already implemented.
- Transient plans, command output, patch captures, and review evidence belong in `.artifacts/**`.

## Single Authority Per Rule

- Every architecture boundary ID has exactly one authoritative owner chunk.
- Routers, checklists, skills, and overviews cite owners instead of becoming alternate rule authorities.
- `ARCH_INDEX.md` is the authoritative owner and task-routing map.

## Spec-Backed Web Semantics

- Browser-facing wrappers map to real Web-platform concepts and preserve their observable semantics.
- Swift conveniences remain additive and cannot replace canonical behavior.
- Project-owned application composition may add framework behavior only inside the boundary owned by `ARCHITECTURE.md`; it must not be presented as a browser standard.
- Naming and behavior claims require source, specification, or reviewed architecture evidence.

## Ownership and Dependencies

- A Web concept has one natural module owner; do not create duplicate models across targets.
- Target dependencies follow `Package.swift` and the boundaries owned by `MODULES.md`.
- Shared bridge policy belongs to `WebFoundation`; feature targets may perform API-specific JavaScript calls through that dependency but must not fork shared conversion or lifetime rules.
- Cross-API dependencies require a concrete platform or reuse need, not convenience alone.

## Vertical, Non-Speculative Implementation

- Prefer a narrow real wrapper or behavior over a speculative universal abstraction.
- Reuse proven local patterns only after confirming they match the relevant Web specification.
- Do not prebuild protocol, factory, repository, or generic wrapper hierarchies for hypothetical future APIs.
- If implementation proves a reviewed assumption materially wrong, stop and re-plan instead of layering workarounds over it.

## Documentation Self-Maintenance

- Update stable documentation when owned rules, routing, durable facts, source locations, decisions, debt, or task state actually change.
- Self-maintenance is targeted, not ceremonial; do not touch unrelated docs to satisfy a generic checklist.
- Documentation audits verify links, routing, unique ID ownership, and current-vs-planned truth.
- New owner chunks and structured tasks use the compact Markdown templates when applicable.

## Cross-Cutting Review Hazards

When relevant, explicitly check for duplicated authority, browser-semantic drift, hidden cross-target coupling, JavaScript closure/value lifetime leaks, promise error loss, event-listener identity mistakes, incorrect wasm/native behavior, and generated string output that diverges from Web syntax.
