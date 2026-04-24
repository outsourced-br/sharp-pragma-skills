# Acceptable inheritance use cases

Inheritance is acceptable when it models real substitutability or framework requirements.

Examples:

```csharp
public sealed class ApplicationRuleException : Exception
{
    public ApplicationRuleException(string message) : base(message) { }
}
```

```csharp
public abstract class NotificationSender
{
    public abstract Task SendAsync(CancellationToken cancellationToken);
}

public sealed class EmailNotificationSender : NotificationSender
{
    public override Task SendAsync(CancellationToken cancellationToken)
    {
        return Task.CompletedTask;
    }
}
```

The second example is acceptable only when callers truly need substitutable notification senders. Prefer an interface or composition when that is simpler.
