# Package source mapping guide

Multiple NuGet sources create dependency-confusion risk. Package source mapping restricts which packages may come from which sources.

## Example

```xml
<configuration>
  <packageSources>
    <clear />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
    <add key="company" value="https://nuget.example.com/v3/index.json" />
  </packageSources>

  <packageSourceMapping>
    <packageSource key="nuget.org">
      <package pattern="Newtonsoft.Json" />
      <package pattern="Microsoft.*" />
      <package pattern="System.*" />
    </packageSource>
    <packageSource key="company">
      <package pattern="Company.*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
```

## Findings

- Multiple sources with no mapping: Major for production/private-package repos, Minor otherwise.
- HTTP package source: Major or Critical depending on exposure.
- Credentials in committed config: Critical.
- Broad `*` mapping to multiple sources: likely unsafe.

## False positives

Do not require source mapping for a simple repo using only `nuget.org` unless policy requires it.
