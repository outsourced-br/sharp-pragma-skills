# Dependency hygiene checklist

Coordinate with `sharp-nuget-dependency-review`.

- Vulnerable package exposure.
- Deprecated security-sensitive packages.
- Insecure package sources.
- Missing package source mapping with private feeds.
- Suppressed audit warnings with no owner/expiry.
- Analyzer rules that could catch security issues.
