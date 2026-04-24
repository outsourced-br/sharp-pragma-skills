# Auth patterns checklist

Review only when the repository has auth or exposed APIs.

- Authentication and authorization are separate.
- Admin or privileged paths require explicit authorization.
- Tokens/secrets are not logged.
- Development bypasses cannot run in production.
- CORS defaults are not overly broad for production.
- Input validation protects external boundaries.
