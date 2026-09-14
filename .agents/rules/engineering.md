---
trigger: always_on
---

# Engineering Rules

## Purpose

These rules define the default engineering behavior for all projects using this Engineering OS.

The goal is production-quality software that is clean, maintainable, scalable when justified, secure, testable, understandable, and practical.

---

## 1. Understand Before Changing

Before modifying an existing project:

1. Inspect the repository structure.
2. Identify the application architecture and major boundaries.
3. Inspect existing patterns and conventions.
4. Identify relevant existing components, services, models, utilities, tests, and APIs.
5. Reuse existing functionality when appropriate.
6. Do not introduce a new pattern when an existing project pattern already solves the problem adequately.

Never assume the project is empty or architecturally deficient without evidence.

---

## 2. Plan Before Implementation

For any non-trivial feature:

1. Understand the requirement.
2. Identify affected areas.
3. Determine the appropriate architecture.
4. Determine database changes.
5. Determine API and data-flow changes.
6. Determine UI/UX changes.
7. Identify risks and edge cases.
8. Produce an implementation plan.

Do not immediately start writing production code for a substantial feature.

---

## 3. Pragmatic Clean Architecture

Prefer:

* clear separation of concerns
* low coupling
* high cohesion
* explicit boundaries
* reusable components
* predictable data flow
* maintainable abstractions

Avoid:

* unnecessary layers
* premature abstraction
* speculative patterns
* excessive factories
* unnecessary repositories
* unnecessary design patterns
* over-engineering simple features

Architecture should be proportional to the complexity and expected lifetime of the system.

---

## 4. Existing Code Has Priority

When working on an existing system:

* Preserve working behavior unless there is a justified reason to change it.
* Follow established conventions when they are reasonable.
* Avoid unrelated refactoring.
* Do not rewrite functioning modules merely because another architecture looks cleaner.
* If the existing architecture creates a significant problem, explain the problem and propose a migration or improvement before making large changes.

---

## 5. Code Quality

Production code must prioritize:

* readability
* maintainability
* consistency
* type safety
* appropriate abstraction
* explicit error handling
* predictable behavior
* testability

Avoid:

* duplicated logic
* dead code
* unexplained magic values
* misleading names
* giant functions
* giant components
* unnecessary comments
* hidden side effects
* fragile shortcuts

Prefer clear code over clever code.

---

## 6. Dependencies

Before adding a dependency:

1. Determine whether the project already provides the required capability.
2. Determine whether the functionality can reasonably be implemented using existing dependencies.
3. Evaluate maintenance, security, compatibility, bundle/runtime impact, and complexity.
4. Explain why the dependency is justified.

Adding a dependency that materially changes architecture or security requires user approval.

---

## 7. Error Handling

Production code must explicitly consider failure.

Consider:

* invalid input
* unavailable services
* network failures
* database failures
* authentication failures
* authorization failures
* empty results
* malformed responses
* timeouts
* race conditions where relevant
* unexpected exceptions

Do not silently swallow important errors.

Errors should provide useful information without exposing secrets or sensitive implementation details.

---

## 8. Testing

Tests should be created at the appropriate level for the feature.

Use the smallest effective combination of:

* unit tests
* integration tests
* API tests
* widget/component tests
* end-to-end tests
* browser verification

A test must verify behavior, not merely increase coverage numbers.

When fixing a bug:

1. Reproduce it.
2. Identify the root cause.
3. Add or update a regression test when appropriate.
4. Implement the fix.
5. Re-run relevant tests.
6. Verify that existing behavior was not broken.

---

## 9. Verification Before Claims

Never claim that a feature is complete, fixed, working, or production-ready without performing appropriate verification.

Use evidence such as:

* successful build
* passing tests
* successful type checking
* successful linting
* successful application execution
* browser verification
* screenshots or recordings where visual verification is required
* relevant logs
* successful API/database verification

Do not use phrases such as "should work" as a substitute for verification.

---

## 10. UI Changes Require Visual Verification

For frontend or UI changes:

1. Run the application when practical.
2. Open the relevant page in a browser.
3. Interact with the affected functionality.
4. Verify the intended user flow.
5. Inspect the rendered UI visually.
6. Check responsive behavior.
7. Check loading, empty, error, hover, focus, and disabled states where relevant.
8. Fix discovered issues.
9. Re-check after fixes.

Source code alone is not sufficient evidence that a UI is correct.

---

## 11. Responsive and Accessibility Quality

UI implementation should consider:

* mobile
* tablet
* desktop
* keyboard navigation
* focus visibility
* readable contrast
* semantic HTML
* accessible labels
* appropriate touch targets
* screen-reader considerations where relevant
* reduced-motion preferences where relevant

Do not consider a UI complete merely because it looks correct at one viewport size.

---

## 12. Security

Security must be considered during implementation, not added as an afterthought.

Pay particular attention to:

* authentication
* authorization
* input validation
* output encoding
* secrets
* session handling
* file uploads
* database queries
* API access
* rate limiting
* sensitive data exposure
* dependency vulnerabilities
* logging of sensitive information

Never expose credentials, tokens, private keys, passwords, or other secrets.

---

## 13. Performance

Optimize based on evidence and likely impact.

Consider:

* unnecessary network requests
* async waterfalls
* excessive rendering
* bundle size
* database query count
* inefficient queries
* unnecessary data transfer
* caching
* image sizes
* expensive operations
* memory usage

Do not sacrifice maintainability for speculative micro-optimizations.

---

## 14. Scope Discipline

Only implement what is required to satisfy the feature.

Do not silently add:

* unrelated refactors
* unnecessary redesigns
* new infrastructure
* speculative abstractions
* unrelated dependencies
* unrelated database changes

When additional work is genuinely necessary, identify it explicitly.

---

## 15. Documentation

Document decisions that future developers genuinely need to understand.

Prioritize documentation of:

* non-obvious architecture decisions
* important trade-offs
* unusual constraints
* complex data flows
* setup requirements
* operational requirements
* security-sensitive behavior

Do not add comments that merely restate obvious code.

---

## 16. Git Discipline

Keep changes:

* focused
* reviewable
* logically grouped
* free from generated artifacts unless required

Do not discard or overwrite user changes without explicit approval.

Do not commit secrets.

Do not make destructive Git operations without approval.

---

## 17. User Approval

The following normally require explicit user approval:

* major architecture changes
* destructive database operations
* production deployment
* destructive filesystem operations
* authentication/authorization redesign
* major dependency additions
* infrastructure changes
* data migrations with significant risk
* removing substantial existing functionality

Routine implementation inside an approved plan may proceed without repeatedly asking for permission.

---

## 18. Completion Standard

A feature is not considered complete merely because code has been written.

A feature is complete only when:

* the intended behavior is implemented
* appropriate tests pass
* relevant existing behavior still works
* applicable browser/UI verification passes
* security concerns are addressed
* important errors are handled
* the implementation matches the approved architecture
* no known critical issue remains

Final production readiness is determined by the production-readiness rules, not by the developer's confidence.

---

## 19. Communication

When reporting work:

1. State what was changed.
2. State what was verified.
3. State any unresolved issues.
4. State any assumptions.
5. Distinguish verified facts from recommendations.

Do not hide failures or omit important warnings merely to make the result appear complete.

---

## Core Principle

Build software that is:

**Simple where possible.
Structured where necessary.
Scalable when justified.
Tested with evidence.
Visually verified when applicable.
Secure by default.
Maintainable by design.**
