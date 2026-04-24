# Findings handoff protocol

Every skill should hand off only findings that downstream skills need.

## Handoff shape

```text
Finding ID:
Downstream skill:
Why downstream review is needed:
Evidence already collected:
Open questions:
```

## No recursive loops

A downstream skill may cite upstream evidence but must not route backward. If an upstream correction is needed, record it as a finding and let reporting deduplicate it.
