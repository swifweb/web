# Artifacts Workflow

Stable operational authority for how SwifWeb uses transient `.artifacts/**` working memory during research, planning, implementation, correction, audit, and chat handoff.

This file defines the **workflow around artifacts**. Artifact contents do not override `AGENTS.md`, `.agent/**`, current Git, or actual source.

## Core Principle

`.artifacts/**` is disposable external working memory.

It exists to keep long iterative work precise without forcing one prompt or one conversation context to carry the entire task.

It may be deleted at any time, absent from a clean clone, unavailable on another machine, or intentionally reconstructed from current repository facts.

Therefore:

- stable rules and durable architecture never depend on `.artifacts/**` existing;
- `.artifacts/**` remains ignored by Git;
- research, plans, task files, reports, reviews, patches, and handoffs in `.artifacts/**` are transient evidence or execution instructions, not permanent product authority;
- after meaningful accepted work, synchronize only durable facts/rules into the correct stable `.agent/**` owner;
- if artifacts disappear, reconstruct only what current Git/source/stable docs still prove;
- never invent lost historical evidence, completed work, or uncommitted state that is no longer present.

## Mandatory Use for Substantial Iterative Work

For substantial development, especially multi-file, cross-cutting, Web API, target/dependency, bridge/lifetime, event/DOM/CSS, wasm/runtime, concurrency, or migration work, externalize context under `.artifacts/**` before implementation.

Preferred lifecycle:

```text
restore current repository context
-> focused research
-> write research evidence
-> write implementation plan
-> independently audit plan
-> decompose implementation into surgical task files when needed
-> run implementation executor task-by-task
-> append execution evidence after every task
-> independently audit actual source/diff/Git
-> create surgical correction task files when needed
-> independently re-audit
-> synchronize durable docs
-> separate Git integration gate
```

Do not collapse a researched multi-behavior implementation into one enormous executor prompt.

Truly trivial typo/format-only work may use much lighter artifact evidence or no formal artifact plan when `WORKFLOW.md` allows it, but scope/result verification still applies.

## Mandatory Large-Task Decomposition Rule

When implementation or correction work contains multiple natural behavior groups, multiple independent mutations, several ownership boundaries, or enough mechanics that a single executor prompt becomes cognitively dense, the coordinator MUST decompose it before execution.

Detailed implementation mechanics belong in numbered `.md` task files under `.artifacts/**`.

The executor receives one short generic `COORDINATOR_PROMPT.md` that tells it only:

- which repository/context to use;
- which numbered task files to execute and in what order;
- to read each task immediately before executing it;
- to obey each task's allowlist, forbidden work, verification, and stop conditions;
- to append `EXECUTION_REPORT.md` after every task;
- to continue automatically to the next task after PASS;
- to stop the entire run on a genuine out-of-scope blocker or material plan contradiction;
- not to perform Git staging/history/push operations unless separately authorized.

The coordinator prompt must NOT duplicate the detailed implementation requirements already stored in task files.

### Practical Split Threshold

Split rather than sending one large implementation/correction prompt whenever any of these is true:

- more than one independently verifiable behavior is changing;
- more than one subsystem/ownership boundary is involved;
- implementation and validation form several distinct phases;
- multiple independent lifetime, identity, concurrency, or compatibility defects are being corrected;
- Web-standard/API design and runtime bridge mechanics both require substantial detail;
- the prompt would need long implementation-mechanics sections;
- failure of a middle step should prevent later work from executing.

Prefer precise tasks over one overloaded prompt, but do not create artificial one-line tasks that destroy locality. A task should represent one tightly coupled behavior group with one meaningful verification gate.

## Recommended Directory Structure

Use a task-specific slug rather than one global plan for substantial work.

```text
.artifacts/
|-- NEW_CHAT.md
|-- planning/
|   `-- <work-slug>/
|       |-- RESEARCH_REPORT.md
|       |-- IMPLEMENTATION_PLAN.md
|       `-- PLAN_AUDIT.md
|-- implementation/
|   `-- <work-slug>/
|       |-- 01-<task>.md
|       |-- 02-<task>.md
|       |-- ...
|       |-- EXECUTION_REPORT.md
|       `-- COORDINATOR_PROMPT.md
|-- corrections/
|   `-- <work-slug-or-wave>/
|       |-- 01-<correction>.md
|       |-- 02-<correction>.md
|       |-- ...
|       |-- EXECUTION_REPORT.md
|       `-- COORDINATOR_PROMPT.md
|-- reviews/
|   `-- <focused-review>.md
`-- patches/
    `-- <temporary-patch-evidence>
