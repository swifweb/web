# Web API Design and Swift Ergonomics Public Content Ideas

Focused durable idea bank for README/docs/publication material about exposing recognizable Web-platform concepts in Swift while keeping Swift ergonomics additive rather than replacing browser semantics with a project-local model.

Do not load this shard during ordinary development. Read/update it only after a positive public-content capture check or when explicitly preparing public documentation/content.

## Canonical Web concepts first, Swift ergonomics on top

Status: implemented
Good for: README | website docs | article | short post

### Why users should care

SwifWeb's browser-facing APIs are designed so developers can recognize the Web concept they already know. Typed Swift conveniences are allowed, but they sit on top of canonical browser behavior instead of renaming the platform into a framework-specific vocabulary.

That creates a useful public promise:

> Learn the Web API once, then use a Swift-shaped surface without losing the underlying Web semantics.

This is stronger than simply saying "Swift wrappers for JavaScript" because the architecture explicitly protects names, defaults, option omission, mutability/identity, errors, promise/callback timing, and runtime availability.

### Candidate visual

```text
Web specification concept
        │
        ▼
canonical SwifWeb wrapper
        │
        ├── exact browser semantics remain reachable
        │
        ▼
additive typed Swift conveniences
```

Useful contrast for an article/README section:

```text
not: invent a nicer project-local browser model
yes: preserve the real Web model and make it pleasant in Swift
```

### Evidence / provenance

Stable owners:

- `architecture/ARCHITECTURE.md` ARCH-003
- `architecture/API_DESIGN_RULES.md` API-001 through API-008
- `architecture/SPEC_ALIGNMENT.md`

Current `Package.swift` exposes broad DOM/CSS/event/application layers plus many focused Web API products.

### Publication caveat

The design principle and representative wrappers are present in current source, but this entry does not establish which exact APIs are complete or which repository state has been publicly released. Any public capability list must be verified against current source and actual release status first.

## Browser `fetch` rejection becomes Swift `Result` without hiding failure

Status: implemented
Good for: README | website docs | article | API example

### Why users should care

A small representative example of SwifWeb's bridge philosophy is the current `Fetch` wrapper: browser `fetch` still runs as a JavaScript promise, while Swift callers receive `Result<Response, Error>`. Promise rejection is preserved as failure instead of being swallowed or converted into an invented synchronous guarantee.

### Candidate example / visual

Current public shape includes callback-based use conceptually like:

```swift
Fetch(url) { result in
    switch result {
    case .success(let response):
        // use Response
    case .failure(let error):
        // browser/bridge failure remains visible
    }
}
```

Bridge story:

```text
window.fetch(...)
      │
      ▼
 JavaScript Promise
   ┌──┴──┐
resolve reject
   │      │
   ▼      ▼
.success .failure
      │
      ▼
Swift Result<Response, Error>
```

### Evidence / provenance

Current source: `Sources/FetchAPI/Fetch.swift`.

Stable contract: `API_DESIGN_RULES.md` API-005 requires async/error conveniences to preserve completion timing and failure semantics.

### Publication caveat

This entry records current source behavior, not a verified release guarantee. Before publishing exact syntax, re-check the current `Fetch` API, browser/wasm validation, and shipped version. Do not imply that all Fetch API surface is complete because this representative wrapper exists.

## Layered package: broad Web foundations plus focused API targets

Status: implemented
Good for: README | website docs | architecture diagram | article

### Why users should care

SwifWeb is not one undifferentiated browser wrapper target. Its package separates shared foundations and broad browser layers from focused API families, which makes dependencies and imports easier to reason about and lets individual Web concepts have natural ownership.

### Candidate visual

```text
WebFoundation
    │
    ▼
 Events -> DOMEvents -> DOM
                    └-> CSS integration

Web / app composition

focused products alongside the broad layers:
FetchAPI, StreamsAPI, WebSocketAPI,
ServiceWorker, Worker, SharedWorker,
ClipboardAPI, NotificationsAPI, ...
```

The exact graph is intentionally not presented as one perfectly linear hierarchy; `Package.swift` remains the truth for concrete dependencies.

### Evidence / provenance

- `Package.swift`
- `architecture/ARCHITECTURE.md` ARCH-002/004/005
- `architecture/MODULES.md`

### Publication caveat

This is current package structure, not a completeness claim. A target/product name does not mean full standards coverage. Any public diagram must be regenerated or re-verified against current `Package.swift` before publication.
