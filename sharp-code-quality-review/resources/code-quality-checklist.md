# Code quality checklist

- Names explain intent without comments.
- Methods have one coherent responsibility.
- Guard clauses clarify invalid inputs.
- Nullability annotations match reality.
- Exceptions are meaningful and not swallowed.
- Logging is actionable and not noisy.
- Cancellation tokens are accepted and propagated in async IO paths.
- `IDisposable` and `IAsyncDisposable` are used correctly.
- Static helpers do not hide mutable global state.
- Mapping code is clear and testable.
- Cleverness is justified by payoff.
