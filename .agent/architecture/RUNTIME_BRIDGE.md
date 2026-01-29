# Runtime Bridge

## Bridge Ownership

- Bridge primitives are owned by `WebFoundation`.
- Wrapper modules consume bridge APIs but do not redefine bridge infrastructure.

## JSValue Lifecycle Rules

- Store `JSValue` only when lifecycle and ownership are clear.
- Avoid uncontrolled global retention of `JSValue`.
- Keep wrapper state synchronized with JS source of truth.

## Promise Bridging Patterns

- JS promises may be exposed as callback-based APIs or async/await adapters.
- Async wrappers must preserve browser completion and error semantics.
- Promise rejection must map to explicit Swift error paths.

## Async/Await Mapping

- Async convenience is additive.
- Canonical async behavior must match underlying JS behavior.
- Do not swallow or reinterpret JS errors.

## Memory Safety Rules

- Avoid retain cycles in closures capturing wrapper instances.
- Ensure closure-based handlers are released when no longer needed.
- Keep wrapper references bounded to required lifetime.

## JSClosure Lifecycle

- `JSClosure` instances must have explicit release/lifetime strategy.
- Do not leak long-lived closures for short-lived listeners.
- Listener detach paths must release corresponding closure references.

## WASM Constraints

- All browser bridge calls are guarded by `#if arch(wasm32)` where applicable.
- Non-wasm paths must not assume browser runtime availability.
