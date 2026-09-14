---
trigger: always_on
---

# Production Readiness Rules

## Purpose

Production readiness is an evidence-based assessment of whether a change or system is sufficiently reliable, secure, tested, maintainable, observable, and operational for its intended environment.

"Production-ready" is a verification result, not a feeling.

---

## 1. Production Readiness Status

Use exactly one final status:

### 🟢 READY

All required checks passed and no known blocking issue remains.

### 🟡 READY WITH WARNINGS

Required checks passed, but non-blocking risks, limitations, or technical debt remain.

### 🔴 NOT READY

One or more required checks failed, a blocking issue remains, or sufficient evidence has not been produced.

---

## 2. Evidence Requirement

Every readiness decision must distinguish between:

* verified
* inferred
* assumed
* not verified
* blocked

Never mark an unperformed check as passed.

Do not claim production readiness based solely on:

* successful compilation
* successful startup
* passing unit tests
* visual appearance
* developer confidence

Production readiness requires an appropriate combination of evidence.

---

## 3. Scope

The readiness assessment applies to the actual change being evaluated.

For a small UI change, do not demand irrelevant infrastructure checks.

For a major production system change, broader checks are required.

The Project Profile determines the expected quality level and required checks.

---

## 4. Architecture

Verify:

* implementation follows the approved architecture
* responsibilities are appropriately separated
* dependencies are reasonable
* no unnecessary architecture was introduced
* important risks are understood
* scalability considerations match expected workload
* no unauthorized major architectural change occurred

Status:

```text id="znpzid"
PASS
FAIL
N/A
```

---

## 5. Database

When database changes are involved, verify:

* schema is correct
* relationships are correct
* constraints are appropriate
* indexes are appropriate where required
* migrations work
* rollback implications are understood
* data integrity is preserved
* authorization boundaries are respected
* performance risks are acceptable

Destructive or high-risk migrations require explicit approval.

---

## 6. Backend / API

Verify where applicable:

* validation
* authentication
* authorization
* business logic
* error handling
* API contracts
* response behavior
* edge cases
* transaction behavior
* rate limiting where relevant
* idempotency where relevant

---

## 7. Frontend / UI

For user-facing changes, verify:

* intended UI behavior
* component behavior
* loading states
* empty states
* error states
* success states
* responsive layout
* accessibility
* consistency with the design system
* consistency with the Project UI Profile

UI readiness requires rendered verification, not only source-code inspection.

---

## 8. Browser QA

For meaningful web changes, verify:

* application starts successfully
* target page loads
* user flow works
* relevant interactions work
* console errors are understood
* important network errors are understood
* responsive behavior is checked
* visual result is inspected
* relevant screenshots/evidence exist
* regressions are checked where appropriate

A successful browser page load alone is insufficient.

---

## 9. Mobile QA

For Flutter/mobile applications, verify where relevant:

* application starts
* primary user flow works
* state transitions work
* API interaction works
* loading/error states work
* responsive behavior works
* appropriate unit/widget/integration tests pass
* platform-specific issues are considered

The required level depends on the Project Profile.

---

## 10. Testing

Verify applicable:

```text id="h1ox3t"
Unit Tests
Integration Tests
API Tests
Widget/Component Tests
E2E Tests
Browser Tests
Regression Tests
```

Failures must be investigated.

Do not silently skip failing tests.

---

## 11. Static Checks

Run applicable:

* type checking
* linting
* static analysis
* formatting validation
* build verification

Warnings should be investigated when they indicate real quality or runtime risk.

Do not weaken project rules simply to obtain a clean result.

---

## 12. Security

Verify applicable:

* authentication
* authorization
* input validation
* output handling
* secrets protection
* database safety
* dependency security
* sensitive data handling
* API exposure
* file handling
* rate limiting
* AI/tool permissions
* infrastructure exposure

Critical security problems are blocking issues.

---

## 13. Performance

Assess where performance matters.

Consider:

* frontend bundle size
* unnecessary renders
* network requests
* database queries
* API response time
* memory usage
* large datasets
* page load behavior
* caching
* background processing

Do not claim performance is optimized without evidence where measurement is practical.

---

## 14. Reliability

Verify appropriate handling of:

* dependency failures
* network failures
* invalid input
* database failures
* timeouts
* retries
* duplicate requests
* partial failures
* unavailable services

For critical operations, recovery behavior should be intentional.

---

## 15. Observability

For production systems, verify appropriate:

* logging
* error reporting
* health checks
* metrics
* tracing where justified
* operational diagnostics

The required level depends on system criticality.

---

## 16. Deployment

Before production deployment, verify:

