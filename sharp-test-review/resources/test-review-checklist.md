# Test review checklist

- Are critical workflows covered by meaningful tests?
- Are unit tests focused and fast?
- Are integration tests realistic enough to catch wiring/IO failures?
- Are scenario tests used for monetary, time-window, estimation, or allocation-sensitive logic?
- Are mocks used to isolate external IO, not to mirror implementation details?
- Are flaky tests identified?
- Are test names clear about behavior?
