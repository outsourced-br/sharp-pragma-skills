# Performance review checklist

Investigate:

- high-volume loops,
- serialization/deserialization,
- file/network/database IO,
- EF query shape and N+1 risks,
- repeated parsing/formatting,
- synchronous blocking in async paths,
- lock contention,
- caching misuse,
- startup time,
- excessive logging in hot paths,
- dependency versions with known performance regressions.

Classify findings as:

- Evidence-backed refactor,
- Benchmark required,
- Profiling required,
- Informational.
