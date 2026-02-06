# Documentation Sync Skill

Use when a task changes durable repository knowledge.

## Principle

Documentation is self-maintaining, but updates are ownership-driven rather than ceremonial. Change only documents whose owned rules, routing, facts, decisions, debt, ideas, task state, or navigation actually changed.

## Checklist

- Architecture boundary changed → update its single owner; update `ARCH_INDEX.md` only when IDs, ownership, or routing changed.
- New independent owner → use `templates/architecture_chunk_template.md`; verify every new ID has exactly one owner.
- Source locations/roles materially changed → update `SOURCE_MAP.md`.
- Durable non-obvious current fact changed → update `PROJECT_MEMORY.md`.
- Genuine unresolved choice appeared/resolved → update `OPEN_DECISIONS.md`; resolved rules move to one owner.
- Maintainer-approved future idea is worth retaining → update `TODO.md`.
- Verified current debt appeared/resolved → update `TECH_DEBT.md` with source evidence and resolution path.
- Active executable task state changed → update `TASKS.md`; use `templates/task_template.md` for structured entries.
- Completed outcome is worth future awareness → add only a compact `TASKS_ARCHIVE.md` entry.
- Operational routing changed → update `SKILL_INDEX.md`.
- Top-level authority/context/workflow changed → update root `AGENTS.md` and the exact governance owner.

Before finishing, verify Markdown links, removed-document references, unique ID ownership, current-vs-planned truth, and absence of machine-local evidence paths in stable docs.
