# SOLID refactor playbook

When a SOLID violation is confirmed as a true positive, follow this playbook to recommend a safe, pragmatic refactor.

## Playbook Steps

1. **Identify the concrete pain**: Before changing code, explicitly state what is currently difficult (e.g., "I cannot test X without Y").
2. **Confirm tests or add characterization tests**: If the class is untested, recommend adding characterization tests to lock in current behavior before refactoring.
3. **Apply the smallest refactor**: Do not introduce MediatR, Event Sourcing, or complex Design Patterns if a simple method extraction or interface injection solves the problem.
4. **Avoid speculative abstractions**: Do not introduce `IOrderProcessor` if `OrderProcessor` is the only implementation and it isn't mocked in tests. Wait for a second implementer.
5. **Re-run tests**: Ensure the recommendation includes verifying that the existing test suite passes.

## False-Positive Guardrail

- **The "Every Class Needs an Interface" Myth**: It is a common false positive to recommend extracting interfaces for every class to satisfy the Dependency Inversion Principle (DIP). Do not recommend extracting an interface unless the dependency needs to be swapped (e.g., for tests, or multiple implementations).

## Example: Refactoring SRP

### Before (Bad)
```csharp
public class UserService {
    public void CreateUser(string name) {
        // DB logic
        // Email logic
    }
}
```

### After (Good)
```csharp
public class UserService(IEmailSender emailSender) {
    public void CreateUser(string name) {
        // DB logic
        emailSender.SendWelcomeEmail(name);
    }
}
```
*Note: We injected an abstraction for the external boundary (email) but kept the DB logic in place if it's simple enough.*