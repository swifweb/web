# DOM Model

## Ownership

- `DOM` owns element/document/window wrapper behavior.
- DOM wrappers expose browser-like lifecycle and hierarchy operations.

## Hierarchy Rules

- Parent-child relationships must remain explicit and consistent.
- Mutation helpers (`appendChild`, insert/remove paths) must preserve ownership consistency.
- Element wrappers should extend existing base element patterns when possible.

## API Rules

- Attribute/property behavior must mirror DOM semantics.
- Event attachment uses event system contracts from `EVENT_MODEL.md`.
- DOM-specific event types belong in `DOMEvents`, not `Events`.

## Extension Checklist

- Confirm element exists in Web platform.
- Confirm ownership in `DOM` module.
- Confirm event/listener behavior follows `EVENT_MODEL.md`.
- Confirm no duplicate model already exists.
