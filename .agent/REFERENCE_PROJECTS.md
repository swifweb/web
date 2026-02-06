# Standards, Dependencies, and External Evidence

Stable SwifWeb documentation must remain portable. Do not persist machine-local checkout paths, sibling-repository assumptions, or instructions that require an evidence repository to exist.

## Web Standards Evidence

For browser semantics, prefer the current primary specification owned by the relevant standards body (for example WHATWG, W3C, TC39, or IETF). MDN is useful supplementary developer documentation, but it is not a substitute when exact normative behavior matters.

Record the exact specification section/URL in the task artifact and, when useful to API consumers, in public wrapper documentation. Verify time-sensitive standards and dependency claims from current primary sources.

## Active Dependency

JavaScriptKit is the current declared interoperability dependency. Resolve its version and products from `Package.swift`; inspect only the targeted dependency API/source needed for the task. Do not duplicate JavaScriptKit's implementation documentation into SwifWeb or assume a machine-local checkout.

Replacing or adding a dependency is an explicit reviewed manifest/architecture change, not an opportunistic wrapper edit.

## External Repository Evidence

Repositories supplied for comparison, research, or style extraction are task inputs, not permanent SwifWeb context.

Keep repository paths, sampled files, branch/commit identifiers, comparison notes, and competing examples in `.artifacts/**`. Promote only a reviewed, self-contained SwifWeb rule into its single stable owner.

## Promotion Rules

- Explicit maintainer direction outranks patterns inferred from another repository.
- Existing SwifWeb architecture and real Web semantics must be reconciled before promoting a pattern.
- Classify a candidate as common governance, SwifWeb-specific, Web-spec-constrained, dependency-constrained, legacy, accidental, or conflicting.
- Do not silently replace an accepted rule; document the conflict and obtain review for the intended change.
- A promoted rule must remain understandable and enforceable on another machine with no evidence checkout present.
- External project names should not remain in stable docs solely as provenance.

After a material governance update, audit for duplicate authority, overly broad rules, obsolete assumptions, and context-budget inflation.
