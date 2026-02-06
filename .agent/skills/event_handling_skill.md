# Event Handling Skill

Use for event wrappers or listener registration, removal, options, propagation, and retained callback changes.

## Required Context

- Primary: `architecture/EVENT_MODEL.md`
- Supporting: `architecture/RUNTIME_BRIDGE.md`; add `DOM_MODEL.md` only for DOM ownership/integration

## Procedure

1. Confirm the event's standards definition and correct owner (`Events`, `DOMEvents`, or focused API target).
2. Trace the exact underlying target and effective registration tuple: event type, callback identity, capture/options, and receiver.
3. Prove removal uses the required same identity/options and that repeated/one-shot registration behaves correctly.
4. Map `capture`, `once`, `passive`, signal, cancellation, and propagation without Swift-side semantic substitution.
5. Define retained closure ownership, capture behavior, cleanup/invalidation, and owner teardown.
6. Verify with the narrowest useful registration/invocation/removal scenario plus diff review.

## Stop Conditions

Stop when a reversible API cannot actually detach, closure lifetime is unbounded, or the proposed type duplicates an existing event concept.
