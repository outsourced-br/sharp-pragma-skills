# Scoping and filtering

A full review is expensive. Use the smallest scope that answers the user request.

## Scope examples

- Repo layout request: `sharp-repo-structure`, then optionally `sharp-build-conventions`.
- Props/targets request: `sharp-build-conventions` only.
- Vulnerability or NuGet request: `sharp-nuget-dependency-review`, then optionally `sharp-security-hygiene`.
- Analyzer request: `sharp-analyzer-policy-review`.
- Allocation-free request: `sharp-performance-review` then `sharp-allocation-review`.
- Test strategy request: `sharp-test-review`.

## Do not over-route

Do not run full review just because a companion skill is mentioned. Companion links are context hints.
