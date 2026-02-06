# CSS Composition Skill

Use for typed CSS values, properties, functions, selectors/rules, stylesheet behavior, or emitted CSS text.

## Required Context

- Primary: `architecture/CSS_MODEL.md`
- Supporting: `architecture/SPEC_ALIGNMENT.md`; add `DOM_MODEL.md` only for CSSOM/application behavior

## Procedure

1. Confirm the current CSS specification/status and exact grammar for the requested concept.
2. Search existing value categories, protocols, units, functions, properties, and generation patterns.
3. Choose reuse only when it admits exactly the intended grammar; do not widen a protocol merely for fluent syntax.
4. Preserve omission/default/global-keyword/cascade distinctions and exact boundary identifiers.
5. Verify emitted text, including token order, separators, escaping, whitespace, units, and representative edge cases.
6. For stylesheet/DOM application, verify the real CSSOM receiver/property and wasm/native behavior.

## Stop Conditions

Stop when the proposed abstraction permits invalid CSS, emitted syntax is not established, or an experimental concept would be documented as broadly standard.
