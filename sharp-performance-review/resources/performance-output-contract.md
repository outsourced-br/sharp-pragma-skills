# Performance output contract

Every performance finding must clearly separate measured evidence from suspected risk. Do not recommend refactors without evidence.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required fields

- **Scenario**: The specific user-facing or system-facing operation affected (e.g., "Batch import of 50,000 records", "API response for /orders endpoint").
- **Suspected Bottleneck**: The specific code pattern or query shape causing the risk (e.g., N+1 EF query, synchronous blocking in async path, unbounded LINQ materialization).
- **Evidence Level**: Must be one of:
  - `Measured`: Profiler output, benchmark data, or production telemetry attached.
  - `Inferred`: Structural analysis suggests a problem, but no measurement exists yet.
  - `Reported`: The user or team has reported the problem anecdotally.
- **Measurement Plan or Measured Result**: If `Measured`, provide the data. If `Inferred` or `Reported`, provide an exact plan to measure (tool, command, expected metric).
- **Correctness Guard**: How to verify the fix does not change behavior (e.g., existing tests, new characterization tests, comparison queries).
- **Recommendation Type**: Must be `Refactor` (if measured) or `Measure` (if unmeasured).

## False-Positive Guardrail

- **Cold Paths**: Do not recommend performance refactors for code that runs once at startup, in low-traffic admin panels, or in background jobs processing a handful of items. Classify these as `Informational` at most.
- **Premature Optimization**: If no user or system has reported a performance issue, and no profiler data exists, the finding must output a measurement plan - never a concrete refactor.

## Example

### Bad Output
> "You are loading all records into memory. Use pagination."

### Good Output
> **Scenario**: The `/api/products` endpoint loads the entire `Products` table into memory for filtering.
> **Suspected Bottleneck**: `dbContext.Products.ToListAsync()` materializes all rows before applying the `Where` clause in-memory.
> **Evidence Level**: Inferred (no profiler data, but the Products table has 200,000 rows based on seed scripts).
> **Measurement Plan**: Run `dotnet-counters monitor` during a load test with 100 concurrent requests to `/api/products?category=electronics`. Capture GC allocation rate and P99 latency.
> **Correctness Guard**: Existing integration tests for the Products endpoint must continue to pass with the same result set.
> **Recommendation Type**: Measure
