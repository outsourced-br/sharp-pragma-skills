# Migrating from unprefixed skill names

All skills use the `sharp-` prefix. If an older tool references unprefixed names, map them to the prefixed equivalents.

Example:

| Old | New |
|---|---|
| `solution-audit` | `sharp-solution-audit` |
| `build-conventions` | `sharp-build-conventions` |
| `test-review` | `sharp-test-review` |

Do not keep duplicate unprefixed folders in the same skills directory. Duplicate skills increase routing ambiguity.
