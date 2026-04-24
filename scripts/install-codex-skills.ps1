param(
    [switch]$Symlink,
    [string]$Target
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($Target)) {
    if (-not [string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
        $Target = Join-Path $env:CODEX_HOME "skills"
    } else {
        $Target = Join-Path $HOME ".codex/skills"
    }
}

$targetPath = Resolve-Path -LiteralPath (New-Item -ItemType Directory -Force -Path $Target).FullName
$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")).Path

Get-ChildItem -LiteralPath $repoRoot -Directory -Filter "sharp-*" | Sort-Object Name | ForEach-Object {
    $dest = Join-Path $targetPath $_.Name
    if (Test-Path -LiteralPath $dest) {
        Remove-Item -LiteralPath $dest -Recurse -Force
    }

    if ($Symlink) {
        try {
            New-Item -ItemType SymbolicLink -Path $dest -Target $_.FullName | Out-Null
        } catch {
            Write-Warning "Symlink failed for $($_.Name). Falling back to copy."
            Copy-Item -LiteralPath $_.FullName -Destination $dest -Recurse
        }
    } else {
        Copy-Item -LiteralPath $_.FullName -Destination $dest -Recurse
    }

    Write-Host "Installed $($_.Name) -> $dest"
}
