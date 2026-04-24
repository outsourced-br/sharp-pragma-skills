# Composition migration patterns

## Extract collaborator

Move shared behavior into a small service used by concrete classes.

```csharp
public sealed class RetryPolicy
{
    public async Task<T> ExecuteAsync<T>(Func<CancellationToken, Task<T>> action, CancellationToken ct)
    {
        return await action(ct);
    }
}
```

Do not extract collaborators unless this reduces coupling or duplication with the same reason to change.
