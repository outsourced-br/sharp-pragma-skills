# Dependency status checklist

Run or request equivalent evidence:

```bash
# .NET 10+
dotnet package list --outdated --include-transitive --format json

dotnet package list --deprecated --include-transitive --format json

dotnet package list --vulnerable --include-transitive --format json

# .NET 9 or earlier fallback
dotnet list package --outdated --include-transitive --format json

dotnet list package --deprecated --include-transitive --format json

dotnet list package --vulnerable --include-transitive --format json
```

Do not combine `--vulnerable` with `--deprecated` or `--outdated`.

## Classification

- Vulnerable package with available fix in production: Major or Critical depending on severity/exposure.
- Deprecated package with replacement: Major or Minor depending on reach.
- Major-version update available: Informational unless security/support risk exists.
- Transitive vulnerability: identify the closest direct package responsible before recommending a fix.
