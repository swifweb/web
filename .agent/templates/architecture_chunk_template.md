# Architecture Chunk Template

Use only when a genuinely independent architecture owner is needed. Omit empty sections.

```markdown
# [Chunk Name]

Authoritative owner for [one focused SwifWeb concept].

## Scope

[What this chunk owns; route adjacent concerns to their owners.]

## Verified Current Facts

[Only non-obvious facts verified from current source/manifest.]

## Stable Boundary Rules

### [PREFIX-001] — [Short rule title]

[Clear, enforceable rule.]

## Open Decisions

[Only unresolved choices belonging to this concept, normally by decision ID.]

## Related Owners

[Only direct neighbors needed for focused routing.]
```

Rules:

- Every architecture ID has exactly one owner.
- Move IDs when splitting; never duplicate full rules.
- Update `ARCH_INDEX.md` routing and ownership in the same change.
- Do not create a chunk for a future concept before it has substantial independent rules.
- Keep task logs, migration diaries, speculative API catalogs, and command evidence out of owner chunks.
