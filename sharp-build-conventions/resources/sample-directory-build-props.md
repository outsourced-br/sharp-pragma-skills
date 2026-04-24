# Sample Directory.Build.props

Canonical default sample. Keep it conservative.

```xml
<Project>
  <PropertyGroup>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
    <LangVersion>default</LangVersion>
    <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
    <EnforceCodeStyleInBuild>false</EnforceCodeStyleInBuild>
    <ContinuousIntegrationBuild Condition="'$(CI)' == 'true'">true</ContinuousIntegrationBuild>
  </PropertyGroup>
</Project>
```

Do not use `<LangVersion>latest</LangVersion>` as a default. Do not set global warnings-as-errors until the repository has a clean baseline or a staged rollout.
