# CI reproducibility guide

## Recommended CI evidence

- Capture `dotnet --info` to `/artifacts/build-logs/dotnet-info.txt`.
- Restore explicitly before build.
- Use locked restore when package lock files are intentionally committed.
- Run `dotnet format --verify-no-changes` after `.editorconfig` baseline is staged.
- Write test results to `/artifacts/test-results`.
- Write coverage to `/artifacts/coverage`.
- Write benchmark output to `/artifacts/benchmarks`.
- Write dependency reports to `/artifacts/dependency-reports`.

## global.json policy

Use `global.json` when the team needs reproducible SDK selection. Do not pin to an unsupported or unavailable SDK. Prefer a patch band that CI and developers can actually install.

## Staged rollout

Do not break CI broadly by enabling all warnings-as-errors, all style checks, all analyzers, and locked restore at once. Stage changes and record baseline debt.
