# SharpPragma Skills

SharpPragma Skills is a pragmatic .NET review skill pack for agentic development with Codex, Antigravity, Claude Code, Gemini, and similar tools.

The pack focuses on Clean Architecture where useful, clean code, SOLID, DRY, YAGNI, KISS, repository hygiene, build conventions, NuGet dependency health, analyzer policy, testing, security hygiene, performance review, and allocation review.

It is intentionally **DDD-neutral**. It does not prescribe aggregates, repositories, domain events, shared kernels, or DDD project naming. Existing repositories may use names such as `Domain`, but these skills must not introduce DDD vocabulary or structure merely because the codebase is being reviewed.

## Package version

Current package version: **3.0.0**.

Individual skills may keep their own internal versions, but the package-level version is the source of truth for distribution.

## Skills

| Order | Skill | Purpose |
|---:|---|---|
| 0 | `sharp-full-solution-review` | Optional orchestrator that runs the review lenses below in order. |
| 1 | `sharp-solution-audit` | Solution audit. |
| 2 | `sharp-repo-structure` | Repository structure review. |
| 3 | `sharp-build-conventions` | Build conventions review. |
| 4 | `sharp-nuget-dependency-review` | NuGet and dependency review. |
| 5 | `sharp-analyzer-policy-review` | Analyzer policy review. |
| 6 | `sharp-architecture-pragmatic` | Pragmatic architecture review. |
| 7 | `sharp-code-quality-review` | Code quality review. |
| 8 | `sharp-design-principles-review` | Design principles review. |
| 9 | `sharp-solid-deep-review` | SOLID deep review. |
| 10 | `sharp-composition-over-inheritance` | Composition over inheritance review. |
| 11 | `sharp-performance-review` | Performance review. |
| 12 | `sharp-allocation-review` | Allocation review. |
| 13 | `sharp-test-review` | Test review. |
| 14 | `sharp-security-hygiene` | Security hygiene review. |
| 15 | `sharp-code-review-reporting` | Code review reporting. |


## Routing model

There is one safe routing model:

1. Start with `sharp-full-solution-review` when doing a broad review.
2. The orchestrator calls review lenses in a directed, acyclic workflow.
3. Companion skills are **non-recursive references**, not automatic routing instructions.
4. Each skill may read upstream findings and hand off downstream findings, but it must not loop backward or re-run unrelated skills.

See:

- `docs/review-workflow.md`
- `docs/companion-skills-graph.md`
- `docs/shared-guardrails.md`

## Default review command for agents

```text
Use sharp-full-solution-review. Review the repository using the workflow in docs/review-workflow.md. Produce findings using docs/severity-and-reporting-model.md. Do not introduce DDD terminology. Do not recommend performance or allocation rewrites without evidence.
```

## Installation

The easiest way to install all skills for Gemini and Claude Code is via `npx`:

```bash
npx @outsourced-br/sharp-pragma-skills
```

See `docs/installing-skills.md` for alternative manual installation scripts.

Codex and other frontmatter-based loaders can consume the repository root `sharp-*` folders directly or copy them into their configured skills directory.

Codex:

```bash
bash scripts/install-codex-skills.sh
```

PowerShell:

```powershell
pwsh ./scripts/install-codex-skills.ps1
```

Gemini:

```bash
bash scripts/install-gemini-skills.sh
```

PowerShell:

```powershell
pwsh ./scripts/install-gemini-skills.ps1 -Copy
```

Claude Code:

```bash
bash scripts/install-claude-skills.sh
```

PowerShell:

```powershell
pwsh ./scripts/install-claude-skills.ps1 -Copy
```

Eval runner:

```bash
bash scripts/run-evals.sh
```

PowerShell:

```powershell
pwsh ./scripts/run-evals.ps1
```

## Operating principles

- Prefer simple corrections over architectural theatre.
- Treat unsupported frameworks, vulnerable dependencies, leaking secrets, and broken test/build flows as serious.
- Treat style disagreements and speculative abstractions as lower severity unless they create real delivery risk.
- Never prescribe interfaces, layers, inheritance, analyzers, caching, `Span<T>`, `ArrayPool<T>`, `ValueTask`, or pooling without a concrete reason.
- When evidence is missing, ask for evidence or produce a safe measurement plan rather than guessing.

## License and citation

SharpPragma Skills is licensed under the GNU Affero General Public License v3.0 only. See `LICENSE`.

Citation metadata is available in `CITATION.cff`.
