# CSS Composition Skill

## Use When

- Adding CSS value/property wrappers.
- Extending typed style DSL behavior.

## Required Docs

- `.agent/architecture/CSS_MODEL.md`
- `.agent/STYLE_GUIDELINES.md`
- `.agent/architecture/SPEC_ALIGNMENT.md`

## Constraints

- Must follow `SPEC_ALIGNMENT.md`.
- Must follow `API_DESIGN_RULES.md`.
- Must not bypass `FOUNDATION_RULES.md`.

## Steps

1. Confirm spec-backed property/value.
2. Reuse existing protocol/value types.
3. Keep rendering output spec-accurate.
4. Keep ergonomic constructors additive.

## Pitfalls

- Creating API-specific CSS forks.
- Introducing non-standard value semantics.
