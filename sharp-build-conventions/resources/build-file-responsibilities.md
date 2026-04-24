# Build file responsibilities

| File | Responsibility |
|---|---|
| `global.json` | SDK pinning when reproducibility requires it. |
| `Directory.Build.props` | Shared MSBuild properties. Conservative defaults only. |
| `Directory.Build.targets` | Shared build hooks. Use sparingly. |
| `Directory.Packages.props` | Central Package Management versions and NuGet audit policy where chosen. |
| `.editorconfig` | Analyzer severity and style configuration. |
| `nuget.config` | Package sources, audit sources, source mapping, credentials via safe mechanisms. |

## Canonical defaults

- `LangVersion`: `default` unless there is a justified pin.
- `TreatWarningsAsErrors`: staged rollout, not globally true by default.
- `EnforceCodeStyleInBuild`: enable after style baseline is clean or scoped.
