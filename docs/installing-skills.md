# Installing skills

## Root folders

Each `sharp-*` folder is a complete skill folder with `SKILL.md` YAML frontmatter and optional bundled resources. Tools that support direct skill folders can point at the repository root or copy the `sharp-*` folders into their own skills directory.

## Codex skills directory

The Codex installers copy the `sharp-*` folders into `$CODEX_HOME/skills` when `CODEX_HOME` is set. When `CODEX_HOME` is not set, they use `~/.codex/skills`.

Portable shell, copy mode:

```bash
bash scripts/install-codex-skills.sh
```

Portable shell, symlink mode:

```bash
bash scripts/install-codex-skills.sh --symlink
```

PowerShell, copy mode:

```powershell
pwsh ./scripts/install-codex-skills.ps1
```

PowerShell, symlink mode:

```powershell
pwsh ./scripts/install-codex-skills.ps1 -Symlink
```

Use `--target` or `-Target` to install into a different skills directory.

## Gemini-style skills directory

The scripts copy or symlink the `sharp-*` folders into `.gemini/skills`.

Portable shell:

```bash
bash scripts/install-gemini-skills.sh
```

PowerShell, copy mode:

```powershell
pwsh ./scripts/install-gemini-skills.ps1 -Copy
```

PowerShell, symlink mode:

```powershell
pwsh ./scripts/install-gemini-skills.ps1
```

On Windows, symlink mode may require Developer Mode or elevation. Use `-Copy` when symlink creation is blocked.

## Claude Code skills directory

The scripts copy or symlink the `sharp-*` folders into `.claude/skills`.

Portable shell:

```bash
bash scripts/install-claude-skills.sh
```

PowerShell, copy mode:

```powershell
pwsh ./scripts/install-claude-skills.ps1 -Copy
```

PowerShell, symlink mode:

```powershell
pwsh ./scripts/install-claude-skills.ps1
```

On Windows, symlink mode may require Developer Mode or elevation. Use `-Copy` when symlink creation is blocked.

## Custom target directory

The installer scripts can target another skills directory.

Portable shell:

```bash
bash scripts/install-codex-skills.sh --copy --target "$HOME/.codex/skills"
```

PowerShell:

```powershell
pwsh ./scripts/install-codex-skills.ps1 -Target "$env:USERPROFILE\.codex\skills"
```

## Why docs say `bash scripts/...`

ZIP extraction may not preserve executable bits on every platform. Using `bash scripts/run-evals.sh`, `bash scripts/install-codex-skills.sh`, `bash scripts/install-gemini-skills.sh`, and `bash scripts/install-claude-skills.sh` works even when the file is not executable.
