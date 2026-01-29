# CSS Model

## Ownership

- `CSS` owns typed style values, units, functions, and rules.

## DSL Rules

- Keep value types explicit and composable.
- Preserve CSS semantics and value constraints.
- Provide ergonomic constructors without changing meaning.

## Integration Rules

- CSS values must stay compatible with DOM style application.
- Avoid API-specific CSS variants outside `CSS` unless required by platform semantics.

## Extension Checklist

- Confirm property/value exists in CSS spec.
- Reuse existing protocols/value types before adding new ones.
- Keep generated string representation spec-accurate.
