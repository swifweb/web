# DOM Manipulation Skill

Use for element/document/window wrappers, DOM hierarchy mutations, attributes/properties, or DOM event integration.

## Required Context

- Primary: `architecture/DOM_MODEL.md`
- Supporting: `architecture/EVENT_MODEL.md` or `architecture/RUNTIME_BRIDGE.md` only as the behavior requires

## Procedure

1. Locate the exact standard interface/mixin/member and current SwifWeb owner/base pattern.
2. Determine whether the surface is an attribute, live property, method, collection, or hierarchy mutation.
3. Preserve underlying DOM identity, ordering, adoption, missing/empty values, defaults, and failure behavior.
4. Reuse a base/protocol/attribute helper only when the same semantics apply; avoid a generic abstraction for repetition alone.
5. Route event behavior through `EVENT_MODEL.md` and JavaScript identity/value handling through `RUNTIME_BRIDGE.md`.
6. Verify representative mutation/readback or property/attribute behavior and inspect direct callers.

## Stop Conditions

Stop when the implementation would maintain a competing Swift tree, conflate attribute/property semantics, or duplicate an existing element/member owner.
