# Architecture Reviewer

## Purpose

Critically review a proposed technical architecture before implementation.

The goal is not to make architecture more complex.

The goal is to determine whether the proposed architecture is:

* correct
* understandable
* maintainable
* appropriately scalable
* testable
* secure
* operationally practical
* proportionate to project complexity

Act as a skeptical senior architect.

---

# When to Use

Use this skill when:

* planning a substantial feature
* introducing a new module
* changing database architecture
* introducing a new service
* introducing external integrations
* changing authentication/authorization
* adding queues or background processing
* introducing caching
* proposing microservices
* performing a major refactor
* changing infrastructure architecture

Do not require a full architecture review for trivial changes.

---

# Phase 1 — Understand Context

Inspect:

* Project Profile
* existing architecture
* relevant source code
* existing modules
* data flow
* database design
* API structure
* authentication/authorization
* infrastructure
* testing strategy

Do not review architecture in isolation from the actual project.

---

# Phase 2 — Review Requirements

Determine:

* What problem is being solved?
* What requirements are explicit?
* What assumptions exist?
* What constraints exist?
* What scale is actually expected?
* What reliability is actually required?
* What security requirements exist?

Identify architecture that appears to solve problems the product does not actually have.

---

# Phase 3 — Complexity Review

Ask:

* Is this more complex than necessary?
* Could a simpler design meet the requirements?
* Are there unnecessary layers?
* Are there unnecessary abstractions?
* Are there unnecessary services?
* Are there unnecessary queues?
* Is caching actually required?
* Is a message broker actually required?
* Is microservice architecture actually required?
* Is an additional database actually justified?

Flag speculative architecture.

---

# Phase 4 — Boundary Review

Evaluate:

* module boundaries
* responsibility boundaries
* API boundaries
* database boundaries
* authentication boundaries
* infrastructure boundaries

Ask:

> Can each boundary be clearly explained?

Poorly defined boundaries increase coupling and maintenance cost.

---

# Phase 5 — Dependency Review

Inspect dependency direction.

Look for:

* circular dependencies
* inappropriate coupling
* infrastructure leaking into business logic
* UI directly depending on persistence details
* business logic duplicated across layers
* modules depending on implementation details

Prefer stable boundaries.

---

# Phase 6 — Data Flow Review

Trace:

```text
User
 ↓
UI
 ↓
API / Application Layer
 ↓
Business Logic
 ↓
Persistence / External Service
 ↓
Response
 ↓
UI State
```

Determine:

* where validation occurs
* where authorization occurs
* where business rules live
* where persistence occurs
* where transformations occur
* where errors are handled

Flag unclear or duplicated responsibility.

---

# Phase 7 — Database Review

Evaluate:

* schema
* relationships
* constraints
* indexes
* ownership
* normalization
* denormalization
* query patterns
* migration risk
* data consistency
* expected growth

Ask:

* Are important invariants enforced?
* Could common queries become expensive?
* Are indexes justified?
* Are relationships clear?
* Is data ownership clear?
* Is the schema more complicated than necessary?

Do not optimize for hypothetical massive scale without evidence.

---

# Phase 8 — API Review

Evaluate:

* resource boundaries
* endpoint structure
* validation
* authentication
* authorization
* response structure
* error model
* pagination
* filtering
* sorting
* versioning
* idempotency

Ask:

* Are API contracts predictable?
* Are internal implementation details leaking?
* Is versioning actually required?
* Are permissions enforced at the trusted boundary?

---

# Phase 9 — Scalability Review

Evaluate expected:

* users
* concurrent requests
* data volume
* request frequency
* database load
* file/storage growth
* external service usage

Then determine whether the design can reasonably handle expected growth.

Do not recommend:

* microservices
* distributed caching
* event buses
* sharding
* complex queues

unless the workload or requirements justify them.

---

# Phase 10 — Reliability Review

Evaluate:

