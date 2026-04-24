# Lock file policy

Package lock files help reproducibility, especially for applications and CI.

## Recommend lock files when

- the repo deploys applications or services,
- reproducible CI/release builds matter,
- dependency drift has caused incidents,
- or package source mapping/audit policy is being hardened.

## Be careful when

- the repo is a reusable library consumed by many applications,
- multi-targeting creates noisy lock churn,
- or developers cannot reliably update locks.

Use locked restore in CI only after lock files are committed and update workflow is clear.
