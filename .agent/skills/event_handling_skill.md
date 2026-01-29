# Event Handling Skill

## Use When

- Adding listener APIs or event wrappers.
- Changing event attach/detach logic.

## Required Docs

- `.agent/architecture/EVENT_MODEL.md`
- `.agent/architecture/RUNTIME_BRIDGE.md`
- `.agent/architecture/FOUNDATION_RULES.md`

## Constraints

- Must follow `SPEC_ALIGNMENT.md`.
- Must follow `API_DESIGN_RULES.md`.
- Must not bypass `FOUNDATION_RULES.md`.

## Steps

1. Preserve EventTarget semantics.
2. Support options behavior (`capture`, `once`, `passive`) correctly.
3. Ensure listener removal path matches registration identity.
4. Ensure closure lifecycle has explicit release strategy.

## Pitfalls

- Leaking `JSClosure` instances.
- Mixing `Events` and `DOMEvents` ownership.
