# Anti-overengineering heuristics

Prefer simple code until complexity is earned.

Do not recommend:

- repository abstractions over every ORM access by default,
- mediator pipelines for tiny apps by default,
- one project per folder by default,
- command/query objects for every method by default,
- plugin architectures without real plugin needs.

Recommend simplification when indirection hides more than it protects.
