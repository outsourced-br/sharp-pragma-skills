# Solution audit false-positive guardrails

Do not flag:

- `/src` versus `/source` if the repository is internally consistent.
- A project named `.Domain` if it already exists and does not force DDD behavior.
- Lack of .NET 10 migration when the app is pinned by hosting/vendor constraints.
- Lack of latest C# syntax in .NET 9 or .NET 10 projects.
- Missing tests as Critical unless build/release safety is materially compromised.
