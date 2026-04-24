# SDK analyzers versus package analyzers

Modern SDK-style .NET projects targeting .NET 5 or later include SDK analyzers. Do not add `Microsoft.CodeAnalysis.NetAnalyzers` by default.

Use the NuGet analyzer package only when there is a deliberate reason, such as:

- non-SDK-style project,
- older target framework/tooling,
- desire to decouple analyzer updates from SDK updates,
- or a pinned analyzer baseline.

Important nuance: for .NET 5+ projects, installing `Microsoft.CodeAnalysis.NetAnalyzers` can turn off built-in SDK analyzers and may produce warnings if the SDK has newer analyzer assemblies. Review before adding or removing it.
