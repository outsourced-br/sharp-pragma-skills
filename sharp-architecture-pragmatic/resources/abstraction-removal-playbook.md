# Abstraction removal playbook

Use when an abstraction has one implementation, no likely replacement, no test seam value, and high cognitive cost.

1. Identify callers and implementation.
2. Inline or collapse the abstraction.
3. Preserve tests around behavior.
4. Remove unused registrations.
5. Re-run build/tests.

Do not remove abstractions that protect external IO, cross-process boundaries, or unstable vendor APIs.
