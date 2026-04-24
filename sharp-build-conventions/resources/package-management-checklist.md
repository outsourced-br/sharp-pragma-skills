# Package management checklist

- Is Central Package Management used consistently if present?
- Do projects avoid inline versions when `Directory.Packages.props` is active?
- Are analyzer and test infrastructure packages marked with `PrivateAssets="all"` where appropriate?
- Are packages duplicated unnecessarily across projects?
- Are package locks used deliberately for apps/CI reproducibility?
- Are package sources safe and mapped when multiple feeds are configured?
