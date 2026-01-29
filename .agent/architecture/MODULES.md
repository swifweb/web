# Modules

## Authoritative Layer Hierarchy

`WebFoundation -> Events -> DOMEvents -> DOM -> CSS -> Web -> APIs`

This hierarchy matches current target intent and dependency direction.

## Core Layer Roles

- `WebFoundation`: bridge layer, shared primitives, JS interop support.
- `Events`: base event objects and enums.
- `DOMEvents`: browser DOM event surface on top of `Events`.
- `DOM`: DOM object model wrappers and element abstractions.
- `CSS`: typed style values and rules used with DOM.
- `Web`: high-level app/routing/page composition.

## API Families

### Workers Family

- `WorkersAPI`, `Worker`, `SharedWorker`, `ServiceWorker`
- Rule: keep worker wrappers family-scoped; avoid unrelated API imports.

### Messaging APIs

- `ChannelMessagingAPI`, `BroadcastChannelAPI`
- Rule: share event/messaging primitives via core layers only.

### Streams/Fetch Family

- `StreamsAPI`, `FetchAPI`, `XMLHttpRequest`, `WebSocketAPI`
- Rule: transport wrappers stay protocol-accurate and avoid cross-family coupling.

### Navigator-Based APIs

- `NavigatorAPI` and APIs consumed through navigator capabilities (`PushAPI`, `NotificationsAPI`, `ContentIndexAPI`, `WorkersAPI` integration points)
- Rule: navigator-linked capability exposure must mirror platform capability boundaries.

## Dependency Invariants

- API modules depend on `WebFoundation` and only the minimal required modules.
- Avoid cross-API coupling by default.
- If API-to-API dependency is required, document exact reason and keep it minimal.
- No dependency may bypass foundation bridge rules.
