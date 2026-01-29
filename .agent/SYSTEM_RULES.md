# System Rules

## Non-Negotiable Rules

- No speculation: read before changing.
- Follow architecture docs strictly.
- Enforce invariants explicitly in code and review notes.
- Architecture rules override all other docs.
- Skills must not violate architecture rules.
- Templates must follow API design rules.
- If a lower-priority doc conflicts with a higher-priority doc, the lower-priority doc is invalid.

## Rule Priority

1. `SYSTEM_RULES.md`
2. `architecture/*`
3. `skills/*`
4. `templates/*`

This priority order is mandatory during planning, implementation, and review.

## Invariants

- API wrappers must mirror real Web APIs.
- No duplicate API models across modules.
- No hidden cross-module coupling.
- No direct JS bridge usage outside foundation-owned paths.
- Sugar layers are additive and must not change browser semantics.

## Change Discipline

- Keep patch scope minimal.
- Update docs when architecture contracts change.
- Reject changes that violate `SPEC_ALIGNMENT.md`.
