# SwifWeb — Agent Governance

## Repository Identity

SwifWeb is a Swift package for building browser applications and exposing Web-platform APIs to Swift. Its production surface consists of layered DOM, CSS, event, application-composition, worker, and focused Web API wrapper targets. JavaScriptKit is the current browser interoperability dependency.

SwifWeb is a Web framework, not a game runtime or an alternate browser model. Future API coverage is possible, but an API is not a current implementation fact until it exists in `Package.swift` and source.

## Physical Layout

The repository root owns `AGENTS.md`, `.agent/`, `.artifacts/`, `Package.swift`, `Sources/`, and `Tests/`.

- `Sources/<Target>/` contains SwiftPM production targets.
- `Tests/<Target>Tests/` contains focused package tests.
- `.agent/**` is the stable agent control plane.
- `.artifacts/**` is disposable Git-ignored working memory for research, plans, tasks, reports, reviews, corrections, patches, and continuation context. It is never stable architecture authority.

## Authority Hierarchy

When documents conflict, higher authority wins:

1. `.agent/SYSTEM_RULES.md` — global invariants
2. `.agent/WORKFLOW.md`, `.agent/DEVELOPMENT_ORCHESTRATION.md`, `.agent/ARTIFACTS_WORKFLOW.md`, and `.agent/COMMIT_RULES.md` — development, orchestration, artifact, and Git workflow
3. `.agent/ARCH_INDEX.md` and the owning `.agent/architecture/*.md` chunk — architecture authority
4. `.agent/STYLE_GUIDELINES.md` — SwifWeb-owned Swift conventions
5. `.agent/PROJECT_MEMORY.md` and `.agent/SOURCE_MAP.md` — durable current-state and navigation facts
6. `.agent/OPEN_DECISIONS.md` — unresolved choices only
7. `.agent/TASKS.md`, `.agent/TODO.md`, `.agent/TECH_DEBT.md`, and `.agent/TASKS_ARCHIVE.md` — active work, retained ideas, verified debt, and compact history
8. `.agent/CONTEXT_LOADING_RULES.md`, `.agent/PUBLIC_CONTENT_IDEAS.md`, `.agent/SKILL_INDEX.md`, `.agent/REFERENCE_PROJECTS.md`, `.agent/skills/*`, and `.agent/templates/*` — routing, lazy public-content capture, and operational guidance

Architecture owners govern Web semantics, target ownership, and bridge boundaries. Style guidance applies only within those boundaries. Skills and templates are procedures, not permission to override owners.

## Mandatory Workflow

Use **PLAN → IMPLEMENT → AUDIT**.

- Non-trivial work requires a written reviewed plan before mutation.
- Prefer the smallest spec-backed implementation that preserves current target boundaries.
- If implementation disproves a material assumption, stop that path and re-plan.
- Verification must be proportional to risk and include actual diff/Git-scope inspection.

### Mandatory Iterative-Development Routing

For substantial iterative LLM-assisted work, load `.agent/DEVELOPMENT_ORCHESTRATION.md` and `.agent/ARTIFACTS_WORKFLOW.md`.

- Externalize research, implementation planning, plan audit, task contracts, execution evidence, reviews, corrections, and continuation context under `.artifacts/**`.
- Large implementation or correction work is decomposed into numbered surgical task files; the executor receives one short generic `COORDINATOR_PROMPT.md` and runs already-approved tasks autonomously in order.
- If `.artifacts/**` is missing, reconstruct current context from stable docs, Git, actual source, and current maintainer instruction rather than guessing lost transient state.
- Executor reports are evidence, never proof; independently audit actual source, diff, verification evidence, and Git afterward.

Detailed mechanics belong in the two operational owners above, not in this router.

## Mandatory Context Budget

1. Start with this file.
2. Load `.agent/SYSTEM_RULES.md` and `.agent/ARCH_INDEX.md`.
3. Use `ARCH_INDEX.md` to select **1 primary architecture chunk**.
4. Load **at most 2 supporting architecture chunks** when the task genuinely crosses their boundaries.
5. Load `.agent/STYLE_GUIDELINES.md` for every Swift production or test edit.
6. Use `.agent/SKILL_INDEX.md` to load **at most 1 operational skill** by default.
7. Use `.agent/SOURCE_MAP.md` before broad source discovery and inspect the smallest relevant source subset.

`DEVELOPMENT_ORCHESTRATION.md` and `ARTIFACTS_WORKFLOW.md` are operational workflow owners and do not consume architecture-chunk slots. Cross-cutting architecture or documentation audits may deliberately exceed the normal architecture budget. Full rules live in `.agent/CONTEXT_LOADING_RULES.md`.

`PUBLIC_CONTENT_IDEAS.md` and its thematic shards are durable but lazy communication context. They are not part of ordinary development loading and do not consume architecture-chunk slots.

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
- After meaningful work, perform the cheap public-content capture check owned by `.agent/PUBLIC_CONTENT_IDEAS.md` from information already in context. If the result is negative, do not open the bank. If positive, open only the router plus the relevant thematic shard and append the smallest useful candidate material.
- Stable SwifWeb docs must be self-contained and must not require a sibling checkout or machine-local absolute path.

## Git Safety

Follow `.agent/COMMIT_RULES.md`. Preserve unrelated user work. Never stage, unstage, commit, amend, reset, clean, stash, restore, push, or rewrite history unless the user's request explicitly authorizes that exact operation and scope.

## Task and Decision State

- `TASKS.md` contains active, approved, executable work only.
- `OPEN_DECISIONS.md` contains genuinely unresolved architecture choices, never settled rules.
- `TODO.md` contains retained low-priority future ideas, not implementation permission.
- `TECH_DEBT.md` contains verified current debt with evidence and a resolution path.
- `TASKS_ARCHIVE.md` contains only compact completed outcomes useful to future agents.

## External Dependencies and Evidence

Route dependency inspection and comparison with external repositories through `.agent/REFERENCE_PROJECTS.md`. Stable documentation may name real SwifWeb dependencies and Web standards, but must not persist machine-local checkout paths or instructions that require an evidence repository to remain available.
