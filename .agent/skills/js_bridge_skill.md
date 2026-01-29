# JS Bridge Skill

## Use When

- Adding/changing JS interop usage in wrappers.
- Mapping promises, closures, and wasm guards.

## Required Docs

- `.agent/architecture/RUNTIME_BRIDGE.md`
- `.agent/architecture/FOUNDATION_RULES.md`
- `.agent/architecture/SPEC_ALIGNMENT.md`

## Constraints

- Must follow `SPEC_ALIGNMENT.md`.
- Must follow `API_DESIGN_RULES.md`.
- Must not bypass `FOUNDATION_RULES.md`.

## Steps

1. Keep bridge usage through foundation-owned primitives.
2. Define `JSValue` ownership and lifetime.
3. Map promise success/failure explicitly.
4. Guard browser runtime calls for wasm availability.

## Pitfalls

- Unbounded `JSValue` retention.
- Missing closure release paths.
- Reinterpreting JS errors.
