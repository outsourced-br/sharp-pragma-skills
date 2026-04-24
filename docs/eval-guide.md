# Eval guide

The current evals are manual scenario evals. The runner scripts print scenarios and can optionally write manual pass/fail results.

They do not automatically execute skills against a real repository. Do not claim automated pass/fail quality unless a separate harness is added.

## Run scenarios

```bash
bash scripts/run-evals.sh
```

The shell script requires Python 3 for JSON parsing. The PowerShell script is self-contained.

PowerShell:

```powershell
pwsh ./scripts/run-evals.ps1
```

## Manual result recording

Shell:

```bash
bash scripts/run-evals.sh --record
```

PowerShell:

```powershell
pwsh ./scripts/run-evals.ps1 -Record
```

Results are written to `evals/results.jsonl`.

## Eval expectations

Each eval should test either:

- a true positive finding,
- a false-positive guardrail,
- a routing consistency rule,
- an example hygiene rule,
- or an evidence requirement.

Each scenario must include `id`, `title`, `prompt`, `expected`, and `type`. The prompt should be concrete enough for a human or future automated harness to run the scenario without reconstructing intent from the title.
