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

Do not bulk-load `.agent/architecture/**`, `.agent/skills/**`, all API targets, or external repositories for ordinary work.

## Loading Sequence

1. Read root `AGENTS.md`.
2. Read `SYSTEM_RULES.md` and `ARCH_INDEX.md`.
3. Classify the task using the routing table in `ARCH_INDEX.md`.
4. Load the primary owner and up to two genuinely relevant supporting owners.
5. For Swift edits, load `STYLE_GUIDELINES.md`.
6. Use `SKILL_INDEX.md` only when a concrete procedure applies.
7. Use `SOURCE_MAP.md` before broad source discovery; inspect exact target, direct dependencies/callers, and focused tests.
8. Route Web-standard or dependency research through `REFERENCE_PROJECTS.md`; prefer current primary standards and dependency configuration.

Stop loading once scope, ownership, and evidence needs are clear. Do not re-read already loaded material without a concrete reason.

## Task Classification

- A new Web API or public wrapper shape routes first to `API_DESIGN_RULES.md`.
- Target ownership/dependency work routes first to `MODULES.md`.
- JavaScript value, closure, promise, or wasm behavior routes first to `RUNTIME_BRIDGE.md`.
- DOM/event/CSS work routes to its corresponding focused owner.
- High-level app composition/routing behavior routes to `ARCHITECTURE.md`.
- Documentation-only control-plane work routes through `ARCH_INDEX.md` plus `skills/documentation_sync_skill.md`; load affected owners only.

## Escalation

Broader loading is allowed for genuinely cross-cutting architecture or documentation migrations. State why the normal budget is insufficient, inspect deliberately, and leave the final owner/routing system focused for future ordinary tasks.

The budget is a discipline, not permission to ignore a clearly relevant owner or caller.
