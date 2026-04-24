# Profiling and diagnostics guide

Use a staged approach:

1. Confirm the scenario and input size.
2. Use coarse counters or timing to identify whether a problem exists.
3. Use tracing/profiling to identify where time is spent.
4. Use benchmarks for isolated code changes.
5. Verify correctness and compare results.

Recommended artifacts:

```text
artifacts/performance/
artifacts/benchmarks/
artifacts/build-logs/
```

Do not optimize by intuition when measurements are practical.
