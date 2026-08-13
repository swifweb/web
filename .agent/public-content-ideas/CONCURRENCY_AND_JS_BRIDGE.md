# Concurrency and JavaScript Bridge Public Content Ideas

Focused durable idea bank for README/docs/publication material about SwifWeb's browser-state ownership, MainActor isolation, JavaScript bridge lifetime, and Swift concurrency corrections.

Do not load this shard during ordinary development. Read/update it only after a positive public-content capture check or when explicitly preparing migration/release/publication material.

## Treat browser-backed mutable state as actor-owned, not magically Sendable

Status: implemented
Good for: article | migration guide | release notes | short post | advanced docs

### Why users should care

A useful SwifWeb engineering story is the move away from pretending JavaScript-backed or browser-facing mutable state can be passed freely across concurrency domains just because Swift can be made to accept a conformance.

Current source makes important browser/JavaScript-facing abstractions explicitly `@MainActor`, including `JSValuable`, `Storageable`, state observation, event targets/listeners, DOM protocols/elements, `Document`, `Window`, lifecycle helpers, and related singletons/helpers.

The public message is not simply "we added annotations". The stronger story is:

> Concurrency safety should model the ownership of the browser runtime honestly. If a value's correctness depends on JavaScript/browser state and callback lifetime, SwifWeb should isolate that ownership instead of manufacturing `Sendable` confidence.

### Candidate before/after visual

```text
unsafe mental model
-------------------
JS/browser-backed mutable state
        │
        ├── pretend Sendable
        ├── arbitrary task/thread use
        └── lifetime/identity assumptions become implicit

explicit ownership model
------------------------
JS/browser-backed mutable state
        │
        ▼
    @MainActor
        │
        ├── event/listener identity
        ├── DOM/window/document state
        ├── JSValue/JSObject-facing access
        └── callback/lifetime-sensitive mutation
```

Representative current source:

```swift
@MainActor public protocol JSValuable {
    var jsValue: JSValue { get }
}
```

and browser-facing types such as `Document`, `Window`, `BaseElement`, `EventListener`, and `EventTarget` are currently MainActor-isolated.

### Evidence / provenance

Current source includes `@MainActor` across representative files under:

- `Sources/WebFoundation/JSValuable.swift`
- `Sources/WebFoundation/Storageable.swift`
- `Sources/WebFoundation/Dispatch.swift`
- `Sources/WebFoundation/State/**`
- `Sources/Events/**`
- `Sources/DOMEvents/Container.swift`
- `Sources/DOM/**`

Relevant migration commits include:

- `6683afd1` — isolate `Storageable` and `JSValuable`;
- `3d2235a4` — isolate state observation;
- `4c0771ca` — remove unsound `Sendable` conformance from `Storage`;
- `afc3f762` — redesign `Dispatch` around `@MainActor` closures;
- `64db5e9e` — isolate Events layer;
- `dc630b05` — isolate `EventListener`;
- `bafc2a30` — isolate DOMEvents container;
- `43dd2afb` — isolate DOM core protocols/base element;
- `d894745c` — isolate DOM singletons/helpers.

Stable ownership/lifetime context: `architecture/RUNTIME_BRIDGE.md`, `architecture/EVENT_MODEL.md`, `architecture/DOM_MODEL.md`.

### Publication caveat

These changes are present in current branch source, but this entry does not prove that every JavaScript-touching target has completed the same migration, that every affected browser flow has been end-to-end validated, or that the changes are shipped in a public release. Any migration/release claim must verify current source, validation evidence, compatibility notes, and release status first.

## `Dispatch` migration: scheduling browser work with MainActor closures

Status: implemented
Good for: article | migration guide | technical docs | short post

### Why users should care

SwifWeb's `Dispatch` helper is a compact example of evolving a convenience API to match browser/runtime ownership more truthfully. Current scheduling closures are explicitly `@MainActor`, and interval task state is MainActor-owned as well.

This can illustrate how a library can keep familiar scheduling ergonomics while making concurrency ownership visible to the compiler and downstream callers.

### Candidate example

Current shape includes APIs conceptually like:

```swift
Dispatch.async { @MainActor in
    // browser-facing work
}

Dispatch.asyncAfter(0.5) {
    // MainActor-isolated callback
}
```

A useful article angle is that browser timers do not create permission to detach DOM/JS-backed state from its ownership domain. The scheduling mechanism and the state it touches should agree about isolation.

### Evidence / provenance

Current source: `Sources/WebFoundation/Dispatch.swift`.

Relevant commits:

- `b1d4e2ef` — earlier Dispatch actor scheduling migration;
- `afc3f762` — redesign Dispatch from actor to `@MainActor` enum with `@MainActor` closures.

### Publication caveat

The current API is implemented in source, but exact public syntax and migration guidance must be re-checked before publication. Do not claim this alone proves all timer/callback lifetime behavior across every browser API.

## MainActor does not solve reentrancy or JavaScript closure lifetime by itself

Status: architecture-approved
Good for: technical article | advanced docs | short post

### Why users should care

An important nuance worth preserving is that actor isolation fixes an ownership boundary, not every lifecycle problem.

Even when browser-facing state is correctly isolated to `@MainActor`, code can still be wrong if it mishandles:

- synchronous reentrancy;
- listener collection mutation during callback delivery;
- callback ordering;
- `JSClosure` retention/release;
- terminal/shutdown sequencing;
- state invalidation across asynchronous work.

That distinction is valuable public engineering material because it prevents "add `@MainActor` and concurrency is solved" from becoming the wrong lesson.

### Candidate visual

```text
@MainActor solves:
  ownership / isolation boundary

@MainActor does not automatically solve:
  reentrancy
  listener identity
  callback ordering
  JSClosure lifetime
  teardown sequencing
```

### Evidence / provenance

Stable architecture owners:

- `architecture/RUNTIME_BRIDGE.md`
- `architecture/EVENT_MODEL.md`
- `architecture/FORBIDDEN_PATTERNS.md`

Historical concurrency planning/review evidence also treated reentrancy and closure lifetime as separate concerns from actor isolation.

### Publication caveat

This is a stable design/engineering principle, not a claim that every listed lifecycle hazard has already been exhaustively validated or eliminated in current source. Any article using concrete bug/fix examples must verify the specific implementation and evidence before publication.
