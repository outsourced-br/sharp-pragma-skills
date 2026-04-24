# Benchmarking execution guide

## Execution mode

When repository write/execute access is available:

1. Create or update a benchmark project under `/benchmarks` or `/tests/Benchmarks`.
2. Add `BenchmarkDotNet` with `PrivateAssets="all"` where appropriate.
3. Use representative test data.
4. Add correctness tests before accepting the rewrite.
5. Run Release benchmarks.
6. Write results to `/artifacts/benchmarks`.
7. Compare Mean, Allocated, Gen0, Gen1, Gen2, and error ranges.
8. Classify the change only after comparing before/after.

Example command:

```bash
dotnet run -c Release --project benchmarks/App.Benchmarks -- --artifacts /artifacts/benchmarks
```

## No-tool fallback mode

When tools cannot be run, output:

- benchmark project patch,
- representative data plan,
- exact commands,
- expected metrics,
- acceptance threshold,
- rollback criteria.
