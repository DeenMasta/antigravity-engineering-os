---
trigger: always_on
---

# Security Rules

## Purpose

Security is a default engineering requirement.

Security decisions must be considered during architecture, implementation, testing, deployment, and maintenance.

Do not treat security as a final checklist applied only before release.

---

## 1. Security by Default

Prefer secure behavior by default.

Assume:

* user input is untrusted
* external APIs can fail or behave unexpectedly
* clients can be manipulated
* authorization can be bypassed if enforced only in the UI
* dependencies can contain vulnerabilities
* credentials can leak
* production systems will eventually encounter unexpected inputs

---

## 2. Authentication vs Authorization

Keep authentication and authorization separate.

Authentication determines:

> Who is the user?

Authorization determines:

> What is the user allowed to do?

Never rely exclusively on frontend UI restrictions for authorization.

Authorization must be enforced at the appropriate trusted server/backend boundary.

---

## 3. Least Privilege

Grant only the permissions required for a user, service, process, or component to perform its intended function.

Avoid:

* administrator access by default
* overly broad database permissions
* unnecessary API permissions
* exposing internal operations to public clients

---

## 4. Input Validation

Validate untrusted input at trusted boundaries.

Consider:

* type
* format
* length
* allowed values
* ranges
* encoding
* file type
* file size
* nested object structure

Validation should be appropriate to the business requirement.

Do not assume client-side validation is sufficient.

---

## 5. Output Handling

Handle output appropriately for its destination.

Consider:

* HTML escaping
* JSON serialization
* URL encoding
* SQL parameterization
* command execution boundaries
* template rendering

Never interpolate untrusted data into sensitive execution contexts without appropriate protection.

---

## 6. Database Security

Prefer parameterized queries and framework-supported safe query mechanisms.

Prevent:

* SQL injection
* unauthorized access
* accidental data exposure
* unsafe mass assignment
* privilege escalation

Use database constraints where important for data integrity.

Sensitive database operations should be explicitly authorized.

---

## 7. Authentication Security

When implementing authentication:

Consider:

* secure password storage
* session security
* token protection
* expiration
* refresh behavior
* logout/invalidation
* brute-force protection
* account enumeration risks
* multi-factor authentication when required

Never store plaintext passwords.

Never expose authentication secrets in client-side code.

---

## 8. Authorization Security

For protected actions:

1. Authenticate the request.
2. Determine the caller's identity.
3. Verify authorization for the specific resource/action.
4. Perform the operation only after authorization succeeds.

Do not rely on:

* hidden buttons
* disabled UI
* client-side role checks
* obscured routes

as the primary authorization mechanism.

---

## 9. Session and Token Security

Protect session identifiers and tokens.

Consider:

* secure cookie settings
* HttpOnly
* SameSite
* HTTPS
* token expiration
* rotation
* revocation
* storage location

Do not expose tokens unnecessarily to JavaScript or third parties.

---

## 10. Secrets

Never commit or hardcode:

* passwords
* API keys
* access tokens
* private keys
* signing secrets
* database credentials
* production credentials

Use environment variables or appropriate secret-management systems.

Before committing code, verify that secrets are not accidentally included.

---

## 11. Environment Separation

Keep development, staging, and production credentials and configuration separate.

Never copy production secrets into local development files unless there is a documented and secure reason.

Avoid using production data for development or tests.

---

## 12. API Security

For APIs:

* authenticate protected endpoints
* authorize actions
* validate input
* limit exposed data
* use appropriate HTTP methods
* handle errors safely
* implement rate limiting where appropriate
* enforce size limits where appropriate
* avoid leaking stack traces
* use secure transport

Do not expose internal database structures unnecessarily.

---

## 13. Error Messages

User-facing errors should be useful without revealing sensitive internals.

Do not expose:

* stack traces
* SQL queries
* internal filesystem paths
* secrets
* tokens
* private service details
* sensitive identifiers

Detailed diagnostic information should go to controlled logs where appropriate.

---

## 14. File Uploads

Treat uploaded files as untrusted.

Consider:

* allowed file types
* file size limits
* content validation
* filename handling
* storage location
* execution prevention
* malware scanning where justified
* authorization
* access control
* path traversal protection

Do not trust file extensions alone.

---

## 15. Dependency Security

Before adding or significantly upgrading a dependency:

Consider:

* maintenance status
* known vulnerabilities
* package provenance
* version compatibility
* permissions/capabilities
* license implications where relevant
* runtime/bundle impact

Run the project's dependency security tooling where available.

Do not disable security tooling merely to remove warnings without investigation.

---

## 16. Frontend Security

For browser applications, consider:

* XSS
* CSRF
* clickjacking
* unsafe third-party scripts
* token exposure
* insecure local storage
* content security policy
* dependency vulnerabilities
* unsafe HTML rendering

