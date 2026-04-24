# Async and resource management guide

## Async

- Do not block on async with `.Result` or `.Wait()` in request/worker paths.
- Propagate `CancellationToken` to IO calls.
- Avoid `async void` except event handlers.
- Avoid fire-and-forget unless errors and lifecycle are handled.

## Disposal

```csharp
await using var stream = fileSystem.OpenWrite(path);
await writer.WriteAsync(payload, cancellationToken);
```

Dispose streams, database contexts, timers, channels, and clients according to ownership. Do not dispose injected singleton clients accidentally.
