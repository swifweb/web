# Architecture Index

Authoritative routing and architecture-ID ownership index for SwifWeb.

## Supporting Authorities

- `SYSTEM_RULES.md` — global invariants; always load
- `WORKFLOW.md` — PLAN → IMPLEMENT → AUDIT
- `COMMIT_RULES.md` — Git and scope safety
- `CONTEXT_LOADING_RULES.md` — progressive context budget
- `STYLE_GUIDELINES.md` — common conventions for Swift production/test edits

These documents do not own architecture IDs and cannot override an owning architecture chunk.

## Architecture ID Rule

Every stable architecture boundary ID has exactly one authoritative owner under `architecture/`. Other documents may cite an ID, summarize it for routing, or turn it into a checklist item, but must not restate its full rule as alternate authority.

## Current ID Ownership

| ID range | Owning chunk | Summary |
|---|---|---|
| `ARCH-001`–`ARCH-005` | `architecture/ARCHITECTURE.md` | Package purpose, layer roles, canonical-vs-ergonomic surfaces, application layer, incremental delivery |
| `SPEC-001`–`SPEC-006` | `architecture/SPEC_ALIGNMENT.md` | Standards evidence, browser semantics, naming, compatibility, project-owned extensions |
| `MODULE-001`–`MODULE-007` | `architecture/MODULES.md` | SwiftPM target ownership, dependency direction, API-family placement, exports and tests |
| `FOUNDATION-001`–`FOUNDATION-005` | `architecture/FOUNDATION_RULES.md` | JavaScriptKit dependency/re-export, shared bridge primitives, feature-wrapper boundary |
| `BRIDGE-001`–`BRIDGE-008` | `architecture/RUNTIME_BRIDGE.md` | JS value/object/closure lifetime, promises, callbacks, wasm/native behavior |
| `API-001`–`API-008` | `architecture/API_DESIGN_RULES.md` | Public wrapper identity, canonical surface, types, options, errors, ergonomics |
| `EVENT-001`–`EVENT-007` | `architecture/EVENT_MODEL.md` | Event ownership, listener identity/options, propagation, closure lifetime |
| `DOM-001`–`DOM-006` | `architecture/DOM_MODEL.md` | DOM ownership, hierarchy, property/attribute semantics, integration |
| `CSS-001`–`CSS-006` | `architecture/CSS_MODEL.md` | Typed CSS ownership, serialization, composition, DOM integration |
| `FORBID-001`–`FORBID-008` | `architecture/FORBIDDEN_PATTERNS.md` | Acceptance-blocking semantic, ownership, dependency, and lifetime patterns |

`architecture/API_CHECKLIST.md` is an operational gate derived from these owners; it owns no competing architecture rules.

## Task-Type Routing

Load one primary chunk and normally no more than two supporting chunks.

| Task / question | Primary owner | Supporting owners when needed |
|---|---|---|
| Package/layer/application-composition boundary | `ARCHITECTURE.md` | `MODULES.md`, relevant focused owner |
| New browser API wrapper or public API shape | `API_DESIGN_RULES.md` | `SPEC_ALIGNMENT.md`, `MODULES.md` |
| Standards/name/behavior compatibility question | `SPEC_ALIGNMENT.md` | `API_DESIGN_RULES.md`, relevant focused owner |
| Target creation, placement, import, dependency, export | `MODULES.md` | `ARCHITECTURE.md`, `FOUNDATION_RULES.md` |
| Shared conversion/interop primitive | `FOUNDATION_RULES.md` | `RUNTIME_BRIDGE.md` |
| `JSValue`/`JSObject`/`JSClosure`, promise, callback, wasm behavior | `RUNTIME_BRIDGE.md` | `FOUNDATION_RULES.md`, relevant API owner |
| Event type/listener/attach/detach/options | `EVENT_MODEL.md` | `RUNTIME_BRIDGE.md`, `DOM_MODEL.md` for DOM events |
| Element/document/window/tree/attributes | `DOM_MODEL.md` | `EVENT_MODEL.md`, `RUNTIME_BRIDGE.md` |
| CSS values/properties/rules/serialization | `CSS_MODEL.md` | `SPEC_ALIGNMENT.md`, `DOM_MODEL.md` |
| Forbidden-pattern or acceptance audit | `FORBIDDEN_PATTERNS.md` | exact affected owner(s) |
| Cross-cutting documentation/control-plane migration | this index | affected owner chunks; context-budget escalation is explicit |

## Operational Routing

| Need | Route |
|---|---|
| Repeated implementation procedure | `SKILL_INDEX.md` |
| New source/template navigation | `SOURCE_MAP.md` |
| Durable docs/task/decision/debt synchronization | `skills/documentation_sync_skill.md` |
| Formal patch review | `skills/patch_review_skill.md` |
| New architecture owner | `templates/architecture_chunk_template.md` |
| Structured active task | `templates/task_template.md` |
| Standards/dependency/external repository evidence | `REFERENCE_PROJECTS.md` |

## Owner Split and Self-Maintenance

Create or split an owner only when it controls a genuinely independent concept and improves routing. Move IDs rather than copying rules, update this index and direct links in the same task, and do not create empty future owner chunks.

## Default Context Budget

Ordinary work uses **1 primary + at most 2 supporting architecture chunks**. Cross-cutting audits may exceed this deliberately; see `CONTEXT_LOADING_RULES.md`.
