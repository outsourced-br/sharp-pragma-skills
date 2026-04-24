# Central Package Management guide

Central Package Management is useful when many projects share package versions.

## Review points

- `ManagePackageVersionsCentrally` is present once in `Directory.Packages.props` or another deliberate central file.
- Package versions are centralized with `PackageVersion`.
- Project files use `PackageReference` without versions.
- Exceptions use version override only with a documented reason.
- Transitive pinning is deliberate, not accidental.
- Test and analyzer packages use `PrivateAssets="all"` when appropriate.

Do not introduce Central Package Management into a tiny single-project repo unless it reduces actual friction.
