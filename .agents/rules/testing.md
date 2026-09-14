---
trigger: always_on
---

# Testing Rules

## Purpose

Testing exists to provide reliable evidence that software behaves correctly.

A feature is not considered verified merely because it compiles, starts successfully, or looks correct during casual inspection.

Testing must be appropriate to the risk, complexity, and type of change.

---

## 1. Testing Principles

Prioritize:

* behavior over implementation details
* meaningful coverage over arbitrary coverage percentages
* deterministic tests
* fast feedback
* regression prevention
* clear failure messages
* appropriate test isolation

Do not create tests merely to satisfy a numerical coverage target.

---

## 2. Test Before Claiming Completion

Before claiming that a feature is complete:

1. Run relevant automated tests.
2. Run type checking where applicable.
3. Run linting where applicable.
4. Build the application where applicable.
5. Perform manual/browser verification when relevant.
6. Review failures and warnings.
7. Address unresolved issues or explicitly report them.

A failed test means the feature is not fully verified.

---

## 3. Testing Pyramid

Prefer the smallest effective combination of tests.

### Unit Tests

Use for:

* business rules
* pure functions
* transformations
* calculations
* isolated logic
* validation logic where practical

### Integration Tests

Use for:

* database interactions
* API boundaries
* service integrations
* authentication flows
* important module interactions

### End-to-End Tests

Use for:

* critical user journeys
* multi-step business flows
* high-value workflows
* major regression risks

### Browser Tests

Use for:

* frontend interaction
* rendered UI behavior
* navigation
* forms
* responsive behavior
* accessibility-related interaction
* visual verification

---

## 4. Test Scope Must Match Change Scope

A small isolated change may only require focused unit or component tests.

A cross-module feature may require:

* unit tests
* integration tests
* API tests
* browser tests
* regression checks

Do not run an unnecessarily huge test suite for every trivial change when a focused test is sufficient.

For high-risk or cross-cutting changes, broader regression testing is required.

---

## 5. Test-Driven Development

Use test-driven development when appropriate, especially for:

* business logic
* complex algorithms
* bug fixes
* security-sensitive logic
* data transformations
* reusable libraries

Preferred loop:

```text id="jtwkkt"
RED
↓
Write failing test
↓
GREEN
↓
Minimal implementation
↓
REFACTOR
↓
Improve structure
↓
VERIFY
```

Do not force TDD for trivial visual adjustments where it would add little value.

---

## 6. Bug Fixes

For a bug:

1. Reproduce the failure.
2. Record the expected behavior.
3. Identify the root cause.
4. Create or update a regression test where appropriate.
5. Implement the fix.
6. Run the relevant test.
7. Run broader regression checks when the change could affect related behavior.
8. Verify the original failure no longer occurs.

Do not change code randomly until the error disappears.

---

## 7. Failure Investigation

When a test fails:

1. Read the full failure.
2. Identify the failing assertion or operation.
3. Determine whether the test or implementation is wrong.
4. Reproduce independently if necessary.
5. Investigate the root cause.
6. Make the smallest justified change.
7. Re-run the failing test.
8. Re-run related tests.

Do not weaken or delete a test simply because it fails.

---

## 8. Flaky Tests

A flaky test must not be silently ignored.

Investigate:

* timing assumptions
* shared state
* nondeterministic data
* external dependencies
* network dependencies
* concurrency
* browser timing
* environment differences

If a test must temporarily be quarantined, document why and create a follow-up action.

---

## 9. Frontend Testing

For frontend changes, determine which of these are required:

* component tests
* state/logic tests
* API/integration tests
* browser tests
* visual verification
* accessibility checks

Important interactive components should have meaningful behavior coverage.

---

## 10. Browser Verification

When a UI change affects user-visible behavior:

1. Start the application.
2. Open the relevant page.
3. Navigate to the affected feature.
4. Exercise the expected user flow.
5. Test relevant edge cases.
6. Capture screenshots when useful.
7. Inspect the rendered UI.
8. Check responsive behavior.
9. Verify error/loading/empty states.
10. Re-test after any visual fixes.

Browser verification is required for meaningful user-facing UI changes unless there is a documented reason it is impractical.

---

## 11. Responsive Testing

For responsive frontend changes, verify relevant viewport classes:

```text id="j1jga8"
Mobile
Tablet
Desktop
```

Test the breakpoints that matter to the project.

Check:

* layout
* navigation
* text wrapping
* overflow
* tables
* forms
* dialogs
* buttons
* images
* spacing
* touch interaction

Do not infer responsive correctness from source code alone.

---

## 12. Accessibility Testing

Where applicable, verify:

* keyboard navigation
* focus order
* visible focus
* labels
* semantic structure
* accessible names
* contrast
* error communication
* touch targets
* screen-reader behavior for important flows

Automated accessibility testing is useful but does not replace human-oriented interaction checks.

---

## 13. Backend Testing

For backend functionality, consider:

