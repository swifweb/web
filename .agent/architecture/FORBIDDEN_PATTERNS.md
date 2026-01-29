# Forbidden Patterns

The following patterns are prohibited:

- Direct `JSValue` manipulation outside `WebFoundation` pathways.
- API naming that diverges from Web spec semantics.
- Cross-module API dependencies without explicit justification.
- Reimplementation of existing Web API concepts.
- Memory leaks via `JSClosure` misuse or lifecycle leaks.

## Enforcement

Any forbidden pattern blocks acceptance of a patch.
