# Sample Directory.Packages.props

```xml
<Project>
  <PropertyGroup>
    <ManagePackageVersionsCentrally>true</ManagePackageVersionsCentrally>
  </PropertyGroup>

  <ItemGroup>
    <PackageVersion Include="BenchmarkDotNet" Version="0.14.0" />
    <PackageVersion Include="Microsoft.NET.Test.Sdk" Version="17.13.0" />
    <PackageVersion Include="NUnit" Version="4.3.2" />
  </ItemGroup>
</Project>
```

`PackageVersion` centralizes a version. It does not add the package to a project. Projects still need `PackageReference` or a deliberate `GlobalPackageReference` where appropriate.
