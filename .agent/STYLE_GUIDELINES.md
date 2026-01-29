# Style Guidelines

## Naming

- Use Swift naming style while preserving Web naming intent.
- Keep canonical Web terms and property meaning.
- Do not rename Web concepts into project-specific vocabulary.

## API Ergonomics

- Provide ergonomic overloads only as additive layer.
- Keep canonical behavior available and unchanged.
- Prefer explicit parameter labels for options and configuration.

## Documentation

- Public wrappers should include a spec or MDN reference.
- Document behavior constraints, not marketing text.

## Dependency Style

- Use minimal dependencies per wrapper.
- Do not import unrelated API modules.
