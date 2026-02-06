# Runtime Bridge

Authoritative owner for JavaScript value, object, closure, callback, promise, and wasm/native runtime semantics.

## Scope

This chunk governs how wrappers preserve runtime behavior. Shared type placement belongs to `FOUNDATION_RULES.md`; public API shape belongs to `API_DESIGN_RULES.md`.

## Stable Boundary Rules

### BRIDGE-001 — Value-state fidelity

Preserve meaningful distinctions among missing values, JavaScript `undefined`, `null`, conversion failure, and valid falsy values. Do not collapse them unless the Web API itself defines that equivalence.

### BRIDGE-002 — Object identity and receiver

When browser behavior depends on object identity or `this`, retain and call the correct `JSObject`/receiver. Do not reconstruct wrappers in a way that changes identity-sensitive behavior.

### BRIDGE-003 — Closure lifetime

Every retained `JSClosure` has an explicit owner and release/invalidation path appropriate to the Web API. One-shot closures must not become unbounded retained state; long-lived listeners must remain alive until detach/invalidation.

### BRIDGE-004 — Promise completion

Promise adapters complete exactly once, preserve fulfillment/rejection distinction, and keep required closures alive through settlement. Async/await or callback convenience is additive to the underlying asynchronous semantics.

### BRIDGE-005 — Callback contracts

Map callback argument positions, optionality, and invocation ordering from the actual API. Treat malformed/unexpected JavaScript values as explicit conversion/error cases rather than silently fabricating success values.

### BRIDGE-006 — Error fidelity

Do not swallow JavaScript exceptions or promise rejections. Map them to a documented Swift error/result path while retaining enough underlying information for callers to understand failure.

### BRIDGE-007 — Wasm and native behavior

Browser-global operations execute only where that runtime exists. Native compilation paths may provide inert/default behavior only when the public contract documents it and it does not masquerade as a successful browser operation.

### BRIDGE-008 — Single source of truth

Do not keep mutable Swift shadow state that can drift from the wrapped JavaScript object. Cache only immutable/derived values or explicitly synchronized state required by the wrapper contract.

## Review Hazards

Check `JSClosure` capture cycles, listener removal identity, promise early-release/double-completion, force-unwrapped browser globals, incorrect method receiver, undefined/null conflation, and native paths that report false success.

## Related Owners

- `FOUNDATION_RULES.md` — shared interop ownership
- `EVENT_MODEL.md` — listener-specific lifecycle
- `API_DESIGN_RULES.md` — public async/error surface
