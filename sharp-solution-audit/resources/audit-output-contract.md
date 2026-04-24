# Audit output contract

The audit does not perform deep refactoring analysis. It maps what should be reviewed next and identifies high-level risks that affect review scope.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required output

- Solution inventory
- Target framework policy findings
- Project graph risks
- Build/test entry point risks
- Suggested scoped workflow

## False-positive guardrails

- Do not mark .NET 8 or .NET 9 unsupported while they are still within the documented support window.
- Do not recommend DDD terminology, project renaming, or extra layers solely from project names.
- Do not create deep architecture findings during audit; route them to the relevant downstream skill.

## Example

### Bad Output
> "This solution has a `Domain` project, so rename it and introduce aggregates before review continues."

### Good Output
> **ID**: AUD-001
> **Severity**: Informational
> **Category**: Architecture
> **Location**: `src/Billing.Domain/Billing.Domain.csproj`
> **Evidence**: The solution already contains a project named `Billing.Domain`.
> **Impact**: The name alone does not create risk; downstream architecture review should inspect dependency direction and responsibilities.
> **Recommendation**: Keep the existing name unless the project responsibilities are unclear or inconsistent with local conventions.
> **Confidence**: High
> **Effort**: S
> **Owner**: Either
> **Companion handoff**: `sharp-architecture-pragmatic`