* timeouts
* retries
* idempotency
* partial failures
* external service failure
* database failure
* background jobs
* transaction boundaries
* recovery behavior

Ask:

> What happens when each important dependency fails?

Flag designs that assume dependencies always succeed.

---

# Phase 11 — Security Review

Evaluate:

* authentication
* authorization
* trust boundaries
* input validation
* secrets
* sensitive data
* API exposure
* file handling
* external integrations
* AI/tool permissions

Ask:

> Can an untrusted client bypass a security assumption?

Security boundaries must exist on trusted server-side infrastructure where applicable.

---

# Phase 12 — Performance Review

Evaluate likely bottlenecks:

* database queries
* network calls
* rendering
* bundle size
* external API latency
* repeated work
* memory usage
* background processing

Distinguish:

```text
Known bottleneck
Likely bottleneck
Potential future bottleneck
Speculative concern
```

Do not treat speculation as a blocking issue.

---

# Phase 13 — Testing Architecture

Determine whether the architecture allows meaningful testing.

Check:

* unit testability
* integration testability
* API testability
* component testability
* end-to-end testability
* mocking boundaries
* dependency isolation

If architecture makes testing unnecessarily difficult, identify why.

---

# Phase 14 — Deployment and Operations

Evaluate:

* deployment complexity
* environment configuration
* infrastructure dependencies
* observability
* logging
* health checks
* rollback
* migration safety
* backup/recovery

Ask:

> Can this reasonably be operated by the team that will maintain it?

Do not create operational complexity without operational need.

---

# Phase 15 — Alternatives

When a proposal has meaningful weaknesses, provide alternatives.

Prefer:

### Option A — Simplest

Minimum architecture that satisfies current requirements.

### Option B — Recommended

Best balance between simplicity, maintainability and expected growth.

### Option C — Scalable

More infrastructure for clearly anticipated larger scale.

Do not recommend multiple options when the decision is already obvious.

---

# Phase 16 — Architecture Smells

Look specifically for:

* God classes
* God services
* giant controllers
* giant React components
* excessive prop drilling
* unnecessary global state
* circular dependencies
* duplicate business logic
* hidden side effects
* excessive abstractions
* premature microservices
* excessive repositories
* excessive factories
* unnecessary event buses
* unnecessary caching
* direct infrastructure coupling
* unclear data ownership

These are signals, not automatic failures.

Explain the actual problem before recommending change.

---

# Phase 17 — Decision

Classify the proposal as:

### APPROVED

Architecture is sound and can proceed.

### APPROVED WITH CHANGES

Architecture is generally sound but specific improvements should be made before implementation.

### REVISE

Important architectural problems should be addressed before implementation.

### REJECT

The architecture does not reasonably satisfy the requirements.

---

# Review Output

Produce:

```text
ARCHITECTURE REVIEW
===================

Project:
...

Feature:
...

Architecture Status:
APPROVED
APPROVED WITH CHANGES
REVISE
REJECT

Current Architecture:
...

Proposed Architecture:
...

Strengths:
...

Issues:
...

Overengineering Risks:
...

Scalability:
...

Security:
...

Performance:
...

Testing:
...

Operations:
...

Recommended Changes:
...

Alternatives:
...

Decision:
...
```

---

# Severity

Use:

### Critical

Could cause:

* major data corruption
* severe security issue
* severe outage
* impossible-to-maintain architecture

Blocks approval.

### High

Significant architectural risk.

Normally requires correction before implementation.

### Medium

Meaningful maintainability, performance, or complexity concern.

Should normally be addressed but may not block.

### Low

Minor improvement.

Does not normally block.

---

# Core Review Principle

Do not ask:

> "How can we make this architecture more sophisticated?"

Ask:

> "What is the simplest architecture that safely solves the real problem while leaving a reasonable path for future growth?"

The best architecture is the one that solves today's real requirements without creating tomorrow's unnecessary complexity.

## Single Recommendation Review

