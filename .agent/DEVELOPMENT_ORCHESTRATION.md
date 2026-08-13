# Development Orchestration

Model-independent authority for coordinating non-trivial SwifWeb repository work with LLMs or other delegated implementation executors.

This file owns **roles, delegation, review, and gates**. Detailed `.artifacts/**` structure and task/report mechanics are owned by `ARTIFACTS_WORKFLOW.md`.

## Roles

### Coordinator / Reviewer

For non-trivial work, the reasoning/review layer:

- restores current context from real Git, source, stable governance, and current maintainer instruction;
- performs or directs focused research before design decisions;
- designs and independently audits the implementation plan;
- decomposes substantial work into numbered surgical task files;
- gives the implementation executor only a short coordinator prompt;
- independently inspects actual source, diff, verification evidence, and Git state after execution;
- turns audit findings into focused correction task files rather than one large correction prompt;
- synchronizes only durable facts/rules back into stable `.agent/**` owners after accepted work;
- performs the lazy public-content capture check after meaningful work and records only genuinely valuable README/docs/website/release/publication material in the relevant `PUBLIC_CONTENT_IDEAS.md` shard while the context is fresh;
- keeps staging, commit, push, and history mutation as explicit Git gates governed by `COMMIT_RULES.md`.

Executor reports are evidence, never proof.

### Implementation Executor

The executor implements an already-reviewed task contract:

- read the next numbered task immediately before work;
- inspect the current facts required by that task rather than relying on memory;
- modify only its explicit scope/allowlist;
- follow closed implementation mechanics without redesigning architecture;
- run the required validation and inspect the actual diff;
- append execution evidence after the task;
- continue automatically to the next already-approved task after PASS;
- stop the whole run on a genuine out-of-scope blocker or material plan contradiction.

The executor does not broaden scope merely to keep moving.

## Default Flow

```text
verify current repository state
→ focused research
→ implementation-ready plan
→ independent plan audit
→ numbered surgical task files
→ short generic coordinator prompt
→ autonomous sequential execution + append-only evidence
→ independent source/diff/Git audit
→ numbered correction wave if needed
→ independent re-audit
→ durable-doc synchronization
→ explicit staging/commit gate when requested
→ explicit push gate when requested
```

For substantial iterative work, `ARTIFACTS_WORKFLOW.md` is mandatory and externalizes this flow under `.artifacts/**`.

## Delegation Rule

Never send an implementation executor one huge prompt containing several independent behaviors, a full multi-phase migration, or an entire correction audit.

Instead:

1. group work into tightly coupled, independently verifiable behaviors;
2. put detailed mechanics, allowlists, validation, and stop conditions into numbered task files;
3. give the executor one compact `COORDINATOR_PROMPT.md` that lists those files and the autonomous task loop.

If the coordinator prompt starts duplicating all task details, fix the decomposition before execution.

## Planning Gate

Non-trivial production work requires reviewed planning when it crosses multiple files/owners or changes any material combination of:

- Web-platform semantics or public wrapper shape;
- SwiftPM target ownership/dependencies/exports;
- JavaScript value/object/closure/promise/callback lifetime or error behavior;
- event listener identity/options/lifetime;
- DOM/CSS state, serialization, or browser-observable behavior;
- wasm/native runtime truth;
- concurrency or shared mutable state;
- compatibility/migration behavior.

The plan must be grounded in current source, Git, manifest/dependency facts, and current primary Web standards where external semantics are material. It must close:

- scope and non-goals;
- owning architecture IDs/boundaries;
- allowed and forbidden mutation paths;
- behavior/lifetime/identity mechanics;
- compatibility and dependency implications;
- focused validation and browser/runtime evidence when applicable;
- stop conditions.

Known plan defects are corrected before implementation.

## Independent Plan Audit

Before implementation, independently verify the plan against actual repository facts:

- claimed paths/types/targets exist and have the stated ownership;
- planned behavior matches the relevant Web specification and current wrapper model;
- task order and path allowlists are coherent;
- JavaScript bridge/event lifetime assumptions are explicit where relevant;
- validation can prove the requested behavior rather than only compilation;
- durable documentation updates are targeted rather than ceremonial;
- Git/user work remains protected.

Do not treat a plan as implementation-ready merely because the planning step produced it.

## Independent Implementation Audit

After executor work, independently inspect:

- complete Git status and changed path set;
- actual changed/created source and direct callers;
- relevant architecture ownership and target boundaries;
- exact Web semantics, names, defaults, errors, identity, and availability where browser-facing behavior changed;
- JavaScript value/closure/promise/event lifetime and receiver correctness where applicable;
- wasm/native behavior where applicable;
- manifest/dependency/project changes;
- forbidden/deferred scope;
- actual validation evidence.

If defects remain, create a new focused numbered correction wave instead of one large correction prompt.

## Prompt Rules

Agent prompts are written in English unless the maintainer explicitly changes that requirement for a task.

Every delegated prompt should identify:

- repository/context;
- role;
- exact task files or narrow scope;
- mutation permissions;
- Git prohibitions;
- stop conditions;
- expected evidence/report shape.

Do not make prompts self-contained by duplicating large task files. For artifact-driven execution, self-containment means the prompt explicitly points to the local task artifacts the executor must read.

Do not encode a model/vendor name into the stable orchestration contract. A particular executor or coordinator product may be chosen per session without changing this owner.

## Context Discipline

Do not bulk-load all task files into coordinator or executor context.

- Coordinator/reviewer loads only the artifacts, owners, source, and evidence needed for the current planning/audit step.
- Executor reads the next numbered task immediately before executing it.
- `PUBLIC_CONTENT_IDEAS.md` and `.agent/public-content-ideas/**` are not normal development context. Perform the capture check from current context first; open the router plus one relevant shard only when the check is positive or the task is explicitly public-content work.
- `DEVELOPMENT_ORCHESTRATION.md` and `ARTIFACTS_WORKFLOW.md` are operational workflow owners and do not consume the normal architecture-chunk slots defined by `CONTEXT_LOADING_RULES.md`.

## Git Gates

Implementation remains unstaged unless staging is explicitly authorized for the exact paths/scope under `COMMIT_RULES.md`.

Normal implementation tasks forbid staging/unstaging, commit/amend, merge/rebase/reset/restore/clean/stash, branch mutation, push, force-push, unrelated fixes, and history rewriting unless that exact operation is separately authorized.

Commit authorization does not itself authorize staging or push. Follow `COMMIT_RULES.md` for repository-specific Git semantics and commit-message style.

## Disposable Working Memory

`.artifacts/**` may be deleted, absent in a clean clone, or unavailable on another machine. Stable workflow and architecture must remain recoverable from `AGENTS.md`, `.agent/**`, Git, actual source, and current maintainer instruction.

Use `ARTIFACTS_WORKFLOW.md` for artifact structure, `NEW_CHAT.md` reconstruction, task/report conventions, correction waves, and promotion of durable facts back into stable docs.
