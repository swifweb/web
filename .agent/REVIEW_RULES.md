# Review Rules

Mandatory checklist for every patch review:

- [ ] Complies with `SYSTEM_RULES.md` invariants and rule priority.
- [ ] API matches Web spec.
- [ ] Naming matches spec.
- [ ] Module placement is correct.
- [ ] Foundation bridge usage is correct.
- [ ] No forbidden patterns.

## Pass/Fail Gate

- All checklist items must pass before merge or acceptance.
- Review is incomplete if this checklist is skipped.
- Review must validate that no `SYSTEM_RULES.md` invariant is violated.
- If conflict exists, patch is invalid regardless of checklist completion.
