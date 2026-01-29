# Spec Alignment

## Core Principle

SwifWeb APIs must mirror Web platform specifications.
Swift APIs are adaptations, not redesigns.

## Hard Rules

- Every wrapper maps to a real browser API surface.
- API behavior stays close to browser semantics.
- Naming keeps Web concept identity.
- Ergonomic sugar is layered and additive.

## DO

- Prefer thin wrappers over framework-specific abstraction layers.
- Keep canonical API paths visible.
- Cite spec or MDN reference for new API surfaces.

## DO NOT

- Do not invent abstractions that diverge from the Web platform.
- Do not replace canonical semantics with project-specific behavior.
- Do not hide critical browser behavior behind opaque wrappers.
