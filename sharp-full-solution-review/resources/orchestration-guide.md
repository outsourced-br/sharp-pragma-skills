# Orchestration guide

## Full-review algorithm

1. Confirm scope from the user request and available repository contents.
2. Run the fifteen review lenses in `docs/review-workflow.md` order.
3. Pass only relevant upstream findings forward.
4. Do not re-run earlier skills because a downstream skill lists them as context.
5. Deduplicate findings before final reporting.
6. Merge conflicting findings by favoring evidence and project constraints.

## Routing rule

The orchestrator owns sequencing. Other skills own local analysis only.

## Stop conditions

Stop a full review early only when:

- repository contents are unavailable,
- restore/build cannot be inspected and the user asked specifically for build-backed findings,
- safety constraints prevent the requested review,
- or the user scope is narrower than full review.
