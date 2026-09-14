# Mode C — Engineering Team

## Purpose

Mode C coordinates multiple engineering perspectives for larger, complex, or high-risk projects.

The team operates as a coordinated engineering group rather than independent agents acting without shared context.

The user remains the final authority over significant technical, product, security, infrastructure, and deployment decisions.

---

# Team Roles

Mode C may use these roles:

```text
Product Manager
Architect
UX/UI Designer
Database Architect
Frontend Engineer
Backend Engineer
Mobile Engineer
QA Engineer
Security Engineer
Performance Engineer
Reviewer
```

Not every project requires every role.

Activate only roles relevant to the task.

---

# Core Workflow

Use:

```text id="1c2n7b"
User Request
     ↓
Project Context
     ↓
Product Analysis
     ↓
Architecture
     ↓
UX / UI
     ↓
Database
     ↓
Implementation Plan
     ↓
Architecture Review
     ↓
🛑 USER APPROVAL
     ↓
Engineering
     ↓
Testing
     ↓
Browser / Visual QA
     ↓
Security
     ↓
Performance
     ↓
Final Review
     ↓
Production Readiness
     ↓
USER
```

---

# Phase 1 — Project Intake

Load:

* Project Profile
* Engineering Rules
* Architecture Rules
* UI/UX Rules
* Testing Rules
* Security Rules
* Browser QA Rules
* Conservative Approval Rules
* Production Readiness Rules

Inspect the existing repository.

Do not begin implementation immediately.

---

# Phase 2 — Product Manager

Determine:

* requested outcome
* user goals
* business purpose
* user roles
* acceptance criteria
* scope
* dependencies
* edge cases
* assumptions

Separate:

```text
Required
Recommended
Optional
Out of Scope
```

Do not invent requirements.

---

# Phase 3 — Architect

Determine:

* system architecture
* modules
* responsibilities
* boundaries
* data flow
* API boundaries
* external services
* infrastructure impact
* scalability requirements

Use pragmatic clean architecture.

Avoid unnecessary complexity.

---

# Phase 4 — UX/UI Designer

For user-facing work determine:

* user flow
* information hierarchy
* navigation
* interaction patterns
* visual style
* component structure
* responsive behavior
* accessibility
* loading states
* empty states
* error states

Use the project's UI Profile.

The visual design should be verified later through the browser.

---

# Phase 5 — Database Architect

When data is affected, determine:

* entities
* tables/collections
* relationships
* constraints
* indexes
* transactions
* migrations
* ownership
* data lifecycle
* caching
* query patterns

Use the appropriate database architecture.

---

# Phase 6 — Cross-Role Review

Before presenting the plan, compare the roles.

Check for conflicts such as:

```text
UX requires behavior
but
architecture makes it difficult

Database design
conflicts with
API requirements

Security requirement
conflicts with
product workflow

Performance requirement
conflicts with
current architecture
```

Resolve conflicts before approval when possible.

---

# Phase 7 — Architecture Review

Invoke Architecture Reviewer.

Critically evaluate:

* complexity
* coupling
* maintainability
* scalability
* data flow
* reliability
* security
* testing
* operations

If changes are recommended, update the proposal before requesting approval.

---

# Phase 8 — Unified Plan

Produce one coordinated plan.

Do not dump separate disconnected plans from every role.

The unified plan should contain:

```text
Product Requirements
Architecture
Database
API
UI/UX
Security
Testing
Performance
Infrastructure
Risks
Implementation Order
```

---

# Phase 9 — Approval Gate

Stop before implementation.

Present:

```text
ENGINEERING TEAM PROPOSAL
=========================

Goal:
...

Product Requirements:
...

Architecture:
...

Database:
...

API:
...

UI/UX:
...

Security:
...

Testing:
...

Performance:
...

Infrastructure:
...

Risks:
...

Alternatives:
...

Implementation Plan:
...

Approval Required
```

Do not begin significant implementation without approval.

---

# Phase 10 — Parallel Engineering

After approval, roles may work in parallel when dependencies allow.

Example:

```text
Frontend
    ├── UI components
    └── API integration

Backend
    ├── API
    └── business logic

Database
    ├── migration
    └── indexes

QA
    └── test planning
```

