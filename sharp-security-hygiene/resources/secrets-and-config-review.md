# Secrets and config review

Critical findings:

- committed credentials,
- tokens in config files,
- production connection strings,
- private keys,
- secrets printed in logs,
- insecure sample config likely to be copied to production.

Recommend environment variables, secret stores, local user secrets, or CI secret mechanisms depending on context.