* validation
* authentication
* authorization
* business logic
* database behavior
* transactions
* API responses
* error responses
* rate limiting where relevant
* idempotency where relevant

Important authorization behavior must have tests.

---

## 14. Database Testing

Database-related changes should verify:

* migrations
* constraints
* relationships
* indexes where important
* validation
* transaction behavior where relevant
* query behavior
* rollback behavior where appropriate

For destructive or high-risk migrations, explicitly test the migration strategy.

---

## 15. API Testing

API tests should verify:

* request validation
* successful responses
* expected error responses
* authentication
* authorization
* response structure
* pagination/filtering where relevant
* edge cases

Do not only test the happy path.

---

## 16. Mobile Testing

For Flutter/mobile changes, use the appropriate combination of:

* unit tests
* widget tests
* integration tests
* platform-specific validation
* responsive checks
* device/viewport verification

Important user flows should be covered with integration-level testing where appropriate.

---

## 17. Security Testing

Security-sensitive features must receive focused testing.

Examples:

* authentication
* authorization
* permissions
* session handling
* input validation
* file uploads
* access control
* sensitive data handling

Tests should verify both:

```text id="dykeq5"
allowed behavior
AND
denied behavior
```

---

## 18. Performance Testing

Performance testing is required when performance is a material requirement or risk.

Consider:

* database query counts
* response times
* bundle size
* rendering performance
* large datasets
* concurrent requests
* memory usage
* startup time

Do not claim performance improvements without evidence where measurement is practical.

---

## 19. Test Data

Prefer deterministic and isolated test data.

Avoid tests that depend unnecessarily on:

* personal data
* production data
* unstable external services
* current dates without controlled clocks
* arbitrary network responses

Never expose real secrets in tests.

---

## 20. External Services

When appropriate:

* mock external services for isolated tests
* use integration environments for integration tests
* use real external services only when the test specifically requires them

Tests should clearly indicate when external dependencies are involved.

---

## 21. Build Verification

For applications that require a build:

* run the relevant build
* verify generated output succeeds
* inspect build errors and important warnings
* do not consider compilation alone proof of correctness

A successful build is one piece of evidence, not the complete test result.

---

## 22. Linting and Static Analysis

Where the project provides:

* linting
* type checking
* static analysis
* formatting validation

run the relevant checks.

Do not automatically weaken linting or type rules to make a feature pass unless there is a documented and justified reason.

---

## 23. Regression Testing

After fixing or changing a shared component, infrastructure layer, authentication mechanism, data model, or other cross-cutting functionality:

* run targeted tests
* run affected integration tests
* run important end-to-end or browser tests
* verify related features

The broader the blast radius, the broader the regression test scope.

---

## 24. Test Quality

A good test should:

* describe meaningful behavior
* fail for the right reason
* be understandable
* avoid unnecessary implementation coupling
* remain stable under reasonable refactoring

Avoid:

* brittle selectors without reason
* excessive mocking
* meaningless assertions
* duplicate tests
* tests that only verify framework internals

---

## 25. Evidence Recording

When reporting verification, distinguish:

### Verified

Evidence was actually obtained.

### Not verified

The check was not executed.

### Blocked

The check could not be executed because of a dependency, environment, permission, or other issue.

Never convert "not verified" or "blocked" into "passed."

---

## 26. Completion Gate

Before reporting a feature as complete, determine:

```text id="6btjzw"
Build                  PASS / FAIL / N/A
Type Check             PASS / FAIL / N/A
Lint                   PASS / FAIL / N/A
Unit Tests             PASS / FAIL / N/A
Integration Tests      PASS / FAIL / N/A
E2E Tests              PASS / FAIL / N/A
Browser QA             PASS / FAIL / N/A
Responsive QA          PASS / FAIL / N/A
Accessibility          PASS / FAIL / N/A
Security Checks        PASS / FAIL / N/A
Regression             PASS / FAIL / N/A
```

Only mark a check as PASS when evidence exists.

---

## 27. Final Testing Status

Use one of these statuses:

### VERIFIED

All required checks passed.

### VERIFIED WITH WARNINGS

Required checks passed, but non-blocking issues remain.

### NOT VERIFIED

Required checks were not completed.

### FAILED

One or more required checks failed.

### BLOCKED

Required verification could not be completed because of an external blocker.

Never call a feature "production-ready" when its required testing status is FAILED, NOT VERIFIED, or BLOCKED.

---

## Core Testing Principle

**Evidence before confidence.**

Tests are not decoration around the implementation.

Tests, browser verification, static analysis, builds, and regression checks are evidence that software behaves as intended.

## Framework-Aware Commands

Never invent framework commands.

Before running lint, test, build, or type-check commands:

1. Inspect package.json/scripts.
2. Inspect the project's actual tooling/configuration.
3. Use the project's existing scripts where possible.
4. Verify that the command is valid for the installed framework version.

Do not use deprecated framework commands merely because they appear in older documentation.
