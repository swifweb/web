# Project Memory

## Current Architectural Decisions

- SwifWeb is spec-driven and wrapper-first.
- Swift ergonomics are layered on top of canonical Web semantics.
- `WebFoundation` is bridge-critical infrastructure.

## Constraints

- Large module surface with many Web APIs.
- Must scale without duplicated models or drift from specs.
- Must preserve clear module ownership and dependency limits.

## Known Limitations

- Legacy wrappers may have uneven style and depth.
- Some APIs may need incremental alignment to strict checklist rules.

## Persistent Rules

- New APIs require spec reference and checklist pass.
- Cross-API coupling is disallowed unless explicitly documented and justified.
