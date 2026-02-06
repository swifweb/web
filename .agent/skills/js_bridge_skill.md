# JavaScript Bridge Skill

Use for `JSValue`, `JSObject`, `JSClosure`, callback, promise, JavaScript error, or wasm/native behavior changes.

## Required Context

- Primary: `architecture/RUNTIME_BRIDGE.md`
- Supporting: `architecture/FOUNDATION_RULES.md` and the exact feature owner when needed

## Procedure

1. Trace the underlying browser operation and current call chain, including target object/receiver and all completion paths.
2. Classify each JavaScript value state: missing, `undefined`, `null`, conversion failure, or valid value.
3. Identify closure ownership, retention duration, capture graph, one-shot/long-lived behavior, and release/invalidation path.
4. For promises/callbacks, prove success/failure mapping, exact-once completion, argument order, and lifetime through completion.
5. Verify whether behavior is wasm-only and what the native path truthfully does.
6. Keep shared conversions/policy in `WebFoundation`; keep feature-specific calls in the owning target.
7. Audit early returns, thrown/rejected failures, method receiver, cleanup, and direct callers.

## Stop Conditions

Stop when cleanup ownership is unclear, failure would be swallowed, native code would report false browser success, or the change needs a competing bridge dependency/policy.
