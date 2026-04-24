# Exception, logging, and nullability guide

## Exceptions

Use specific exception types and include context. Do not throw `Exception` for expected validation results.

Neutral example:

```csharp
public sealed class ApplicationRuleException : InvalidOperationException
{
    public ApplicationRuleException(string message) : base(message) { }
}
```

## Logging

Prefer structured logging:

```csharp
logger.LogWarning("Import skipped row {RowNumber} because {Reason}", rowNumber, reason);
```

Do not log secrets, tokens, credentials, full customer exports, or raw payment data.

## Nullability

Enable nullable reference types where feasible. Do not silence warnings with `!` unless the invariant is proven and documented nearby.
