# Healthy versus harmful reuse

Healthy reuse:

- Same concept, same reason to change.
- Clear ownership.
- Tests cover shared behavior.
- Callers stay readable.

Harmful reuse:

- Similar code but different business meaning.
- Flags and conditionals pile up to support all callers.
- One shared helper breaks unrelated features.
