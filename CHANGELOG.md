# Changelog

## 3.0.6 - 2026-04-28

### Changed

- Included docs, scripts, version metadata, and release metadata in the npm package so README references resolve from the published package.
- Updated release policy language to describe npm package distribution instead of ZIP-only distribution.
- Normalized npm package metadata by declaring the CLI `bin` entry explicitly and using the normalized Git repository URL.

## 3.0.4 - 2026-04-28

### Changed

- Changed the NPX installer to install into the current repository/folder by default instead of the user profile.
- Repository/folder installs now copy skills into `.agents/skills`, `.codex/skills`, `.gemini/skills`, and `.claude/skills`.

### Added

- Added `install <repo-or-folder>` and `--repo <repo-or-folder>` support for installing into a specific repository from any working directory.
- Added explicit `--profile` mode for user-profile installs.

## 3.0.0 - 2026-04-24

### Rebuilt

- Rebuilt the package as a complete DDD-neutral .NET review skill pack.
- Harmonized README, workflow docs, companion graph, scripts, skill headers, eval docs, and changelog.
- Clarified that `sharp-full-solution-review` is the optional orchestrator and the remaining fifteen entries are review lenses.
- Replaced cyclic peer-to-peer routing with a directed workflow plus non-recursive companion references.

### Added

- `sharp-code-quality-review`
- `sharp-performance-review`
- `sharp-allocation-review`
- `sharp-nuget-dependency-review`
- `sharp-analyzer-policy-review`
- NuGet audit policy guidance covering `NuGetAudit`, `NuGetAuditMode`, `NuGetAuditLevel`, and `AuditSources`.
- Package source mapping guidance.
- CI reproducibility guidance.
- Release policy documentation.
- Manual eval result recording.

### Changed

- .NET policy now treats .NET 8 and .NET 9 as supported but near end-of-support for production planning, with .NET 10 LTS preferred for new production apps unless constraints exist.
- C# feature absence is debt for .NET 8 only when a missing high-value feature increases maintainability risk. Lack of newest syntax is not debt by itself for .NET 9 or .NET 10.
- Analyzer policy now distinguishes code-quality, security, performance, test, and migration profiles.
- Allocation review now has execution mode and no-tool fallback mode for BenchmarkDotNet evidence.

### Fixed

- Removed DDD-prescriptive examples.
- Removed reverse dependencies and cyclic companion routing.
- Fixed examples to be valid C# or clearly marked as pseudocode.
- Fixed eval runner documentation to reflect manual scenario execution and optional manual result capture.
- Made shell scripts portable by documenting `bash scripts/...` and avoiding GNU-only `find -printf`.
