# Sample Directory.Build.targets

Use targets sparingly. Prefer props for configuration and targets only for actual build hooks.

```xml
<Project>
  <Target Name="PrintBuildContext" BeforeTargets="Build" Condition="'$(CI)' == 'true'">
    <Message Importance="high" Text="Building $(MSBuildProjectName) for $(TargetFramework)" />
  </Target>
</Project>
```

Avoid custom targets that duplicate SDK behavior or hide generated outputs in surprising places.
