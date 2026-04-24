# KISS, DRY, YAGNI, and Tell Don't Ask heuristics

## KISS

Simpler code wins when it preserves behavior and intent.

## DRY

Duplication is not automatically bad. Remove duplication when the repeated code represents the same reason to change. Keep duplication when it represents different concepts that merely look similar.

## YAGNI

Do not build extension points for imagined futures.

## Tell Don't Ask

Prefer moving behavior near the data it needs when this reduces branching and improves invariants. Do not force method movement if it hides straightforward workflow code.
