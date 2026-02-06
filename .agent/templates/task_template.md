# Task Template

Use for a structured active task when a compact sentence in `TASKS.md` is insufficient.

```markdown
## [TASK-ID] — [Title]

- **Goal:** [Concrete behavior or repository outcome]
- **Approved scope:** [Exact paths/area]
- **Primary owner/IDs:** [Architecture owner and IDs]
- **Supporting context:** [At most two supporting owners by default]
- **Plan:** [Planning artifact or reviewed outline]
- **Completion evidence:** [Specific build/test/runtime/audit result]
```

Rules:

- `TASKS.md` contains active approved executable work only.
- Do not put ideas or architecture debates here; use `TODO.md` or `OPEN_DECISIONS.md`.
- On completion, remove the active entry. Add a compact `TASKS_ARCHIVE.md` entry only if the outcome is useful to future agents.
