# Foundation Rules

## Single Bridge Ownership

`WebFoundation` is the only bridge authority for JS interop primitives.

## Hard Constraints

- No direct JS bridge bypass outside foundation-owned pathways.
- Wrapper modules must use foundation bridge types/utilities.
- Bridge policy updates must be centralized and documented.

## Wrapper Discipline

- API wrappers remain thin and spec-aligned.
- Wrapper code may call bridge primitives but must not redefine bridge semantics.
- Shared bridge behaviors belong in `WebFoundation`, not feature modules.
