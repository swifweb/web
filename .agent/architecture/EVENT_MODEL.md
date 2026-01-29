# Event Model

## EventTarget Contract

- Event-capable wrappers must follow EventTarget semantics.
- Listener registration/removal must be explicit and reversible.

## addEventListener Patterns

- Support standard listener options semantics:
  - `capture`
  - `once`
  - `passive`
- Preserve default option behavior consistent with browser rules.

## Propagation and Lifecycle

- Capture phase, target phase, and bubble phase semantics must not be redefined.
- `once` listeners must detach after first invocation.
- Removal paths must match listener identity and options semantics.

## Events vs DOMEvents Separation

- `Events` contains generic/base event primitives.
- `DOMEvents` contains DOM-specific event wrappers and typed helpers.
- Do not duplicate DOM event models inside `Events`.

## Safety Rules

- Ensure listener closures have bounded lifetime.
- Ensure detach paths release bridge resources.
