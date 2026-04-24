# Data versus fixtures guidance

- `fixtures/`: deterministic test inputs.
- `samples/`: illustrative examples for users or docs.
- `data/`: real or operational data only when intended and safe.
- `artifacts/`: generated files, logs, reports, benchmark outputs, coverage, test results.

Do not commit secrets, production exports, private customer data, or bulky generated artifacts.
