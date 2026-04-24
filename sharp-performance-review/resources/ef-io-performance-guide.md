# EF and IO performance guide

Review:

- N+1 queries,
- missing `AsNoTracking` for read-only queries where appropriate,
- loading too many columns/rows,
- unbounded pagination,
- chatty external API calls,
- synchronous file/network calls in async paths,
- repeated connection/client creation.

Do not recommend ORM replacement without evidence.
