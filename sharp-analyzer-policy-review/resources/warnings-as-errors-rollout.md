# Warnings-as-errors rollout

Recommended rollout:

1. Build succeeds with current warnings.
2. Enable or tune analyzers in `.editorconfig`.
3. Fix Critical/Major correctness and security warnings.
4. Run `dotnet format --verify-no-changes` in report-only mode.
5. Enable warnings-as-errors for selected categories or projects.
6. Expand scope only after baseline is stable.

Avoid global `<TreatWarningsAsErrors>true</TreatWarningsAsErrors>` in noisy existing repositories.
