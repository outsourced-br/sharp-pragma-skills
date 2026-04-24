# Central output conventions

Generated review artifacts should go under `/artifacts`:

```text
artifacts/
  build-logs/
  test-results/
  coverage/
  dependency-reports/
  analyzer-reports/
  benchmarks/
  review-reports/
```

Build outputs may remain in `bin/` and `obj/` if they are ignored. Do not force custom output paths unless the repository has a reason.
