# CSS Model

Authoritative owner for typed CSS values, properties, functions, rules, stylesheet behavior, and serialization.

## Verified Current Facts

- `Sources/CSS/` contains typed values/units/functions/properties, rules/selectors, stylesheet behavior, and generated/large property surfaces.
- The `CSS` target depends on both `WebFoundation` and `DOM`.

## Stable Boundary Rules

### CSS-001 — CSS ownership

Reusable CSS syntax/value/property/rule concepts belong in `CSS`. A browser API target must not fork a private CSS model when the standard concept is shared.

### CSS-002 — Serialization fidelity

Rendered CSS text preserves standard identifiers, token order, separators, escaping, units, whitespace significance, function grammar, and rule structure. Swift names do not authorize different emitted syntax.

### CSS-003 — Typed composition

Protocols/generics/builders express real CSS grammar or reusable value categories. Do not introduce overly broad composition that permits invalid combinations solely for fluent syntax.

### CSS-004 — Defaults, global values, and omission

Preserve the difference between omitting a declaration, setting an empty/invalid string, using CSS-wide keywords, and emitting a concrete default. Do not invent Swift defaults that alter cascade or computed behavior.

### CSS-005 — DOM integration

Applying or removing styles uses the correct DOM/CSSOM object and property identity. Typed values are representations of browser CSS state, not a competing style engine or cascade model.

### CSS-006 — Extension discipline

Before adding a property/value/function/rule, verify its current specification/status and search existing protocols/types. Reuse only semantically compatible value categories, keep experimental compatibility explicit, and add generated surface through the established mechanism when one exists.

## Review Hazards

Check exact emitted text, unitless-zero rules, escaping, optional/empty handling, property custom-name behavior, value-category overreach, browser support claims, and wasm/native application behavior.

## Related Owners

- `SPEC_ALIGNMENT.md` — standards/compatibility evidence
- `DOM_MODEL.md` — CSSOM/DOM application boundary
- `RUNTIME_BRIDGE.md` — underlying JavaScript object behavior
