# Style Guidelines

Common conventions for SwifWeb-owned Swift production and test code.

## Scope and Authority

- Load this document for every Swift edit.
- Architecture owners govern Web semantics, target ownership, and bridge behavior; style applies within those boundaries.
- Preserve established local formatting in a narrowly edited file unless the task explicitly includes formatting cleanup.
- Generated, vendor, and unreviewed code are implementation to audit, not automatic style authority.

## Naming

- Use UpperCamelCase for types/protocols and lowerCamelCase for properties, methods, parameters, locals, and enum cases.
- Preserve canonical Web terms and acronyms where changing them would obscure the platform concept.
- Use Swift casing and labels without translating a Web concept into project-specific vocabulary.
- Preserve exact external string names at JavaScript, HTML, CSS, header, and serialization boundaries.
- Prefer the shortest semantic name that remains unambiguous; avoid vague buckets such as `Manager`, `Helper`, `Data`, or `Utils` when a concrete role exists.

## Ownership and Decomposition

- Give mutable state and behavior one natural owner.
- Keep a thin wrapper near the Web concept it represents; do not create generic abstraction layers solely for symmetry.
- Reuse an existing shared type when it has the same semantics; do not force reuse between merely similar browser concepts.
- Split files/extensions when that materially improves navigation, not to satisfy a mechanical file-size rule.
- Use the least access level required by actual consumers.

## Public API Shape

- Keep the canonical browser-facing operation recognizable.
- Add overloads, builders, typed values, or async conveniences only when the canonical behavior remains available and unchanged.
- Prefer explicit option/configuration types when they preserve standard fields and defaults.
- Do not silently coerce invalid states into a different browser meaning.

## Control Flow, Errors, and Lifetimes

- Prefer direct, scan-friendly control flow and early exits for failed preconditions/conversions.
- Preserve JavaScript rejection, exception, optional/undefined/null, callback, and event semantics intentionally.
- Make retained `JSClosure`, listener token, or wrapper lifetime visible in its owner; cleanup must be traceable.
- Avoid force unwraps at fallible Web boundaries unless an invariant is established immediately and failure is truly impossible.

## Comments and Documentation

- Comments explain non-obvious Web semantics, interop constraints, lifetime decisions, or compatibility behavior; they do not narrate syntax.
- Public wrapper documentation should link to a primary Web specification when practical; MDN may supplement it for developer-facing context.
- Do not claim incomplete or platform-limited behavior as complete standards support.
- Keep temporary debugging and migration narratives out of source comments and stable docs.

## Dependencies and Imports

- Keep target imports minimal and consistent with `Package.swift`.
- Import `WebFoundation` for shared bridge types/policy rather than introducing another JavaScriptKit dependency path.
- Do not add a feature-target dependency merely to reuse a small type with different semantics.

## Formatting and Change Discipline

- Match the surrounding file's indentation and organization in focused work.
- Avoid unrelated renaming, reordering, whitespace churn, or broad generated rewrites.
- If a broader style cleanup is needed, propose it as a separately scoped task with behavior-preservation evidence.
