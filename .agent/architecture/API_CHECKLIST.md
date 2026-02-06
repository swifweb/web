# API Checklist

Operational planning and review gate for new or materially changed browser API wrappers. This checklist derives from the owning IDs and does not override them.

## Standards and Surface

- [ ] Exact primary specification section is recorded; MDN is supplementary where useful (`SPEC-001`).
- [ ] Observable defaults, states, ordering, errors, side effects, identity, and serialization are preserved (`SPEC-002`).
- [ ] Web concept and boundary names remain recognizable and exact where required (`SPEC-003`, `API-002`).
- [ ] Partial support and runtime restrictions are documented honestly (`SPEC-004`, `API-008`).

## Ownership and Dependencies

- [ ] Existing owning target/type was searched before creating a model (`MODULE-002`).
- [ ] `Package.swift` placement and each new dependency have a concrete need (`MODULE-001`, `MODULE-003`).
- [ ] Shared interop vs feature-specific bridge behavior follows `FOUNDATION-003`–`FOUNDATION-005`.
- [ ] No duplicate or merely-similar cross-target type was introduced.

## API and Runtime

- [ ] Canonical wrapper behavior exists before optional ergonomics (`API-002`, `API-007`).
- [ ] Types/options preserve raw values, omission/defaults, optionality, mutability, and unknown cases (`API-003`, `API-004`, `API-006`).
- [ ] `undefined`, `null`, conversion failure, object identity, and method receiver are handled intentionally (`BRIDGE-001`, `BRIDGE-002`).
- [ ] Promise/callback completion and error mapping are explicit (`BRIDGE-004`–`BRIDGE-006`).
- [ ] Every retained closure/listener has a clear owner and release path (`BRIDGE-003`).
- [ ] Wasm and native behavior are honest and verified (`BRIDGE-007`).

## Verification and Delivery

- [ ] Direct callers, compatibility impact, and focused tests/runtime checks were inspected.
- [ ] Relevant public docs contain a standard reference and constraints.
- [ ] Actual diff, stable-doc synchronization, and final Git scope pass the patch review skill.
