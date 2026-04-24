# SOLID output contract

Every SOLID finding must be actionable and provide a structured explanation.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required fields

- **Principle**: The specific SOLID principle violated (e.g., SRP, OCP, LSP, ISP, DIP).
- **Location**: Exact file and line number (or method name) where the violation occurs.
- **Concrete Harm**: What maintainability, testability, or extension pain this causes today. Do not cite theoretical or future harm.
- **Why Simpler Alternatives Are Insufficient**: Explain why a basic refactor (like extracting a private method) isn't enough to solve the pain.
- **Proposed Change**: The specific, pragmatic refactor required to align with the principle.
- **Expected Tests**: How the new design should be verified.

## False-Positive Guardrail

Before emitting a finding, verify that this is not a false positive:
- **Is the code changing frequently?** If the code works and never changes, do not recommend OCP extraction.
- **Is the abstraction speculative?** If you are extracting an interface that has only one implementation and no test mocks, this is YAGNI, not DIP.

## Example

### Bad Output (Too vague)
> "OrderService violates SRP because it does too much. You should split it into multiple classes."

### Good Output
> **Principle**: SRP
> **Location**: `OrderService.cs:45` (ProcessOrder method)
> **Concrete Harm**: The method mixes business logic (calculating discounts) with infrastructure concerns (sending emails), making it impossible to unit test the discount logic without mocking the SMTP client.
> **Why Simpler Alternatives Are Insufficient**: A private method for discounts still requires the SMTP client dependency in the constructor of `OrderService`.
> **Proposed Change**: Extract the discount calculation into a pure, immutable `DiscountCalculator` service.
> **Expected Tests**: A fast, dependency-free unit test suite for `DiscountCalculator.Calculate()`.
