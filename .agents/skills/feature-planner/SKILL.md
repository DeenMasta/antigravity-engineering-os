# Feature Planner

## Purpose

Turn a feature request into an implementation-ready plan before production code is written.

This skill is responsible for analysis and planning.

It does not implement the feature until the user explicitly approves the proposed plan.

---

## When to Use

Use this skill for:

* new features
* significant changes
* new modules
* new pages
* new business workflows
* database-backed functionality
* new APIs
* substantial UI changes
* cross-module changes
* architectural changes

For trivial changes, use normal engineering judgment and avoid unnecessary planning overhead.

---

# Operating Procedure

## Step 1 — Understand the Request

Identify:

* requested capability
* intended users
* expected behavior
* business purpose
* important constraints
* success criteria

Do not invent requirements.

Separate:

```text
Explicit requirements
Assumptions
Unknowns
```

---

## Step 2 — Inspect the Existing Project

Before proposing implementation:

* inspect repository structure
* inspect relevant modules
* inspect existing architecture
* inspect existing components
* inspect existing services
* inspect existing models
* inspect existing APIs
* inspect relevant database schema
* inspect existing tests
* inspect authentication and authorization
* inspect relevant configuration

Reuse existing patterns where appropriate.

Never propose architecture based only on the feature description when an existing codebase is available.

---

## Step 3 — Load Project Profile

Read the applicable Project Profile.

Identify:

* project type
* frontend stack
* backend stack
* mobile stack
* database
* infrastructure
* UI style
* quality requirements
* testing requirements
* approval requirements
* AI configuration

Use the Project Profile to guide the proposal.

Do not assume every project uses the same stack or architecture.

---

## Step 4 — Determine Scope

Identify:

### In Scope

Work directly required for the feature.

### Out of Scope

Related work that is not required.

### Dependencies

Existing modules, services, packages, APIs, infrastructure, or data required by the feature.

### Risks

Potential architectural, security, data, performance, UX, or operational risks.

---

# Architecture Analysis

## Step 5 — Determine Architecture

Propose:

* affected modules
* responsibilities
* component boundaries
* service boundaries
* application flow
* data flow
* API boundaries
* external integrations
* background processing where required

Use pragmatic clean architecture.

Do not introduce:

* unnecessary microservices
* unnecessary repositories
* unnecessary factories
* unnecessary abstractions
* unnecessary queues
* unnecessary infrastructure

Architecture must be justified by actual requirements.

---

## Step 6 — Existing Pattern Compatibility

Determine whether the proposed design:

* follows existing project conventions
* reuses existing services
* reuses existing components
* reuses existing authentication
* reuses existing data access patterns
* introduces a new pattern

If a new architectural pattern is required, explain why.

---

# Database Analysis

## Step 7 — Database Design

When persistence is required, determine:

* tables/collections
* fields
* data types
* relationships
* primary keys
* foreign keys
* constraints
* indexes
* uniqueness
* nullable behavior
* deletion behavior
* timestamps
* audit requirements
* migration requirements

Consider:

* data integrity
* expected query patterns
* expected data volume
* concurrency
* future growth
* performance

Do not create database structures that are not justified by requirements.

---

# API Analysis

## Step 8 — API Design

When APIs are required, determine:

* endpoints
* HTTP methods
* request structure
* validation
* authentication
* authorization
* response structure
* error behavior
* pagination
* filtering
* sorting
* idempotency where relevant

Reuse existing API conventions.

Do not invent a different API style without justification.

---

# UI / UX Analysis

## Step 9 — User Flow

Determine:

* entry point
* main user flow
* actions
* confirmations
* success feedback
* error handling
* loading behavior
* empty states
* permissions
* navigation

---

## Step 10 — UI Design

Read the project's UI Profile and relevant UI/UX skills.

Determine:

* visual style
* layout
* component structure
* information hierarchy
* responsive behavior
* accessibility
* interaction patterns
* loading states
* empty states
* error states

For example:

```text
Style:
Enterprise

Density:
Comfortable

Motion:
Subtle

Responsive:
Required

Accessibility:
Strict
```

The actual project profile determines the values.

---

# Testing Analysis

## Step 11 — Testing Strategy

Determine appropriate:

* unit tests
* integration tests
* API tests
* component/widget tests
* end-to-end tests
* browser tests
* visual verification
* accessibility checks
* regression tests

Do not require every testing type for every feature.

Match testing depth to risk.

---

# Security Analysis

## Step 12 — Security

Identify:

* authentication requirements
* authorization requirements
* sensitive data
* input validation
* file handling
* API exposure
* secrets
* external services
* rate limiting
* audit requirements

Identify security-sensitive decisions that require explicit approval.

---

# Performance Analysis

## Step 13 — Performance

Identify likely performance risks:

* large datasets
* expensive queries
* excessive requests
* large bundles
* expensive rendering
* external API latency
* repeated calculations
* heavy background work

Only introduce optimization mechanisms when justified.

---

# Implementation Plan

## Step 14 — Produce an Ordered Plan

Create a practical implementation sequence.

Example:

```text
1. Add database migration
2. Add model
3. Add validation
4. Add API endpoint
5. Add authorization
6. Add frontend data layer
7. Add UI components
8. Add loading/error/empty states
9. Add tests
10. Run browser QA
11. Run security review
12. Run regression checks
```

The actual plan must match the project architecture.

---

# Risk Assessment

## Step 15 — Identify Risks

Classify risks:

### Technical

Architecture, dependencies, compatibility.

### Data

Migration, integrity, volume, consistency.

### Security

Authentication, authorization, exposure, secrets.

### UX

Confusing flow, accessibility, responsiveness.

### Performance

Latency, queries, rendering, network usage.

### Operations

Deployment, monitoring, rollback.

---

# Approval Gate

## Step 16 — Stop Before Implementation

Do not modify production code after completing the planning stage.

Produce an approval summary containing:

```text
FEATURE PLAN

Request
...

Existing System
...

Architecture
...

Database
...

API
...

UI/UX
...

Testing
...

Security
...

Performance
...

Risks
...

Implementation Plan
...

Files Expected To Change
...

New Dependencies
...

Approval Required
```

Then explicitly state:

```text
READY FOR APPROVAL

No production implementation will begin until the user approves this plan.
```

---

# Changes After Approval

If implementation reveals a material change to:

* architecture
* database
* security boundaries
* dependencies
* scope
* infrastructure
* API contracts

stop and request approval again.

Routine implementation details inside the approved plan do not require repeated approval.

---

# Output Quality Requirements

The plan should be:

* specific
* actionable
* based on the actual repository
* consistent with the Project Profile
* consistent with engineering rules
* explicit about assumptions
* explicit about risks
* free of unnecessary architecture

Do not produce generic boilerplate.

Reference actual files, modules, components, models, routes, and services discovered during repository inspection whenever possible.

---

# Core Principle

**Plan with evidence.
Reuse what already works.
Design before coding.
Get approval before significant implementation.**
