# .NET version and C# language policy

## Current policy baseline

As of April 2026:

- .NET 10 is LTS and supported until November 14, 2028.
- .NET 9 is STS and supported until November 10, 2026.
- .NET 8 is LTS and supported until November 10, 2026.

## Findings

- Unsupported target framework in active production code: Major or Critical depending on exposure.
- .NET 8 or .NET 9 in production: supported, but add migration-planning note because support ends on November 10, 2026.
- .NET 10 for new production apps: preferred unless compatibility, hosting, vendor, or migration constraints exist.
- Multi-targeted libraries: judge by consumer requirements, not by newest framework alone.

## C# feature debt

For .NET 8 projects, missing high-value language features may be classified as debt only when the absence creates concrete maintainability cost. Examples include repeated null checks that could be simplified safely or collection initializers that reduce boilerplate materially.

For .NET 9 and .NET 10 projects, lack of the newest syntax is not debt by itself. Do not churn code to use newer language features merely because they exist.

## LangVersion

Default recommendation: use the SDK default language version unless the repository has a clear reason to pin. Avoid `<LangVersion>latest</LangVersion>` as a default because it can change behavior when SDKs change.
