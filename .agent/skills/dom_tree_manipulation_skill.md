# DOM Tree Manipulation Skill

## Use When

- Adding or modifying DOM element wrappers.
- Updating parent/child mutation behavior.

## Required Docs

- `.agent/architecture/DOM_MODEL.md`
- `.agent/architecture/EVENT_MODEL.md`
- `.agent/architecture/SPEC_ALIGNMENT.md`

## Constraints

- Must follow `SPEC_ALIGNMENT.md`.
- Must follow `API_DESIGN_RULES.md`.
- Must not bypass `FOUNDATION_RULES.md`.

## Steps

1. Confirm target element exists in Web platform.
2. Reuse existing base element hierarchy.
3. Preserve mutation lifecycle consistency.
4. Validate event hooks against `EVENT_MODEL.md`.

## Pitfalls

- Duplicating existing element models.
- Adding non-standard lifecycle shortcuts.
