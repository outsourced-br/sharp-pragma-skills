# Contributing to SharpPragma Skills

First off, thank you for considering contributing to SharpPragma Skills!

This repository provides opinionated, robust, and pragmatic review skills for AI agents. Our overarching philosophy is DDD-neutral, anti-overengineering, and "evidence before refactor". Any contribution should adhere to these principles.

## Adding or Modifying Skills

When adding a new skill or updating an existing one, please ensure the following:

1. **Pragmatic Guardrails**: Ensure your skill aligns with the existing guardrails in `docs/shared-guardrails.md`. Avoid imposing complex patterns like DDD, Aggregates, or Event Sourcing unless explicitly requested by the user.
2. **Skill Frontmatter**: Every `SKILL.md` must start with YAML frontmatter containing only `name` and `description`. The `name` must match the folder. The `description` must include the primary trigger contexts.
3. **Output Contracts**: Any new output contracts should supplement `docs/severity-and-reporting-model.md`, not replace it. Include at least 400-600 bytes of guidance, skill-specific required fields, false-positive guardrails, and concrete "Bad Output / Good Output" examples.
4. **Evals**: Every skill **must** have an `evals/evals.json` file containing at least 4-6 scenarios. Each scenario must include `id`, `title`, `prompt`, `expected`, and `type`. These scenarios must cover:
   - True-positive findings
   - False-positive resistance (verifying the agent knows when *not* to flag something)
   - Evidence-requirements (verifying the agent requires measurements for performance/allocations)
   - Clean-codebase scenarios (verifying the agent produces zero findings for a well-structured codebase)
5. **Workflow Integration**: If you add a new skill, update `docs/review-workflow.md` and `docs/companion-skills-graph.md` to reflect its place in the orchestrated chain. Ensure it has the proper "Receives context from" and "Hands off to" directives.

## Pull Request Process

1. **Format**: Follow the existing Markdown layout.
2. **Testing**: Run the evaluation scripts (`scripts/run-evals.ps1` or `scripts/run-evals.sh`) to ensure scenarios parse correctly.
3. **Review**: Ensure your changes do not introduce recursive companion links or looping behavior.
4. **Release Metadata**: Changes to licensing, package identity, security process, citation, or public documentation must keep `LICENSE`, `CITATION.cff`, `SECURITY.md`, `CODE_OF_CONDUCT.md`, `SUPPORT.md`, `CONTRIBUTING.md`, and `llms.txt` consistent.

## Evals

To execute evals manually, you can use the cross-platform PowerShell script:
```powershell
./scripts/run-evals.ps1 -Record
```
This will append the results to `evals/results.jsonl` without truncating historical data.
