param([switch]$Record)

$ErrorActionPreference = "Stop"
if ($Record) {
    New-Item -ItemType Directory -Force -Path "evals" | Out-Null
}

Get-ChildItem -Path . -Filter evals.json -Recurse | Where-Object { $_.FullName -match "sharp-.*[\\/]evals[\\/]evals.json$" } | ForEach-Object {
    $data = Get-Content $_.FullName -Raw | ConvertFrom-Json
    if ([string]::IsNullOrWhiteSpace($data.skill)) {
        throw "Missing skill in $($_.FullName)"
    }
    if (-not $data.scenarios) {
        throw "Missing scenarios in $($_.FullName)"
    }
    Write-Host "`n== $($data.skill) =="
    foreach ($s in $data.scenarios) {
        foreach ($prop in @("id", "title", "prompt", "expected", "type")) {
            if (-not $s.PSObject.Properties.Name.Contains($prop) -or [string]::IsNullOrWhiteSpace([string]$s.$prop)) {
                throw "Missing scenario property '$prop' in $($_.FullName)"
            }
        }
        Write-Host "- $($s.id): $($s.title)"
        Write-Host "  Prompt: $($s.prompt)"
        Write-Host "  Expected: $($s.expected)"
        if ($Record) {
            $result = Read-Host "  Result (pass/fail/skip)"
            if ([string]::IsNullOrWhiteSpace($result)) { $result = "skip" }
            $note = Read-Host "  Note"
            $obj = [ordered]@{
                timestamp = (Get-Date).ToUniversalTime().ToString("o")
                skill = $data.skill
                scenario = $s.id
                result = $result
                note = $note
            }
            ($obj | ConvertTo-Json -Compress) | Add-Content -Path "evals/results.jsonl"
        }
    }
}
