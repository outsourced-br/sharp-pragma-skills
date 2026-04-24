# Design review output contract

For each design finding (KISS, DRY, YAGNI, Tell Don't Ask), include a structured assessment.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required fields

- **Principle Involved**: State the exact principle (e.g., YAGNI, KISS, DRY).
- **Evidence in Code**: Provide the exact snippet or location demonstrating the violation.
- **Actual vs. Speculative**: State whether the issue causes current pain (Actual) or is just visually unappealing (Speculative).
- **Smallest Safe Correction**: Recommend the most direct path to simplicity. Do not recommend entire pattern rewrites for a local KISS violation.
- **False-Positive Check**: Explicitly state why this is not a false positive.

## False-Positive Guardrails

- **DRY**: Duplicating two lines of code is often better than coupling two unrelated modules to a shared helper. If the duplicated code changes for different reasons, it is not a DRY violation.
- **Tell Don't Ask**: If the object is a pure DTO (Data Transfer Object) or ViewModel, it has no behavior. It is perfectly fine to "ask" for its state.

## Example

### Bad Output
> "User is asked for its status instead of told what to do. Fix this."

### Good Output
> **Principle Involved**: Tell Don't Ask (TDA)
> **Evidence in Code**: `OrderProcessor.cs:112` - `if (user.GetStatus() == Status.Active && user.GetBalance() > 0) { user.SetDiscount(true); }`
> **Actual vs. Speculative**: Actual. The logic for user discount eligibility is leaking into `OrderProcessor`, scattering business rules.
> **Smallest Safe Correction**: Move the logic to the `User` business model: `user.ApplyDiscountIfEligible()`.
> **False-Positive Check**: The `User` object is a behavior-owning business model in this project, not a simple API DTO, meaning behavior belongs inside it.
