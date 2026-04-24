# Test review output contract

Ensure test findings are actionable and categorized by their structural impact on the suite.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required fields

Group findings into the following categories. If a category has no issues, explicitly state "No issues found."

1. **Missing Critical Coverage**: Core business logic or complex conditional paths lacking tests. (Do not report on lack of coverage for simple getters/setters or DTOs).
2. **Weak Assertions**: Tests that execute code but fail to verify the outcome (e.g., missing assertions, verifying only that no exception was thrown).
3. **Over-Mocking**: Tests that mock everything except the single class under test, rendering the test brittle and unable to catch integration failures.
4. **Flaky Tests**: Tests relying on `Task.Delay`, `DateTime.Now`, random numbers, or unordered collections.
5. **Integration-Test Gaps**: Areas where unit tests pass but real-world boundaries (database, HTTP, file system) are untested.
6. **Scenario-Test Gaps**: Lack of end-to-end user flows or use-case-driven tests.
7. **Test Infrastructure Problems**: Messy test setup, lack of shared fixtures, or duplicated database seeding logic.

## False-Positive Guardrail

- **100% Coverage Rule**: Never demand 100% code coverage. If a finding complains about untested boilerplate, reject it.
- **Valid Mocks**: Mocking external services (SMTP, third-party APIs, Stripe) is correct. Only flag mocking of internal business logic or small immutable value-semantic types.

## Example

### Bad Output
> **Category: Missing Critical Coverage**
> **Finding**: Coverage is only 82%. Raise coverage to 100%.

### Good Output
> **Category: Over-Mocking**
> **Location**: `InvoiceServiceTests.cs`
> **Finding**: `InvoiceServiceTests` mocks the internal `TaxCalculator` and `DiscountApplier` classes. This means the test only verifies that the service called the calculators, not that the final invoice total is actually correct.
> **Recommendation**: Use real instances of `TaxCalculator` and `DiscountApplier`. They are pure, fast, in-memory classes. Reserve mocks for the `IEmailSender` dependency.
