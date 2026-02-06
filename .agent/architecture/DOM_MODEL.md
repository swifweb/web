# DOM Model

Authoritative owner for document/window/element wrappers, DOM hierarchy, attributes/properties, and DOM-specific integration.

## Verified Current Facts

- `Sources/DOM/` contains document/window/screen abstractions, base element types, HTML element definitions, attribute helpers, and hierarchy utilities.
- The `DOM` target depends on `DOMEvents` and selected browser-global API targets according to `Package.swift`.

## Stable Boundary Rules

### DOM-001 — DOM ownership

Standard document, window, node/element, HTML element, and common DOM hierarchy behavior belongs in `DOM`. API-specific observers/capabilities remain in focused targets unless the platform specification makes them intrinsic DOM concepts.

### DOM-002 — Hierarchy semantics

Append, insert, replace, remove, parent/child, and traversal helpers operate on the real DOM and preserve standard ordering, identity, adoption, and failure behavior. Do not maintain a competing Swift-only tree authority.

### DOM-003 — Attribute vs property fidelity

Preserve the Web distinction between content attributes and live IDL properties, including reflection, boolean/enumerated values, missing values, defaults, and string conversion. A convenience must not conflate two surfaces with different semantics.

### DOM-004 — Live object identity

Document/window/element wrappers represent the underlying JavaScript object identity. Do not copy mutable DOM state into independent Swift storage or fabricate identity-equivalent wrappers when identity matters.

### DOM-005 — Event integration

DOM event attachment and typed event conveniences follow `EVENT_MODEL.md`, including listener identity, options, propagation, and closure lifetime. DOM code must not implement a separate listener contract.

### DOM-006 — Element extension discipline

Before adding an element/member, verify the exact standard interface/mixin and search existing base types/attribute facilities. Reuse inheritance/protocols only when Web semantics match; avoid a monolithic base solely to reduce repetition.

## Review Hazards

Check attribute/property conflation, missing-vs-empty value handling, live collection behavior, element inheritance/mixin placement, wrapper identity, native fallback truth, and event detach behavior.

## Related Owners

- `EVENT_MODEL.md` — DOM event contracts
- `RUNTIME_BRIDGE.md` — JavaScript identity/value behavior
- `CSS_MODEL.md` — style representation/application
