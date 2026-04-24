# Analyzer profile guide

Analyzer policy should match the goal. Do not add every analyzer package by default.

## Profiles

### Code-quality profile

- SDK analyzers for correctness and maintainability.
- `.editorconfig` severity for naming, nullability, unused code, complexity, and API usage.
- `EnforceCodeStyleInBuild` only after baseline is clean or staged.

### Security profile

- Security-focused built-in rules.
- Optional security analyzers only when they match the project type.
- Treat credential leaks, insecure crypto, unsafe deserialization, and auth bypass risks as high severity.

### Performance profile

- Performance-sensitive analyzer rules where useful.
- Avoid style analyzers that create noise in hot-path reviews.
- Pair analyzer findings with benchmark/profiler evidence before refactoring.

### Test profile

- Test framework analyzers.
- Async test correctness.
- Assertion quality and fixture lifecycle.

### Migration profile

- Start with correctness/security rules.
- Add maintainability/style rules after baseline.
- Avoid turning all warnings into errors on day one.