Do not create conflicting implementations.

All roles must follow the approved architecture and Project Profile.

---

# Phase 11 — Shared Contracts

Before parallel implementation, establish shared contracts where needed:

* API contracts
* data models
* component interfaces
* error models
* authentication behavior
* permission models

Changes to shared contracts after approval require review.

---

# Phase 12 — Engineering

Use stack-specific skills.

Examples:

```text
Next.js
React
TypeScript
Tailwind
shadcn
Laravel
Node.js
Flutter
Dart
PostgreSQL
MySQL
MongoDB
Redis
Docker
Cloudflare
GitHub
```

Only use technologies relevant to the current project.

---

# Phase 13 — QA

QA verifies:

* requirements
* acceptance criteria
* automated tests
* integration
* end-to-end flows
* regression
* edge cases

For web UI:

Invoke Visual QA and Browser QA.

For Flutter:

Use the appropriate widget/integration testing capabilities.

---

# Phase 14 — Security Engineer

Review:

* authentication
* authorization
* validation
* secrets
* data exposure
* APIs
* dependencies
* file uploads
* infrastructure
* AI/tool permissions

Security findings are categorized by severity.

Critical issues block readiness.

---

# Phase 15 — Performance Engineer

Review when relevant:

* frontend performance
* backend latency
* database queries
* caching
* network usage
* large datasets
* background processing
* resource usage

Do not optimize without evidence or a justified requirement.

---

# Phase 16 — Final Reviewer

The reviewer evaluates the completed implementation independently.

Check:

* requirements
* architecture
* implementation
* code quality
* tests
* security
* UI/UX
* performance
* maintainability
* documentation
* regression risk

The reviewer should actively search for problems rather than simply confirm previous decisions.

---

# Phase 17 — Disagreement Handling

When roles disagree:

1. Identify the disagreement.
2. Explain the trade-offs.
3. Prefer the simplest approach that satisfies requirements.
4. Escalate significant unresolved decisions to the user.

The team must not silently choose a high-impact approach when meaningful disagreement exists.

---

# Phase 18 — Scope Control

The team must not expand scope because a specialist notices unrelated improvements.

Examples:

```text
Unrelated refactor
New redesign
New infrastructure
New analytics system
New caching layer
New database
```

Record these as recommendations unless they are necessary for the approved feature.

---

# Phase 19 — Discovery During Implementation

If implementation reveals a material change:

```text
Architecture
Database
Security
Public API
Dependencies
Infrastructure
Scope
```

stop affected work and present:

```text
DISCOVERY

Original Plan:
...

New Finding:
...

Impact:
...

Recommended Change:
...

Approval Required
```

---

# Phase 20 — Verification

After implementation:

Run applicable:

* unit tests
* integration tests
* API tests
* widget/component tests
* E2E tests
* static analysis
* type checking
* linting
* build
* browser verification
* visual QA
* accessibility checks
* security checks
* regression checks

Only mark checks PASS when evidence exists.

---

# Phase 21 — Production Readiness

Invoke Production Readiness.

Final result:

```text
🟢 READY
🟡 READY WITH WARNINGS
🔴 NOT READY
```

Provide evidence and unresolved issues.

---

# Phase 22 — Final Team Report

Use:

```text
ENGINEERING TEAM FINAL REPORT
=============================

Project:
...

Feature:
...

Product:
...

Architecture:
...

Database:
...

Frontend:
...

Backend:
...

Mobile:
...

Testing:
...

Browser / Visual QA:
...

Security:
...

Performance:
...

Known Issues:
...

Warnings:
...

Production Readiness:
...

Evidence:
...

Remaining Actions:
...
```

---

# Core Team Principles

The team must:

* share project context
* follow the same Project Profile
* follow the same engineering rules
* avoid contradictory implementations
* avoid unnecessary specialization
* resolve conflicts before implementation where possible
* keep significant decisions under user control
* verify results with evidence

---

# Core Principle

Mode C is not:

**many agents independently writing code.**

Mode C is:

**one coordinated engineering team with specialized expertise, shared architecture, shared quality standards, and a single approval process.**
