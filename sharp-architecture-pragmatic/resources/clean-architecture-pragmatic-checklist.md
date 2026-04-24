# Pragmatic clean architecture checklist

- Do inner/core projects avoid depending on infrastructure projects?
- Are use cases or workflows clear without excessive ceremony?
- Is IO isolated enough to test business behavior?
- Are entry points thin enough to understand?
- Are boundaries justified by change rate, testability, or deployment concerns?
- Are abstractions used where substitution is real, not speculative?

Do not require DDD naming. `Core`, `Business`, `Application`, and existing project names are acceptable when responsibilities are clear.
