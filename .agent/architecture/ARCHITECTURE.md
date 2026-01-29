# Architecture

SwifWeb is a layered Web API wrapper framework for Swift.

## Layer Model

1. `WebFoundation`: JS interop primitives and bridge utilities.
2. `Events`: generic event primitives.
3. `DOMEvents`: DOM-specific event types on top of `Events`.
4. `DOM`: element/document/window abstractions.
5. `CSS`: typed CSS DSL integrated with DOM usage.
6. `Web`: app composition, routing, controllers, pages.
7. API wrappers: targeted browser APIs (Fetch, Streams, Worker families, etc.).

## Core Intent

- Mirror browser platform APIs.
- Keep wrappers thin and explicit.
- Add Swift ergonomics without semantic divergence.

## Governance Links

- `SPEC_ALIGNMENT.md`
- `MODULES.md`
- `FOUNDATION_RULES.md`
- `API_DESIGN_RULES.md`
