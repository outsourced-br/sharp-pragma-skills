# Release policy

SharpPragma has one package-level version stored in `VERSION`. Individual skills may show internal version notes, but releases are distributed as one npm package and repository archive.

## Versioning

- Major: routing model changes, finding schema changes, large skill additions/removals.
- Minor: new resources, new evals, new guidance, non-breaking skill additions.
- Patch: typo fixes, examples, small consistency corrections.

## Release checklist

- `README.md` skill list matches actual `sharp-*` folders.
- Every `SKILL.md` has YAML frontmatter with `name` matching the folder and a trigger-focused `description`.
- `docs/review-workflow.md` matches the companion graph and every SKILL.md companion section.
- All `evals/evals.json` files parse and every scenario has `id`, `title`, `prompt`, `expected`, and `type`.
- Skill-specific output contracts supplement, rather than replace, `docs/severity-and-reporting-model.md`.
- Public release metadata exists: `LICENSE`, `CITATION.cff`, `SECURITY.md`, `CODE_OF_CONDUCT.md`, `SUPPORT.md`, `CONTRIBUTING.md`, and `llms.txt`.
- `LICENSE` contains GNU AGPL v3 text and citation metadata declares `AGPL-3.0-only`.
- NPX installation, package metadata, Codex, Gemini, Claude Code, and `.agents/skills` install surfaces are documented and kept in sync with skill folder naming.
- The npm package includes the docs, scripts, release metadata, installer, and `sharp-*` skill folders referenced by `README.md`.
- Shell scripts avoid GNU-only assumptions unless documented.
- No DDD-prescriptive language is introduced.
- Code examples are valid C# or explicitly marked pseudocode.
