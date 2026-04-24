# Allocation hotspot guide

Potential hotspots:

- LINQ in high-volume loops,
- repeated string concatenation/substring/formatting,
- closures inside loops,
- boxing from interfaces/enums/value types,
- per-row allocations in import/export paths,
- repeated regex creation,
- JSON serialization allocations,
- `Task` allocation in extremely hot completed paths,
- array/list creation inside hot loops.

Do not recommend `Span<T>`, `Memory<T>`, `ArrayPool<T>`, pooling, or `ValueTask` unless the path is hot and evidence supports the change.