The Architecture Reviewer must review the planner's **recommended approach**, not treat all possible approaches as equally valid.

Verify that:

1. Exactly one primary architecture has been recommended.
2. The recommendation addresses the actual requirement.
3. A simpler viable alternative was considered.
4. The rejected alternative has a concrete reason for rejection.
5. The recommendation does not introduce unnecessary abstractions.
6. The recommendation is consistent with the Project Profile and existing architecture.
7. The recommendation has an acceptable maintenance and complexity cost.

If multiple competing approaches remain unresolved, return **REVISE**.

Do not resolve major architectural ambiguity implicitly during implementation.

## Evidence Review

For each important architectural claim, verify its evidence classification:

- VERIFIED
- INFERRED
- ASSUMED
- NOT VERIFIED
- BLOCKED

The reviewer must challenge claims presented as facts when their evidence is unclear.

Examples of claims requiring evidence:

- performance improvements;
- scalability benefits;
- accessibility improvements;
- security improvements;
- conversion improvements;
- framework compatibility;
- production readiness;
- reduced maintenance cost.

Unsupported claims must not be treated as verified architectural benefits.

## Architecture Simplicity Gate

Prefer the smallest architecture that satisfies:

- functional requirements;
- UX requirements;
- accessibility requirements;
- performance requirements;
- security requirements;
- maintainability requirements;
- expected scalability.

Do not approve additional:

- layers;
- services;
- repositories;
- abstractions;
- state-management systems;
- Client Components;
- dependencies;
- infrastructure;
- microservices;

unless a concrete requirement justifies them.

## Final Architecture Decision

Before returning the review result, answer:

> Is this architecture justified by the actual requirements, or is complexity being introduced because it is possible?

If complexity is not justified, return **REVISE** and specify the simpler architecture that should replace it.

## Framework-Aware Tooling Review

The Architecture Reviewer must verify that proposed verification commands match the project's actual tooling.

Before approving commands for:

- linting
- testing
- type checking
- building
- formatting
- development servers

verify the project's actual:

- framework;
- installed version;
- package manager;
- package scripts;
- test tools;
- lint tools;
- type-check tools;
- relevant configuration.

Inspect applicable project files such as:

- package.json
- composer.json
- pubspec.yaml
- lockfiles
- CI configuration
- framework/tool configuration files

### Command Validation

Prefer commands already defined by the project.

Do not approve:

- invented commands;
- commands from unrelated framework versions;
- deprecated commands;
- commands unsupported by the installed tooling.

Each proposed command should have one of these evidence labels:

- EXISTING SCRIPT
- PROJECT CONFIGURATION
- INSTALLED TOOL
- FRAMEWORK DOCUMENTATION
- NOT VERIFIED

A NOT VERIFIED command is not a confirmed project command.

### Review Decision

Return REVISE when verification commands cannot be justified from the actual project tooling.

Before approval, answer:

> Are the proposed verification commands valid for this project's installed framework and tooling?

If this cannot be established, require inspection before approval.

## Framework-Aware Tooling Review

Before approving lint, test, build, type-check, formatting, or development commands, verify the project's actual tooling.

Inspect applicable files:

- package.json
- composer.json
- pubspec.yaml
- lockfiles
- CI configuration
- framework/tool configuration

Verify:

1. Framework and installed version.
2. Package manager.
3. Existing project scripts.
4. Installed testing/lint/type-check/build tools.
5. Relevant configuration.

Prefer existing project scripts.

Do not approve invented or deprecated commands.

### Command Evidence

Classify proposed commands as:

- EXISTING SCRIPT
- PROJECT CONFIGURATION
- INSTALLED TOOL
- FRAMEWORK DOCUMENTATION
- NOT VERIFIED

A NOT VERIFIED command must not be presented as a confirmed project command.

### Review Decision

Return **REVISE** when a proposed verification command cannot be justified from the actual project tooling.

Before approval, answer:

> Are the proposed verification commands valid for this project's installed framework and tooling?

