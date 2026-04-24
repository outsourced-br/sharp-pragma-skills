param(
    [switch]$Copy,
    [string]$Target = ".gemini/skills"
)

$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force -Path $Target | Out-Null

Get-ChildItem -Directory -Filter "sharp-*" | ForEach-Object {
    $dest = Join-Path $Target $_.Name
    if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }

    if ($Copy) {
        Copy-Item -Recurse $_.FullName $dest
    } else {
        try {
            New-Item -ItemType SymbolicLink -Path $dest -Target $_.FullName | Out-Null
        } catch {
            Write-Warning "Symlink failed for $($_.Name). Falling back to copy. Use -Copy to avoid this warning."
            Copy-Item -Recurse $_.FullName $dest
        }
    }
    Write-Host "Installed $($_.Name) -> $dest"
}
