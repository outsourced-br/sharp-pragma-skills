# Security Policy

## Supported Versions

SharpPragma Skills is distributed as one package. Security fixes are handled on the latest major release line.

| Version | Supported |
|---|---|
| 3.x | Yes |
| < 3.0 | No |

## Reporting a Vulnerability

Report suspected vulnerabilities through GitHub private vulnerability reporting when it is available for this repository.

If private vulnerability reporting is not available, open a minimal public issue that says a private security report is needed, without including exploit details, secrets, private repository names, customer data, or proof-of-concept payloads.

## Scope

Security reports may include:

- unsafe guidance in a skill that could cause credential exposure, insecure defaults, or unsafe production deployment,
- scripts that mishandle paths or generated artifacts,
- documentation that instructs users to publish sensitive data,
- release artifacts that accidentally include private data.

General quality concerns, style disagreements, and speculative model behavior should use normal issues.
