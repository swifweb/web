# Web API Wrapper Skill

## Use When

- Adding any new browser API wrapper module or type.

## Required Docs

- `.agent/architecture/API_DESIGN_RULES.md`
- `.agent/architecture/SPEC_ALIGNMENT.md`
- `.agent/architecture/MODULES.md`
- `.agent/architecture/API_CHECKLIST.md`

## Constraints

- Must follow `SPEC_ALIGNMENT.md`.
- Must follow `API_DESIGN_RULES.md`.
- Must not bypass `FOUNDATION_RULES.md`.

## Steps

1. Confirm spec reference.
2. Confirm ownership module and dependencies.
3. Implement thin canonical wrapper first.
4. Add ergonomic sugar only if additive.
5. Run full checklist before completion.

## Pitfalls

- Inventing project-local abstractions.
- Cross-API coupling without ownership justification.
