# Security review output contract

Every security finding must be evaluated through the lens of actual exposure and exploitability.

This contract supplements `docs/severity-and-reporting-model.md`. Every emitted finding must still include the shared fields: `ID`, `Severity`, `Category`, `Location`, `Evidence`, `Impact`, `Recommendation`, `Confidence`, `Effort`, `Owner`, and optional `Companion handoff`.

## Skill-specific required fields

- **Vulnerability**: The specific issue (e.g., hardcoded secret, lack of CSRF, outdated package).
- **Location**: File, line number, or configuration setting.
- **Exposure Tier**: Choose one of the following:
  - `Local-only`: Only affects developer machines.
  - `CI/CD Supply Chain`: Affects build servers or deployment pipelines.
  - `Internal Production`: Affects services only accessible via VPN or internal network.
  - `Public Production`: Affects internet-facing APIs or web apps.
- **Impact**: What an attacker could achieve.
- **Remediation**: Exact steps to mitigate the issue.

## False-Positive Guardrail

- Severity depends heavily on the **Exposure Tier**. A hardcoded dummy password in a unit test project (`Local-only`) is Informational or Minor. A hardcoded production database password in an API (`Public Production`) is Critical. Do not escalate test-fixture secrets to Critical.

## Example

### Bad Output
> "Hardcoded password found. This is a critical security vulnerability."

### Good Output
> **Vulnerability**: Hardcoded API Key in configuration logic.
> **Location**: `Program.cs:42`
> **Exposure Tier**: Public Production
> **Impact**: Anyone with read access to the repository (or decomcompiled binaries) can extract the Stripe API key and execute financial transactions.
> **Remediation**: Remove the hardcoded key. Read it from environment variables or a secure vault (e.g., Azure Key Vault, AWS Key Management Service) via `builder.Configuration`. Rotate the exposed Stripe key immediately.
