# Project Memory

Durable, non-obvious current-state facts useful beyond immediate source and Git inspection.

## Current Package Facts

- The Swift package is named `web` and currently uses Swift tools version 6.1.
- JavaScriptKit `0.17.0` is the sole declared external package dependency; `WebFoundation` is the target that directly declares its products.
- `WebFoundation/Exports.swift` re-exports JavaScriptKit, so feature targets commonly access `JSValue`, `JSObject`, and `JSClosure` through `WebFoundation`.
- Production targets are organized as core layers (`WebFoundation`, `Events`, `DOMEvents`, `DOM`, `CSS`, `Web`) plus focused Web API and worker targets.
- The repository currently contains `WebTests` and `ServiceWorkerTests`; test coverage is not uniform across all API targets.

## Durable Architectural Facts

- SwifWeb is wrapper-first and standards-aligned: canonical browser behavior is the authority, while Swift ergonomics are additive.
- `WebFoundation` owns shared JavaScript interop policy and primitives, but feature wrappers legitimately perform API-specific JavaScript calls through that dependency.
- `Web` owns project-specific application composition, routing, middleware, localization, and preview support; those are SwifWeb framework facilities, not claimed browser standards.
- The manifest contains both newer family targets such as `WorkersAPI` and compatibility/specialized targets such as `Worker`, `SharedWorker`, and `ServiceWorker`; placement changes require an explicit migration rather than assumptions from naming alone.

## Maintenance Reality

- The codebase spans many independently packaged Web API surfaces and contains legacy variation in style and wrapper completeness.
- Current source and `Package.swift` remain the implementation truth. Stable docs describe boundaries and navigation; they do not certify that every wrapper is complete or fully spec-conformant.

## Scope Rule

Do not store task logs, command output, exhaustive file lists, open decisions, or future ideas here. Use Git/source, `.artifacts/**`, `OPEN_DECISIONS.md`, `TODO.md`, or `TECH_DEBT.md` as appropriate.
