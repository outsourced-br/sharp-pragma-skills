# .editorconfig baseline

Use `.editorconfig` as the source of truth for analyzer severity.

```ini
root = true

[*.cs]
dotnet_analyzer_diagnostic.category-Security.severity = warning
dotnet_analyzer_diagnostic.category-Reliability.severity = warning
dotnet_analyzer_diagnostic.category-Performance.severity = suggestion

dotnet_diagnostic.CA1822.severity = suggestion
```

Do not make style rules errors until the repository has been formatted and the team accepts the convention.
