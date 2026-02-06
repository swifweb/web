# SwifWeb — Agent Governance

## Repository Identity

SwifWeb is a Swift package for building browser applications and exposing Web-platform APIs to Swift. Its production surface consists of layered DOM, CSS, event, application-composition, worker, and focused Web API wrapper targets. JavaScriptKit is the current browser interoperability dependency.

SwifWeb is a Web framework, not a game runtime or an alternate browser model. Future API coverage is possible, but an API is not a current implementation fact until it exists in `Package.swift` and source.

## Physical Layout

The repository root owns `AGENTS.md`, `.agent/`, `.artifacts/`, `Package.swift`, `Sources/`, and `Tests/`.

- `Sources/<Target>/` contains SwiftPM production targets.
- `Tests/<Target>Tests/` contains focused package tests.
- `.agent/**` is the stable agent control plane.
- `.artifacts/**` is transient planning, patch, and review evidence; it is never stable architecture authority.

## Authority Hierarchy

When documents conflict, higher authority wins:

1. `.agent/SYSTEM_RULES.md` — global invariants
2. `.agent/WORKFLOW.md` and `.agent/COMMIT_RULES.md` — development and Git workflow
3. `.agent/ARCH_INDEX.md` and the owning `.agent/architecture/*.md` chunk — architecture authority
4. `.agent/STYLE_GUIDELINES.md` — SwifWeb-owned Swift conventions
5. `.agent/PROJECT_MEMORY.md` and `.agent/SOURCE_MAP.md` — durable current-state and navigation facts
6. `.agent/OPEN_DECISIONS.md` — unresolved choices only
7. `.agent/TASKS.md`, `.agent/TODO.md`, `.agent/TECH_DEBT.md`, and `.agent/TASKS_ARCHIVE.md` — active work, retained ideas, verified debt, and compact history
8. `.agent/CONTEXT_LOADING_RULES.md`, `.agent/SKILL_INDEX.md`, `.agent/REFERENCE_PROJECTS.md`, `.agent/skills/*`, and `.agent/templates/*` — routing and operational guidance

Architecture owners govern Web semantics, target ownership, and bridge boundaries. Style guidance applies only within those boundaries. Skills and templates are procedures, not permission to override owners.

## Mandatory Workflow

Use **PLAN → IMPLEMENT → AUDIT**.

- Non-trivial work requires a written plan before mutation.
- Prefer the smallest spec-backed implementation that preserves current target boundaries.
- If implementation disproves a material assumption, stop that path and re-plan.
- Verification must be proportional to risk and include actual diff/Git-scope inspection.
- Every iteration produces the applicable transient evidence under `.artifacts/planning/`, `.artifacts/patches/`, and `.artifacts/reviews/`; a trivial iteration may use compact entries.

## Mandatory Context Budget

1. Start with this file.
2. Load `.agent/SYSTEM_RULES.md` and `.agent/ARCH_INDEX.md`.
3. Use `ARCH_INDEX.md` to select **1 primary architecture chunk**.
4. Load **at most 2 supporting architecture chunks** when the task genuinely crosses their boundaries.
5. Load `.agent/STYLE_GUIDELINES.md` for every Swift production or test edit.
6. Use `.agent/SKILL_INDEX.md` to load **at most 1 operational skill** by default.
7. Use `.agent/SOURCE_MAP.md` before broad source discovery and inspect the smallest relevant source subset.

Cross-cutting architecture or documentation audits may deliberately exceed the normal budget. Full rules live in `.agent/CONTEXT_LOADING_RULES.md`.

## Web-Semantics Guardrails

- Do not introduce ECS, simulation loops, gameplay abstractions, or game-runtime terminology.
- Do not redesign browser behavior or replace canonical Web semantics with project-local semantics.
- Do not invent public API abstractions without a real Web specification or an explicitly project-owned application-layer need.
- Swift ergonomics are additive; they must not erase the canonical behavior they wrap.
- Preserve JavaScript value, promise, callback, and event lifetime semantics at the bridge boundary.

Detailed enforceable rules are owned by the architecture IDs routed in `.agent/ARCH_INDEX.md`.

## Documentation Self-Maintenance

- Each architecture ID has exactly one owner. Link to the owner instead of duplicating the full rule.
- When ownership, routing, durable facts, source locations, task state, decisions, or verified debt change, update only the affected stable docs in the same task.
- Keep plans, command output, debugging diaries, external-reference provenance, and patch evidence in `.artifacts/**`.
- Stable SwifWeb docs must be self-contained and must not require a sibling checkout or machine-local absolute path.

## Git Safety

Follow `.agent/COMMIT_RULES.md`. Preserve unrelated user work. Never stage, commit, amend, reset, clean, stash, restore, or push unless the user's request explicitly authorizes that exact operation and scope.

## Task and Decision State

- `TASKS.md` contains active, approved, executable work only.
- `OPEN_DECISIONS.md` contains genuinely unresolved architecture choices, never settled rules.
- `TODO.md` contains retained low-priority future ideas, not implementation permission.
- `TECH_DEBT.md` contains verified current debt with evidence and a resolution path.
- `TASKS_ARCHIVE.md` contains only compact completed outcomes useful to future agents.

## External Dependencies and Evidence

Route dependency inspection and comparison with external repositories through `.agent/REFERENCE_PROJECTS.md`. Stable documentation may name real SwifWeb dependencies and Web standards, but must not persist machine-local checkout paths or instructions that require an evidence repository to remain available.