```

Use only the directories/files needed by current work. Do not manufacture empty bureaucracy.

## Planning Artifacts

### `RESEARCH_REPORT.md`

Stores verified implementation-time evidence needed to design the work, such as:

- current branch/HEAD/status and relevant recent history;
- current source/API/type/target ownership;
- `Package.swift` dependency/product/target facts;
- current primary Web-standard evidence when behavior or naming is material;
- JavaScriptKit or other dependency behavior when relevant;
- known constraints and unknowns;
- facts later task files must not rediscover from memory.

Separate verified facts from architectural conclusions.

### `IMPLEMENTATION_PLAN.md`

Contains the reviewed implementation design:

- exact goal and scope;
- explicit non-goals/deferred work;
- owning architecture IDs/boundaries;
- exact source topology and intended mutations;
- public/API behavior and compatibility implications;
- JavaScript value/identity/lifetime/error mechanics where applicable;
- event/DOM/CSS/wasm behavior where applicable;
- dependency/target implications;
- sequencing;
- validation strategy;
- stop conditions.

It should be implementation-ready before an executor receives production mutation tasks.

### `PLAN_AUDIT.md`

Records an independent audit of the plan against actual source, Git, stable governance, manifest/dependency facts, and current primary Web semantics when relevant.

Do not treat a plan as ready merely because the planning step wrote it.

## Surgical Implementation Task Contract

Each numbered implementation/correction task file contains only the context needed for one tightly coupled behavior group.

Use this shape when applicable:

```text
# Task NN - Title