* correct branch/commit
* environment configuration
* secrets/configuration
* build artifacts
* migrations
* deployment steps
* rollback strategy where appropriate
* health checks
* monitoring
* backups where relevant

Production deployment requires explicit user approval.

---

## 17. Documentation

Verify that important operational or architectural knowledge is documented.

Examples:

* setup
* environment requirements
* deployment
* architecture decisions
* migrations
* external services
* operational procedures
* known limitations

Do not create unnecessary documentation solely to satisfy a checklist.

---

## 18. Regression Risk

Evaluate whether the change could affect:

* shared components
* authentication
* authorization
* database models
* APIs
* common services
* infrastructure
* existing user flows

The larger the blast radius, the broader the regression verification should be.

---

## 19. Known Issues

Maintain an explicit list of known unresolved issues.

Each issue should have:

* description
* severity
* impact
* status
* whether it blocks release

Never hide known problems simply to produce a READY result.

---

## 20. Severity

Use:

### Critical

Potential for:

* severe data loss
* severe security vulnerability
* major unauthorized access
* production outage
* destructive corruption

Blocks readiness.

### High

Significant functional, security, reliability, or performance issue.

Normally blocks readiness unless explicitly accepted by the user.

### Medium

Meaningful issue with a workaround or limited impact.

May result in READY WITH WARNINGS.

### Low

Minor quality, polish, or non-critical technical debt.

Normally does not block readiness.

---

## 21. Approval Gate

The following always require explicit approval before production:

* deployment
* production migrations
* infrastructure changes
* DNS changes
* security-boundary changes
* major configuration changes
* destructive operations

The agent may prepare everything required for deployment but must not cross the production approval gate without user authorization.

---

## 22. Final Readiness Checklist

Generate a checklist such as:

```text id="8fnm5p"
ARCHITECTURE
[PASS / FAIL / N/A]

DATABASE
[PASS / FAIL / N/A]

BACKEND/API
[PASS / FAIL / N/A]

FRONTEND/UI
[PASS / FAIL / N/A]

BROWSER QA
[PASS / FAIL / N/A]

MOBILE QA
[PASS / FAIL / N/A]

UNIT TESTS
[PASS / FAIL / N/A]

INTEGRATION TESTS
[PASS / FAIL / N/A]

E2E TESTS
[PASS / FAIL / N/A]

STATIC ANALYSIS
[PASS / FAIL / N/A]

SECURITY
[PASS / FAIL / N/A]

PERFORMANCE
[PASS / FAIL / N/A]

RELIABILITY
[PASS / FAIL / N/A]

OBSERVABILITY
[PASS / FAIL / N/A]

DEPLOYMENT
[PASS / FAIL / N/A]

DOCUMENTATION
[PASS / FAIL / N/A]

REGRESSION
[PASS / FAIL / N/A]
```

---

## 23. Blocking Rules

The final status must be:

### 🔴 NOT READY

when any required check:

* fails
* is not verified
* is blocked
* has a critical unresolved issue
* has an unacceptable high-severity issue

unless the user explicitly changes the release criteria.

---

## 24. Warnings

The final status may be:

### 🟡 READY WITH WARNINGS

when:

* required checks passed
* no critical issue remains
* remaining issues are non-blocking
* limitations are clearly documented

The report must list the warnings.

---

## 25. READY Criteria

The final status may be:

### 🟢 READY

only when:

* required implementation is complete
* approved architecture is respected
* required tests pass
* required browser/UI verification passes
* security requirements pass
* no blocking regression exists
* important errors are handled
* required evidence exists
* known issues are non-blocking
* production approval gates remain respected

---

## 26. Final Report Format

Use this structure:

```text
PRODUCTION READINESS
====================

Status:
🟢 READY
🟡 READY WITH WARNINGS
🔴 NOT READY

Summary:
...

Verified:
...

Warnings:
...

Blocking Issues:
...

Tests:
...

Browser / Visual QA:
...

Security:
...

Performance:
...

Architecture:
...

Database:
...

Deployment Notes:
...

Remaining Actions:
...
```

The report must be concise but sufficiently detailed for the user to understand the decision.

---

## 27. No False Confidence

Never say:

* "looks production-ready"
* "should be fine"
* "probably safe"
* "everything should work"

when the required evidence has not been obtained.

Use factual language:

* "Verified"
* "Not verified"
* "Failed"
* "Blocked"
* "Assumed"
* "Requires approval"

---

## Core Principle

**Production readiness is earned through evidence.**

The agent does not decide that software is ready because it wrote the code.

It earns the READY status through:

**Implementation → Testing → Browser Verification → Security Review → Regression Review → Evidence → Final Assessment**

## Performance Budget Gate

