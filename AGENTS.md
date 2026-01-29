# SwifWeb Agent System

Purpose: keep SwifWeb API growth spec-aligned, layer-aware, and consistent across 100+ Web API wrappers.

## Mandatory Loading Order

1. `AGENTS.md`
2. `.agent/ARCH_INDEX.md`
3. Only task-routed docs from `ARCH_INDEX.md`

## Strict Operating Rule

Follow routing from `.agent/ARCH_INDEX.md` exactly. Do not skip required docs for a task type.

## Hard Constraints

- SwifWeb is a Web framework, not a game runtime.
- Do not introduce ECS, simulation loops, or gameplay abstractions.
- Do not redesign browser semantics.
- Do not invent API abstractions that diverge from Web specs.

## Artifact Rule

Every iteration must produce artifacts:

- planning: `.artifacts/planning/`
- patches: `.artifacts/patches/`
- reviews: `.artifacts/reviews/`

Trivial edits still require minimal entries.
