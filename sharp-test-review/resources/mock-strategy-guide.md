# Mock strategy guide

Mocks are a powerful tool but are frequently misused, leading to brittle tests that break on every refactor.

## Core Heuristics

- **Good mocks isolate external effects**: Use mocks for HTTP clients, SMTP senders, message bus publishers, or file system wrappers.
- **Bad mocks duplicate implementation**: Do not mock internal domain logic, calculation engines, or validators. Use the real objects.
- **Prefer fakes or in-memory test doubles**: Whenever possible, use an in-memory `FakeRepository` over a generic `Mock<IRepository>`. Fakes make behavior clearer and tests more robust.
- **Avoid verifying every method call**: Do not write tests that merely assert `mock.Verify(x => x.Save(), Times.Once)`. This couples the test to the implementation details. Only verify interactions if the interaction itself is the core behavior (e.g., sending an email).

## False-Positive Guardrail

- **Mocking Dependencies**: A finding complaining about the use of `Moq` or `NSubstitute` is a false positive if the mock is used strictly for an infrastructure boundary (like `ISmtpClient`). Mocking at the edges is correct.

## Example

### Bad Mocking (Fragile)
```csharp
var taxMock = new Mock<ITaxCalculator>();
taxMock.Setup(x => x.Calculate(100)).Returns(10);
var service = new InvoiceService(taxMock.Object);
service.GenerateInvoice(100);
taxMock.Verify(x => x.Calculate(100), Times.Once); // Testing implementation detail
```

### Good Mocking (Robust)
```csharp
// Use the real, pure domain object
var realTaxCalculator = new TaxCalculator();
var service = new InvoiceService(realTaxCalculator);
var invoice = service.GenerateInvoice(100);
Assert.Equal(110, invoice.Total); // Testing observable behavior
```
