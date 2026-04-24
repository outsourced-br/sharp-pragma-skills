# Installing skills

## NPX Installation (Recommended)

The easiest and fastest way to install the SharpPragma skills is using `npx`. This works cross-platform (Windows, macOS, Linux) without needing to clone the repository. Use `npx` directly; do not install this package globally with `npm install -g`.

```bash
npx @outsourced-br/sharp-pragma-skills@latest install
```

This command downloads the package and copies the `sharp-*` folders into local skill directories under the current working directory:

- `.agents/skills/`
- `.codex/skills/`
- `.gemini/skills/`
- `.claude/skills/`

### Installing into a specific repository or folder

To install the skills into a specific project repository or folder from anywhere, pass the folder after `install`:

```bash
npx @outsourced-br/sharp-pragma-skills@latest install C:/git/draftbench
```

You can also use the explicit `--repo` form:

```bash
npx @outsourced-br/sharp-pragma-skills@latest --repo C:/git/draftbench
```

`--local` is retained as an alias for installing into the current working directory:

```bash
npx @outsourced-br/sharp-pragma-skills@latest --local
```

### Installing into a custom path

To copy the skills directly into one exact skills directory, use the `--target` flag:

```bash
npx @outsourced-br/sharp-pragma-skills@latest --target C:/git/draftbench/.codex/skills
```

### Installing into your user profile

User-profile installation is explicit:

```bash
npx @outsourced-br/sharp-pragma-skills@latest --profile
```

This copies the `sharp-*` folders into `~/.codex/skills/`, `~/.gemini/skills/`, and `~/.claude/skills/`.

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