## Goal
## Preconditions
## Allowed production paths
## Required implementation
## Web semantics / ownership / lifetime rules
## Explicitly forbidden work
## Verification
## Completion report
## Stop conditions
```

Every task must make scope mechanically clear enough that the executor does not need to invent architecture.

Important:

- exact path allowlists are strongly preferred;
- state which earlier task output may be relied on;
- identify exact architecture owners/IDs when relevant;
- include standards/API constraints already resolved during planning;
- state JavaScript closure/listener/promise/object lifetime requirements when material;
- include the smallest meaningful build/test/browser/rendered-output/manifest gate;
- if a task uncovers a plan contradiction requiring broader scope, stop instead of silently widening scope.

## Autonomous Executor Loop

For a prepared multi-task implementation or correction wave, the executor follows this loop:

```text
read Task NN completely
-> inspect required current Git/source facts
-> implement only Task NN allowlist
-> run Task NN verification
-> inspect actual diff
-> append Task NN result to EXECUTION_REPORT.md
-> if PASS: immediately continue to Task NN+1
-> if BLOCKED: append blocker and stop the entire run
```

The executor does not ask the maintainer for confirmation between already-approved numbered tasks.

This autonomous progression is the default reason to use task files: detailed mechanics stay local to the current step while the coordinator prompt stays small.

## `EXECUTION_REPORT.md`

Execution reports are append-only evidence.

After every task append a distinct section containing:

- actual paths changed;
- implementation facts;
- exact validation commands/results;
- browser/wasm/rendered/runtime evidence when actually observed;
- Git state;
- deviations/blockers.

Never rewrite earlier task sections to make a failed/stopped attempt disappear. A resumed task appends a new clearly named section.

An executor report is never proof by itself. The coordinator/reviewer independently inspects actual source, diff, verification evidence, and Git afterward.

## Independent Post-Execution Audit

After implementation execution, independently verify the actual repository rather than accepting the report summary.

At minimum inspect, as relevant:

- full Git status and changed-path set;
- complete changed/created source and direct callers;
- target/module ownership and manifest impact;
- Web-standard semantics, naming, defaults, errors, identity, ordering, and availability;
- JavaScript object/value/closure/promise/callback/event lifetime and receiver behavior;
- DOM/CSS emitted or observable behavior;
- wasm/native truth;
- focused validation evidence;
- forbidden/deferred scope;
- stable documentation synchronization.

Audit conclusions must be based on current repository evidence, not executor confidence.

## Correction Waves

After independent implementation audit, do not send a giant correction prompt containing every discovered defect.

Instead:

1. group findings into the smallest coherent correction behaviors;
2. create numbered files under `.artifacts/corrections/<work-slug-or-wave>/`;
3. define exact allowlists and validation for each correction;
4. create an append-only correction `EXECUTION_REPORT.md` for that wave;
5. give the executor one short `COORDINATOR_PROMPT.md` pointing to those files;
6. let the executor run approved corrections sequentially and automatically;
7. independently audit the resulting source again.

If re-audit discovers another materially distinct issue, create a new numbered correction wave rather than growing the old coordinator prompt or rewriting completed task files.

## `COORDINATOR_PROMPT.md`

This file is intentionally compact.

It contains orchestration only, not implementation detail already present in numbered tasks.

Minimum responsibilities:

```text
repository/context
baseline Git expectations
list of numbered task files
execute numerically
read one task immediately before work
append report after each task
continue automatically after PASS
stop whole run on blocker
Git mutation prohibitions
compact final report shape
```

If `COORDINATOR_PROMPT.md` starts restating detailed implementation requirements from every task, the decomposition has failed and must be corrected before execution.

The filename is generic and model-independent. Do not create model/vendor-specific coordinator filenames as stable workflow convention.

## `NEW_CHAT.md` Purpose

`.artifacts/NEW_CHAT.md` is transient continuation context for the next coordinator/reviewer conversation, not stable governance.

It should preserve enough verified current work context that a fresh chat can continue without replaying a long prior conversation or accidentally reopening completed decisions.

Keep it updated after continuity-critical transitions, for example:

- branch/HEAD phase changes;
- accepted audit/correction verdicts;
- prerequisite/dependency completion;
- new active planning/implementation/correction artifact sets;
- important stop/blocker state;
- exact next intended action;
- session-specific collaboration/tool facts that matter to continuation but do not belong in stable governance.

Do not turn it into an ever-growing transcript or duplicate the full stable orchestration workflow. Replace stale continuation instructions with a current snapshot while preserving only historical rationale that still constrains future work.

Stable model-independent workflow belongs in `DEVELOPMENT_ORCHESTRATION.md` and this file. A transient `NEW_CHAT.md` may mention a currently used tool/model when it matters to the next session, but that mention is configuration/context, not workflow authority.

## Recreating `.artifacts` on a New Machine or After Deletion

Because `.artifacts/**` is intentionally disposable, every future agent must be able to recover without it.

If `.artifacts/` or `NEW_CHAT.md` is missing:

1. read root `AGENTS.md` and the minimum stable `.agent/**` governance required for the task;
2. inspect current Git branch/HEAD/status directly;
3. inspect `TASKS.md`, `OPEN_DECISIONS.md`, `PROJECT_MEMORY.md`, `SOURCE_MAP.md`, and relevant architecture owners only as needed;
4. inspect actual changed source, `Package.swift`, focused tests, and recent relevant Git history rather than guessing unfinished work;
5. identify the current work phase from repository evidence and current maintainer instruction;
6. create `.artifacts/` directories only as needed;
7. create a fresh `.artifacts/NEW_CHAT.md` from verified current facts;
8. if substantial work is continuing, create a fresh research/plan/task artifact set rather than pretending deleted transient plans still exist;
9. never infer uncommitted/lost implementation evidence that is no longer present on disk.

A reconstructed `NEW_CHAT.md` should normally contain:

```text
repository identity/path used in this environment
current branch / HEAD / Git status
current work phase or milestone
stable governance/architecture owners relevant to continuation
verified completed/accepted work that materially constrains next steps
current uncommitted user/agent changes and preservation rules
active package/dependency/API facts needed by the work
current artifact index, if artifacts were recreated
next intended action
session-specific collaboration/tool facts that matter to continuation
```

Machine-local paths/tool context identifiers are allowed in `NEW_CHAT.md` because it is transient. Stable `.agent/**` documentation must remain portable.

## Promotion to Stable Documentation and Public-Content Capture

At the end of an accepted implementation/correction cycle, decide what learned information is durable.

At the same meaningful checkpoints where continuation context and durable-doc synchronization are considered, also perform the lazy public-content capture check owned by `PUBLIC_CONTENT_IDEAS.md`. This does **not** mean opening the bank every time. First decide from current work whether a genuinely useful README/docs/website/release/publication example, capability, migration note, validation result, engineering story, or explanation appeared. Only on a positive result open the compact router plus one relevant shard and append the smallest useful entry while its context is fresh.

`NEW_CHAT.md` and the public-content bank intentionally have different lifecycles: `NEW_CHAT.md` is transient/disposable execution continuity; `PUBLIC_CONTENT_IDEAS.md` and `.agent/public-content-ideas/**` are durable versioned candidate communication material. Capturing an idea does not promote it to architecture, implementation, validation, release, or public-documentation truth.

Promote only durable facts/rules into the correct stable `.agent/**` owner:

- architecture rule -> owning architecture document;
- development/orchestration rule -> `WORKFLOW.md` / `DEVELOPMENT_ORCHESTRATION.md` / this file / `COMMIT_RULES.md` as appropriate;
- source navigation fact -> `SOURCE_MAP.md`;
- durable non-obvious current fact -> `PROJECT_MEMORY.md`;
- unresolved architecture choice -> `OPEN_DECISIONS.md`;
- active approved executable work -> `TASKS.md`;
- verified debt -> `TECH_DEBT.md`;
- retained future idea -> `TODO.md`.

Do not promote execution diaries, transient commit hashes, machine-local tool IDs, temporary errors, external-repository provenance, or massive implementation reports.

## Git Rule

`.artifacts/` must remain ignored by repository `.gitignore`.

Do not stage or commit artifacts merely because they were useful during development. They are intentionally local/transient unless the maintainer explicitly changes this project policy.
