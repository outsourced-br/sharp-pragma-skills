# Composition review output contract

Every composition-over-inheritance finding must be evidence-based.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required fields

- **Hierarchy Location**: The exact base class and derived class(es) involved.
- **Why Inheritance is Harmful**: Specific evidence of fragility. For example: base class changes break derived classes, deep nesting makes logic untraceable, or derived classes are forced to implement methods they don't need (LSP violation).
- **Why Inheritance is Acceptable (if applicable)**: If keeping it, state why (e.g., pure UI framework requirement, bounded template method).
- **Proposed Composition Shape**: How to flatten the hierarchy using interfaces, strategy objects, or injected dependencies.
- **Migration Risk**: The impact of changing the hierarchy on existing callers.
- **Tests Required**: Regression tests needed before and after the change.

## False-Positive Guardrail

- **Framework Requirements**: Do not recommend composition for `Exception` classes, UI components (like WPF or WinForms), or framework-mandated base classes (e.g., ASP.NET Core `ControllerBase`).
- **Template Method Pattern**: A shallow (1-level deep) hierarchy using the template method pattern is often perfectly acceptable. Do not force composition just for ideological purity.

## Example

### Bad Output
> "CustomerRepository inherits from BaseRepository. Use composition instead of inheritance."

### Good Output
> **Hierarchy Location**: `CustomerRepository : BaseRepository : DbContext`
> **Why Inheritance is Harmful**: `BaseRepository` exposes 15 methods, but `CustomerRepository` only needs 2. Changes to `BaseRepository` caching logic recently broke `CustomerRepository`.
> **Proposed Composition Shape**: Inject `IDbConnection` or an encapsulated `ICache` directly into `CustomerRepository` rather than deriving from a god-class.
> **Migration Risk**: High. All 40 repositories deriving from `BaseRepository` must be audited if `BaseRepository` is deprecated.
> **Tests Required**: Integration tests for `CustomerRepository` verifying identical SQL generation before and after flattening.
