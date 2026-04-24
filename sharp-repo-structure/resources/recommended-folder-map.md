# Recommended folder map

The repository may use `/src` or `/source`. Both are acceptable. Consistency matters more than spelling.

Recommended shape:

```text
/
  README.md
  docs/
  specs/
  source/ or src/
  tests/
  benchmarks/              # optional, for performance/allocation evidence
  scripts/
  artifacts/               # generated output, usually gitignored
  Directory.Build.props
  Directory.Build.targets
  Directory.Packages.props # when Central Package Management is used
  global.json              # when SDK pinning is needed
```

## Rules

- Keep generated outputs under `/artifacts` or standard ignored build folders.
- Keep specifications and docs adjacent to source, not embedded in project folders unless project-specific.
- Do not rename `/src` to `/source` or the reverse unless consistency is already broken or the user asked for it.
