# Modernization decision guide

Modernization must be tied to risk or payoff.

## Recommend modernization when

- target frameworks are unsupported or near end-of-support for production,
- package or analyzer tooling is blocked by old SDKs,
- CI cannot reproduce local builds,
- language/runtime upgrades remove real maintainability or security risk,
- or vendors require a supported target.

## Avoid modernization churn when

- code is stable, supported, and not exposed,
- migration risk exceeds value,
- the change exists only to use newer syntax,
- or the user asked for a narrower review.
