# Project splitting heuristics

Splitting a solution into multiple `.csproj` files should be driven by concrete architectural boundaries, not arbitrary conventions.

## Valid Reasons to Split Projects

Split projects when:
- **Dependencies need isolation**: E.g., stopping the Core domain project from referencing `Microsoft.EntityFrameworkCore`.
- **Deployment units differ**: A background worker needs to be deployed separately from the Web API.
- **Public API boundaries matter**: Creating a shared NuGet package for external consumers.
- **Test boundaries**: A dedicated `.Tests` project ensures test dependencies (like `Moq` or `xUnit`) don't leak into production binaries.

## Invalid Reasons to Split Projects

Do NOT split projects when:
- **"Clean Architecture says so"**: You can achieve Clean Architecture with folders (`/Core`, `/Infrastructure`, `/Api`) within a single `.csproj`.
- **"Every layer needs a project"**: An application with 5 classes does not need 4 projects.
- **"Just in case we reuse it"**: Splitting projects for speculative future reuse is a YAGNI violation.

## False-Positive Guardrail

- **Single-Project Solutions**: Do not flag a single-project Web API as a structural failure if it is small, cohesive, and not suffering from dependency leakage. Recommend namespaces/folders instead of new projects.

## Example

### Bad Output
> "Your solution only has one project. You should split it into Core, Infrastructure, and Web projects."

### Good Output
> "The single-project structure is currently proportionate to the application's size. However, EF Core is referenced globally. To prevent database logic from leaking into your business models, consider moving the domain entities into a separate `Domain.csproj` with no NuGet dependencies."