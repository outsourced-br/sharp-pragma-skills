# NuGet audit policy guide

NuGet audit should be treated as restore-time supply-chain hygiene, not just a one-off package list command.

## Properties to inspect

```xml
<PropertyGroup>
  <NuGetAudit>true</NuGetAudit>
  <NuGetAuditMode>all</NuGetAuditMode>
  <NuGetAuditLevel>moderate</NuGetAuditLevel>
</PropertyGroup>
```

## Meaning

- `NuGetAudit`: enables vulnerability auditing during restore.
- `NuGetAuditMode`: `direct` audits direct packages; `all` audits direct plus transitive packages.
- `NuGetAuditLevel`: minimum severity reported.
- `AuditSources`: sources used for vulnerability data.

For projects targeting `net10.0` or later, `NuGetAuditMode` defaults to `all`. For older targets it defaults to `direct` unless configured. Multi-targeted projects should be reviewed carefully because one target may affect the effective audit mode.

## Recommended stance

- New production apps: prefer `NuGetAudit=true` and `NuGetAuditMode=all`.
- Existing noisy repos: stage audit rollout by severity.
- Private feed plus public feed: set `AuditSources` deliberately if package sources cannot provide vulnerability data reliably.
- Do not suppress audit warnings without owner, expiry, and reason.

## Remediation

`dotnet package update --vulnerable` may be considered in .NET 10-era tooling, but agents must review the resulting changes, run tests, and avoid blind major upgrades in production code.
