# Review style guide

The tone of the final review report must be professional, direct, and actionable.

## Tone & Formatting Rules

- **Be direct and evidence-based**: State what is wrong, why it matters, and how to fix it. Do not use passive voice.
- **Separate must-fix from consider-later**: Clearly distinguish between Critical/Major issues and Minor/Informational notes.
- **Avoid praise filler**: Do not prefix findings with "Great job on X, but...". This is a technical audit, keep it concise.
- **Do not bury critical findings**: Put the highest impact findings at the top of the report.
- **Do not invent facts**: Only cite dependencies, patterns, or files that actually exist in the provided context.
- **Use neutral architecture language**: Refer to "Application layer", "Infrastructure", or "Core logic" rather than forcing specific paradigms like "DDD Aggregates" unless the project is already using them.

## False-Positive Guardrail

- **Over-Reporting**: If a codebase is clean and structurally sound, do not invent Minor findings just to populate the report. It is perfectly acceptable (and desirable) for a review to state "No major structural issues found. Architecture is proportionate to scope."

## Example Tone

### Bad (Too conversational and speculative)
> "Hey there! I noticed you have some repositories. It might be cool to extract some interfaces for them, just in case you want to swap out SQL for Mongo later."

### Good (Direct and evidence-based)
> "**Dependency Inversion**: `OrderService` directly instantiates `SqlOrderRepository`. This prevents unit testing `OrderService` in isolation. **Recommendation**: Extract `IOrderRepository` and inject it via the constructor."