Avoid unsafe HTML injection unless there is a deliberate, validated use case.

---

## 17. Backend Security

For server-side systems, consider:

* request validation
* authentication
* authorization
* mass assignment
* SQL injection
* command injection
* SSRF
* path traversal
* insecure deserialization
* unsafe file access
* rate limiting
* resource exhaustion

Sensitive operations must be protected by appropriate authorization.

---

## 18. Mobile Security

For Flutter/mobile applications, consider:

* secure credential storage
* token handling
* certificate/network security where appropriate
* local sensitive data
* logs
* deep links
* permission handling
* insecure storage
* backend authorization

Never assume mobile code or configuration is secret simply because it is distributed through an app store.

---

## 19. External Services

When integrating third-party services:

* authenticate securely
* validate external responses
* use timeouts
* handle failures
* protect credentials
* limit permissions
* log safely
* consider provider compromise or unexpected responses

Treat third-party responses as untrusted data unless explicitly validated.

---

## 20. Logging

Logs must help diagnose problems without becoming a source of data leakage.

Never log sensitive values such as:

* passwords
* API keys
* session tokens
* access tokens
* private keys
* full payment credentials
* highly sensitive personal data

Use identifiers that allow diagnosis without exposing secrets.

---

## 21. Personal and Sensitive Data

Collect and retain only information required for the product.

Consider:

* data minimization
* access control
* encryption where appropriate
* retention
* deletion
* auditability
* privacy requirements

Do not expose personal information through logs, APIs, browser storage, or error messages unnecessarily.

---

## 22. Transport Security

Sensitive communications should use secure transport.

Production systems should use HTTPS/TLS where applicable.

Do not send credentials or sensitive data over insecure transport.

---

## 23. Rate Limiting and Abuse Protection

Consider rate limiting for:

* authentication
* password reset
* public APIs
* expensive operations
* file uploads
* AI endpoints
* resource-intensive requests

The appropriate strategy depends on the application and threat model.

---

## 24. AI Security

For applications using OpenAI, Gemini, agents, tools, or MCP:

Consider:

* prompt injection
* indirect prompt injection
* tool authorization
* excessive permissions
* secret exposure
* data exfiltration
* untrusted tool output
* unsafe code execution
* cross-user data leakage
* model-generated destructive actions

AI agents must not receive broad permissions merely because they are convenient.

High-impact actions should require appropriate authorization or user confirmation.

---

## 25. Infrastructure Security

For VPS, Docker, Cloudflare, CI/CD, and deployment systems:

Consider:

* secret management
* SSH security
* firewall configuration
* least privilege
* exposed ports
* container isolation
* dependency updates
* TLS
* DNS security
* access control
* backups
* monitoring
* deployment credentials

Do not expose administrative services publicly without justification and protection.

---

## 26. Database Backups

For important production databases:

* backups should exist
* backup security should be considered
* access to backups should be restricted
* restoration should be tested when appropriate

A backup that has never been tested may not be a reliable recovery mechanism.

---

## 27. Security Testing

Security-sensitive changes should include appropriate testing.

Verify both:

```text id="f1z0dk"
AUTHORIZED
→ expected operation succeeds

UNAUTHORIZED
→ operation is denied
```

Where relevant, test:

* authentication failures
* authorization failures
* invalid input
* malformed requests
* token/session behavior
* rate limits
* file restrictions
* sensitive data exposure

---

## 28. Security Review Triggers

Perform an explicit security review when a change involves:

* authentication
* authorization
* roles/permissions
* payments
* personal data
* file uploads
* external integrations
* secrets
* public APIs
* database access
* AI agents/tools
* infrastructure
* production configuration

---

## 29. Vulnerability Response

If a vulnerability is discovered:

1. Assess impact.
2. Identify affected components.
3. Determine whether exploitation is possible.
4. Contain the risk when necessary.
5. Fix the root cause.
6. Add regression/security tests where appropriate.
7. Update dependencies where necessary.
8. Verify the fix.
9. Document the result.

Do not hide security failures to make a release appear successful.

---

## 30. Security Approval Gate

Explicit user approval is required before making major security-sensitive changes such as:

* authentication redesign
* authorization redesign
* production secret changes
* firewall/network changes
* major infrastructure exposure
* disabling important security controls
* changing access boundaries
* destructive security-related migrations

Explain the security impact before requesting approval.

---

## 31. Security Completion Standard

A security-sensitive feature is not complete until:

* authorization is enforced appropriately
* input is validated
* secrets are protected
* sensitive errors are controlled
* relevant security tests pass
* dependencies are checked where appropriate
* important attack paths have been considered
* no known critical security issue remains

---

## Core Security Principle

**Never trust the client.
Minimize permissions.
Protect secrets.
Validate boundaries.
Fail safely.
Verify authorization.
Treat external input as untrusted.**