Performance requirements must be defined according to project type, feature risk, and actual user experience.

Do not make unsupported claims such as "fast", "optimized", or "high performance" without evidence.

### Performance Areas

Evaluate applicable areas:

- initial page load;
- Largest Contentful Paint;
- Cumulative Layout Shift;
- Interaction responsiveness;
- JavaScript bundle size;
- image size and loading;
- API response time;
- database query performance;
- memory usage;
- startup time;
- mobile performance.

### Landing and Content Websites

Prioritize:

- fast initial rendering;
- stable layout;
- optimized hero imagery;
- limited client-side JavaScript;
- responsive image loading;
- sensible animation usage.

Performance should be checked in a browser where practical.

### Business Systems

Evaluate:

- API response time;
- database queries;
- table/list rendering;
- form responsiveness;
- large dataset behavior;
- authentication flow latency.

### Mobile Applications

Evaluate:

- application startup;
- screen transition responsiveness;
- rendering performance;
- memory usage;
- network behavior;
- offline/loading states where applicable.

### Budget Principle

Use the smallest practical performance budget that protects the important user experience.

A performance budget may be:

- measured;
- estimated;
- project-defined;
- not yet established.

Label the budget accordingly.

### Evidence Labels

Use:

- VERIFIED
- INFERRED
- ASSUMED
- NOT VERIFIED
- BLOCKED

Do not claim that a performance budget was met unless an actual measurement supports the claim.

### Performance Scope

Before adding performance-related complexity, identify:

1. What performance problem exists?
2. How is it measured?
3. What target is being protected?
4. What simpler solution was considered?
5. What maintenance cost does the optimization introduce?

Do not introduce caching, memoization, code-splitting, preloading, virtualization, animation systems, or infrastructure complexity without a demonstrated reason.

### Final Performance Decision

Before declaring production readiness, answer:

> What performance requirement matters for this project, what is the target, and what evidence shows whether the target was met?

If the requirement is material but measurement has not been performed, mark the status NOT VERIFIED rather than claiming success.

## Project-Type Production Readiness

Production readiness must be evaluated according to the project's actual type, risk, and architecture.

Do not use one identical release checklist for every project.

### Landing Page / Marketing Website

Verify, where applicable:

- production build succeeds;
- responsive behavior;
- browser QA;
- visual QA;
- accessibility;
- metadata/SEO;
- image optimization;
- performance;
- links/navigation;
- production environment configuration;
- analytics where required;
- domain/DNS configuration.

Do not require backend/database checks when those systems do not exist.

### Corporate / Content Website

Verify, where applicable:

- production build;
- browser QA;
- responsive behavior;
- accessibility;
- navigation;
- content correctness;
- SEO;
- forms;
- integrations;
- analytics;
- environment configuration;
- deployment configuration.

### Internal Business System

Verify:

- authentication;
- authorization;
- critical workflows;
- validation;
- API behavior;
- database behavior;
- error handling;
- logging;
- environment configuration;
- backup/recovery strategy where data matters;
- browser QA;
- security checks;
- deployment verification.

### POS / Transactional System

Treat release readiness as high risk.

Verify:

- authentication and authorization;
- pricing calculations;
- discounts/taxes;
- transaction integrity;
- payment handling where applicable;
- inventory effects;
- duplicate transaction protection;
- failure/recovery behavior;
- database transactions;
- auditability where required;
- security controls;
- backup/recovery;
- critical browser workflows;
- deployment rollback strategy.

### SaaS / Full-Stack Application

Verify:

- authentication;
- authorization;
- API contracts;
- database behavior;
- validation;
- critical user journeys;
- error handling;
- security;
- logging/monitoring;
- environment/secrets;
- migrations;
- backups;
- deployment;
- rollback;
- browser QA;
- performance.

### Mobile Application

Verify:

- release build;
- core user journeys;
- authentication;
- API integration;
- persistence;
- error/loading states;
- device/responsive behavior where applicable;
- permissions;
- secure configuration;
- platform-specific release requirements;
- crash/error monitoring where applicable.

### Production Readiness Status

Use one of:

- READY
- READY WITH WARNINGS
- NOT READY
- BLOCKED

A project must not be marked READY when a required project-specific verification item is:

- FAILED;
- NOT VERIFIED;
- BLOCKED.

### Evidence Requirement

Every production-readiness claim must distinguish:

- VERIFIED
- INFERRED
- ASSUMED
- NOT VERIFIED
- BLOCKED

Do not claim production readiness from a successful build alone.

### Scope Rule

Only require checks that are relevant to the project's actual architecture.

For example:

A static landing page with no backend does not require database, API, queue, or authentication verification.

A POS application does.

