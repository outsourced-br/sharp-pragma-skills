# Finding ID and location conventions

Use stable IDs:

| Skill | Prefix |
|---|---|
| solution audit | AUD |
| repo structure | REP |
| build conventions | BLD |
| nuget dependency | NUG |
| analyzer policy | ANZ |
| architecture | ARC |
| code quality | CQ |
| design principles | DES |
| SOLID | SOL |
| composition | COM |
| performance | PERF |
| allocation | ALLOC |
| test | TEST |
| security | SEC |
| reporting | RPT |

*(Note: `RPT` is used for reporting to avoid collision with `REP` which is reserved for repo-structure)*

Location format: `path/to/file.cs:line` when available, otherwise project/folder-level location.
