# Code quality output contract

Ensure code quality findings are specific, located, and actionable. Avoid vague recommendations.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required fields

Group findings into the following categories. If a category has no issues, explicitly state "No issues found."

1. **Naming and Intent**: Names that obscure purpose, require comments to understand, or mislead readers.
2. **Cohesion and Size**: Methods or classes doing too many unrelated things. (Do not flag long methods that have a single, clear workflow - see false-positive guardrail below.)
3. **Async and Resource Management**: Missing `await`, blocking on `.Result`/`.Wait()`, missing `CancellationToken` propagation, or incorrect `IDisposable`/`IAsyncDisposable` usage.
4. **Nullability**: Mismatched nullable annotations, suppressed warnings without justification, or null dereference risks.
5. **Exceptions and Logging**: Swallowed exceptions, missing context in logged errors, noisy logging in hot paths, or exception types that hide root causes.
6. **State and Side Effects**: Static mutable state, hidden global dependencies, or methods with surprising side effects.
7. **Unnecessary Cleverness**: Code that sacrifices readability for cleverness without measurable benefit.

## False-Positive Guardrail

- **Long Methods**: A 60-line method with a single, clear, linear workflow is not a quality issue. Do not recommend splitting it unless cohesion is actually poor (multiple unrelated responsibilities in one method).
- **Simple If-Else Chains**: Do not recommend replacing a 4-branch `if-else` with the Strategy pattern or a lookup dictionary. Simple branching is fine when the logic is stable and readable.

## Example

### Bad Output
> "The method `ProcessOrder` is too long. You should refactor it."

### Good Output
> **Category: Async and Resource Management**
> **Location**: `DataImporter.cs:87` (`ImportBatchAsync` method)
> **Finding**: `ImportBatchAsync` calls `httpClient.GetAsync().Result`, which blocks the thread pool thread. Under load, this can exhaust the thread pool and cause request timeouts.
> **Recommendation**: Change to `await httpClient.GetAsync()` and propagate `CancellationToken` from the caller.
