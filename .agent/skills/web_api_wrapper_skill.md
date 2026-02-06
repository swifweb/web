# Web API Wrapper Skill

Use for a new or materially changed browser API wrapper.

## Required Context

- Primary: `architecture/API_DESIGN_RULES.md`
- Supporting: `architecture/SPEC_ALIGNMENT.md` and `architecture/MODULES.md`
- Gate: `architecture/API_CHECKLIST.md`
- Add `RUNTIME_BRIDGE.md` only when value/closure/promise behavior is material; this is an explicit context-budget substitution or escalation.

## Procedure

1. Record the exact primary specification section and enumerate only the requested surface, including defaults, errors, events, identity, and availability.
2. Search `Package.swift`, `SOURCE_MAP.md`, and the smallest relevant source subset for an existing owner/type/pattern.
3. Choose the owning target and justify every dependency. Distinguish a shared standard type from a merely similar one.
4. Design the canonical wrapper first: types/options, omission/defaults, mutability, errors, async behavior, and JavaScript lifetime.
5. Add Swift ergonomics only when they delegate to and preserve the canonical mapping.
6. Implement the narrow slice; inspect direct callers and compatibility impact.
7. Run every applicable `API_CHECKLIST.md` item with concrete evidence, then use `patch_review_skill.md` if formal review is part of the task.

## Stop Conditions

Stop and re-plan when the specification contradicts the proposed surface, ownership is duplicated/unclear, a new dependency would create unjustified coupling, or the closure/promise lifetime cannot be made explicit.
