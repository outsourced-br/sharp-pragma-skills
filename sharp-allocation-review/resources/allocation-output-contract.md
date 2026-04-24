# Allocation output contract

Every allocation finding must clearly distinguish between measured problems and speculative optimizations.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required fields

- **Measurement Status**: Must be `Measured`, `Candidate` (needs measurement), or `Approved`.
- **Hot-path Evidence**: Provide the profiler data, benchmark results, or logically deduce why this specific line is in a high-throughput loop (e.g., "This executes 10,000 times per request"). If missing, explicitly state "Evidence is missing."
- **Current Allocation Source**: What is allocating (e.g., closure capture, params array, string concatenation).
- **Proposed Change**: The specific structural change to avoid the allocation (e.g., `string.Create`, `ArrayPool`, `ref struct`).
- **Expected Readability Cost**: Acknowledge the tradeoff. Allocation-free code is often harder to read.
- **Recommendation Type**: Must be `Refactor` (if measured) or `Measure` (if unmeasured).

## False-Positive Guardrail

- **Measure before Refactor**: If there is no evidence that a code path is hot, output `Measure`, not `Refactor`. Do not recommend replacing simple string interpolation with `StringBuilder` or `string.Create` in one-off startup code or low-traffic background jobs.

## Example

### Bad Output
> "You are using `string.Join` which allocates. Change this to `StringBuilder`."

### Good Output
> **Measurement Status**: Candidate
> **Hot-path Evidence**: This method is part of the `ProcessTelemetry` loop, called 50,000 times per second.
> **Current Allocation Source**: `string.Split` allocates a new array on every log line.
> **Proposed Change**: Use `ReadOnlySpan<char>` and the `MemoryExtensions.EnumerateSplits` API to parse the string allocation-free.
> **Expected Readability Cost**: Moderate. Spans require refactoring the downstream parsers to accept `ReadOnlySpan<char>` instead of `string`.
> **Recommendation Type**: Measure
