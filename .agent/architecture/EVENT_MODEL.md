# Event Model

Authoritative owner for event target/type ownership, listener identity/options, propagation, and listener closure lifetime.

## Verified Current Facts

- `Events` contains generic event classes, enums, `EventTarget`, and `EventListener` machinery.
- `DOMEvents` contains DOM-oriented handleable protocols and conveniences.
- Some focused targets own event types/listeners specific to their global/runtime surface, such as ServiceWorker behavior.

## Stable Boundary Rules

### EVENT-001 — Event type ownership

Place a broadly reusable Web event primitive in `Events`; place DOM-specific convenience in `DOMEvents`; keep an API-specific event/listener in its focused target when its semantics are not generic. Do not duplicate the same event model across targets.

### EVENT-002 — EventTarget semantics

Event-capable wrappers preserve the standard target/listener contract. Registration, dispatch observation, and removal operate on the correct underlying JavaScript target identity.

### EVENT-003 — Listener identity

Removal must use the same effective target, event type, callback identity, and capture semantics required by the Web API. A convenience that cannot reliably detach must not imply reversibility.

### EVENT-004 — Listener options

Preserve `capture`, `once`, `passive`, signal, and future option semantics when supported by the wrapper. Omission and default values must match browser behavior; do not emulate an option incompatibly in Swift state.

### EVENT-005 — Propagation and cancellation

Do not redefine capture/target/bubble phase, composed paths, default prevention, trusted state, or propagation stopping. Typed conveniences project the underlying event; they do not create a parallel event system.

### EVENT-006 — Listener lifetime

Retained `JSClosure` instances stay alive while registered and release after deterministic detach/invalidation or owner teardown. Avoid capture cycles and unbounded arrays of obsolete callbacks; one-shot behavior must have an explicit cleanup strategy.

### EVENT-007 — DOM integration boundary

DOM elements/documents/windows consume the event contracts defined here. DOM hierarchy or property ownership remains in `DOM_MODEL.md`; event handling must not become hidden DOM mutation state.

## Review Hazards

Check callback identity on removal, capture mismatch, repeated registration, `once` cleanup, passive/default-prevention mismatch, target receiver, closure owner lifetime, and generic-vs-DOM-vs-feature placement.

## Related Owners

- `RUNTIME_BRIDGE.md` — JavaScript closure/value semantics
- `DOM_MODEL.md` — DOM event consumers
- `MODULES.md` — target placement
