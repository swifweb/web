# Context Rules

## Core Rule

Do not infer architecture. Read source and docs explicitly before changing behavior.

## Loading Order

1. `AGENTS.md`
2. `.agent/ARCH_INDEX.md`
3. Task-routed architecture docs
4. Relevant source files
5. Skills (only when repeated pattern exists)
6. Templates (only when creating scaffolding)

## When To Load Architecture Docs

- Always for API additions, bridge changes, event behavior changes, or module dependency changes.

## When To Load Skills

- Load a skill when implementing recurring wrapper patterns (DOM, events, CSS, JS bridge, API wrappers).

## When To Load Templates

- Load templates only for new file scaffolding.
- Do not use templates to justify architecture deviations.

## Anti-Hallucination Rules

- Every behavioral claim must trace to code or a doc in this system.
- If ownership is unclear, resolve via `MODULES.md` and `API_CHECKLIST.md` before coding.
