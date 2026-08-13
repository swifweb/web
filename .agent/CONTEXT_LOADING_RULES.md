# Context Loading Rules

Mandatory progressive-loading discipline for SwifWeb agents.

## Default Budget

Normal work loads:

- root `AGENTS.md`, `SYSTEM_RULES.md`, and `ARCH_INDEX.md`;
- **1 primary architecture chunk**;
- **at most 2 supporting architecture chunks** only when needed;
- `STYLE_GUIDELINES.md` for any Swift production or test edit;
- **at most 1 operational skill** by default;
- the smallest relevant source and test subset;
- no external repository by default.

`DEVELOPMENT_ORCHESTRATION.md` and `ARTIFACTS_WORKFLOW.md` are operational workflow owners. Load them for substantial iterative LLM-assisted work; they do **not** consume architecture-chunk slots.

`PUBLIC_CONTENT_IDEAS.md` and `.agent/public-content-ideas/**` are lazy communication context, not normal development context. They do not consume architecture-chunk slots, but they are still zero-by-default and must not be loaded "just in case".

Do not bulk-load `.agent/architecture/**`, `.agent/skills/**`, all API targets, all numbered task files, or external repositories for ordinary work.

## Loading Sequence

1. Read root `AGENTS.md`.
2. Read `SYSTEM_RULES.md` and `ARCH_INDEX.md`.
3. If the work is substantial iterative LLM-assisted development, load `DEVELOPMENT_ORCHESTRATION.md` and `ARTIFACTS_WORKFLOW.md`. These are operational docs outside the architecture budget.
4. Classify the technical task using the routing table in `ARCH_INDEX.md`.
5. Load the primary architecture owner and up to two genuinely relevant supporting owners.
6. For Swift edits, load `STYLE_GUIDELINES.md`.
7. Use `SKILL_INDEX.md` only when a concrete procedure applies.
8. Use `SOURCE_MAP.md` before broad source discovery; inspect exact target, direct dependencies/callers, and focused tests.
9. Route Web-standard or dependency research through `REFERENCE_PROJECTS.md`; prefer current primary standards and dependency configuration.
10. Load only the planning/task/report artifacts needed for the current orchestration step. An executor reads the next numbered task immediately before executing it rather than bulk-loading the whole task set.
11. Treat `PUBLIC_CONTENT_IDEAS.md` and `.agent/public-content-ideas/**` as lazy communication context. First perform the public-content capture check from current work. Only if positive, or if the task explicitly concerns README/public docs/website docs/migration guides/release notes/articles/posts/idea curation, load the router and exactly the relevant shard(s). Never browse unrelated shards.

Stop loading once scope, ownership, and evidence needs are clear. Do not re-read already loaded material without a concrete reason.

## Task Classification

- A new Web API or public wrapper shape routes first to `API_DESIGN_RULES.md`.
- Target ownership/dependency work routes first to `MODULES.md`.
- JavaScript value, closure, promise, or wasm behavior routes first to `RUNTIME_BRIDGE.md`.
- DOM/event/CSS work routes to its corresponding focused owner.
- High-level app composition/routing behavior routes to `ARCHITECTURE.md`.
- Documentation-only control-plane work routes through `ARCH_INDEX.md` plus `skills/documentation_sync_skill.md`; load affected owners only.
- Substantial iterative implementation/correction orchestration additionally routes through `DEVELOPMENT_ORCHESTRATION.md` and `ARTIFACTS_WORKFLOW.md` without consuming architecture slots.
- Public-content capture is zero-by-default: do the capture check before loading `PUBLIC_CONTENT_IDEAS.md`; positive capture or explicit public-content work loads only the router plus relevant shard(s), outside architecture slots.

## Escalation

Broader context is allowed for genuinely cross-cutting architecture or documentation migrations. State why the normal architecture budget is insufficient, inspect deliberately, and leave the final owner/routing system focused for future ordinary tasks.

The budget is a discipline, not permission to ignore a clearly relevant owner or caller.
