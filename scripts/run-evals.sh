#!/usr/bin/env bash
set -euo pipefail

RECORD="false"
if [ "${1:-}" = "--record" ]; then RECORD="true"; fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required to parse eval JSON." >&2
  exit 2
fi

if [ "$RECORD" = "true" ]; then
  mkdir -p evals
  RESULTS="evals/results.jsonl"
  # Note: intentionally not truncating the file to preserve history
fi

for file in sharp-*/evals/evals.json; do
  [ -f "$file" ] || continue

  SKILL=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1], encoding="utf-8")).get("skill", ""))' "$file")
  if [ -z "$SKILL" ]; then
    echo "Missing skill in $file" >&2
    exit 1
  fi

  echo -e "\n== $SKILL =="

  python3 - "$file" <<'PY' | while IFS=$'\t' read -r ID TITLE PROMPT EXPECTED TYPE; do
import json
import sys

path = sys.argv[1]
with open(path, encoding="utf-8") as handle:
    data = json.load(handle)

scenarios = data.get("scenarios") or []
if not scenarios:
    raise SystemExit(f"Missing scenarios in {path}")

for scenario in scenarios:
    missing = [key for key in ("id", "title", "prompt", "expected", "type") if not str(scenario.get(key, "")).strip()]
    if missing:
        raise SystemExit(f"Missing scenario properties {', '.join(missing)} in {path}")

    values = [scenario["id"], scenario["title"], scenario["prompt"], scenario["expected"], scenario["type"]]
    print("\t".join(str(value).replace("\t", " ").replace("\n", " ") for value in values))
PY
    echo "- $ID: $TITLE"
    echo "  Prompt: $PROMPT"
    echo "  Expected: $EXPECTED"

    if [ "$RECORD" = "true" ]; then
      read -p "  Result (pass/fail/skip): " result
      result=${result:-skip}
      read -p "  Note: " note

      timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

      python3 - "$RESULTS" "$timestamp" "$SKILL" "$ID" "$result" "$note" <<'PY'
import json
import sys

path, timestamp, skill, scenario, result, note = sys.argv[1:]
record = {
    "timestamp": timestamp,
    "skill": skill,
    "scenario": scenario,
    "result": result,
    "note": note,
}

with open(path, "a", encoding="utf-8") as handle:
    handle.write(json.dumps(record, separators=(",", ":")) + "\n")
PY
    fi
  done
done
