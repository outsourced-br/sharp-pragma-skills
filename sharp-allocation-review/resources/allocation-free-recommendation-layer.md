# Allocation-free recommendation layer

This skill reuses `sharp-performance-review` context and adds allocation-specific recommendations.

## Recommendation tiers

1. Readability-preserving: cache regex, avoid accidental closure, pre-size collections when count is known.
2. Hot-path-only: replace LINQ with loops, reduce string allocations, use pooled buffers.
3. Benchmark-required: `Span<T>`, `ArrayPool<T>`, custom parsers, `ValueTask`, object pooling.
4. Do-not-change: no hot path, unclear correctness, or readability cost exceeds evidence.

Allocation-free code is not automatically better code.
