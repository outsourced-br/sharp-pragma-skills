# Findings severity matrix

Use `docs/severity-and-reporting-model.md` as the source of truth. This resource provides examples only.

| Example | Severity |
|---|---|
| Committed production secret | Critical |
| Unsupported framework in public production app | Critical or Major |
| Vulnerable package with reachable production exposure | Major or Critical |
| Near-EOS .NET 8/.NET 9 production app | Informational or Minor now, Major when migration window is risky |
| No benchmark for proposed allocation-free rewrite | Needs evidence, not Refactor |
| Preference for `/source` over consistent `/src` | No finding |
