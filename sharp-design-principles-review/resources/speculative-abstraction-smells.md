# Speculative abstraction smells

Smells:

- `IThingManagerFactoryProvider` with one implementation.
- Plugin systems with no plugins.
- Event buses introduced only to call code in the same process without decoupling value.
- Generic base classes that make common cases harder.
- Extension methods hiding dependencies.

Neutral eventing example when eventing is justified:

```csharp
public interface IApplicationMessageBus
{
    Task PublishAsync<TMessage>(TMessage message, CancellationToken cancellationToken);
}
```

Do not introduce eventing merely to avoid direct method calls.
