# Mode C â€” Engineering Team

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
     â†“
Project Context
     â†“
Product Analysis
     â†“
Architecture
     â†“
UX / UI
     â†“
Database
     â†“
Implementation Plan
     â†“
Architecture Review
     â†“
ðŸ›‘ USER APPROVAL
     â†“
Engineering
     â†“
Testing
     â†“
Browser / Visual QA
     â†“
Security
     â†“
Performance
     â†“
Final Review
     â†“
Production Readiness
     â†“
USER
```

---

# Phase 1 â€” Project Intake

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

# Phase 2 â€” Product Manager

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

# Phase 3 â€” Architect

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

# Phase 4 â€” UX/UI Designer

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

# Phase 5 â€” Database Architect

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

# Phase 6 â€” Cross-Role Review

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

# Phase 7 â€” Architecture Review

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

# Phase 8 â€” Unified Plan

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

# Phase 9 â€” Approval Gate

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

# Phase 10 â€” Parallel Engineering

After approval, roles may work in parallel when dependencies allow.

Example:

```text
Frontend
    â”œâ”€â”€ UI components
    â””â”€â”€ API integration

Backend
    â”œâ”€â”€ API
    â””â”€â”€ business logic

Database
    â”œâ”€â”€ migration
    â””â”€â”€ indexes

QA
    â””â”€â”€ test planning
```

Do not create conflicting implementations.

All roles must follow the approved architecture and Project Profile.

---

# Phase 11 â€” Shared Contracts

Before parallel implementation, establish shared contracts where needed:

* API contracts
* data models
* component interfaces
* error models
* authentication behavior
* permission models

Changes to shared contracts after approval require review.

---

# Phase 12 â€” Engineering

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

# Phase 13 â€” QA

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

# Phase 14 â€” Security Engineer

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

# Phase 15 â€” Performance Engineer

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

# Phase 16 â€” Final Reviewer

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

# Phase 17 â€” Disagreement Handling

When roles disagree:

1. Identify the disagreement.
2. Explain the trade-offs.
3. Prefer the simplest approach that satisfies requirements.
4. Escalate significant unresolved decisions to the user.

The team must not silently choose a high-impact approach when meaningful disagreement exists.

---

# Phase 18 â€” Scope Control

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

# Phase 19 â€” Discovery During Implementation

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

# Phase 20 â€” Verification

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

# Phase 21 â€” Production Readiness

Invoke Production Readiness.

Final result:

```text
ðŸŸ¢ READY
ðŸŸ¡ READY WITH WARNINGS
ðŸ”´ NOT READY
```

Provide evidence and unresolved issues.

---

# Phase 22 â€” Final Team Report

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

# Mode C Agent Execution Pipeline

Mode C operates as a coordinated engineering team.

Do not treat all agents as independent assistants.

Each agent has a defined responsibility and execution stage.

## Agent Roles

### Planner Agent

Responsible for:

- requirement interpretation;
- project discovery;
- implementation planning;
- scope definition;
- complexity analysis;
- recommended approach;
- testing strategy;
- expected change boundary.

Output:

**PLAN READY FOR ARCHITECTURE REVIEW**

---

### Architecture Agent

Responsible for:

- architecture validation;
- boundary validation;
- complexity review;
- dependency review;
- blast-radius review;
- consistency with existing architecture;
- framework/tooling validation.

Output:

- APPROVE
- APPROVE WITH CORRECTIONS
- REVISE
- REJECT

---

### Security Agent

Responsible for:

- authentication;
- authorization;
- validation;
- secrets;
- sensitive data;
- API access;
- dependency risk;
- security regressions.

Security review must occur before release.

---

### QA Agent

Responsible for:

- automated testing;
- framework-aware verification commands;
- browser QA;
- responsive QA;
- visual QA;
- accessibility checks;
- regression checks;
- expected-vs-actual change verification.

Output:

- VERIFIED
- VERIFIED WITH WARNINGS
- NOT VERIFIED
- FAILED
- BLOCKED

---


### Code Review Agent

Responsible for:

- inspecting the actual Git diff;
- comparing implementation against the approved plan;
- detecting unrelated changes;
- detecting unnecessary complexity;
- checking maintainability;
- checking framework usage;
- checking technical debt;
- checking UI complexity.

Output:

- APPROVE
- APPROVE WITH CORRECTIONS
- REVISE
- REJECT

Code Review must occur after QA and Security and before Release.

### Release Agent

Responsible for:

- production readiness;
- deployment configuration;
- environment configuration;
- migrations;
- backups;
- rollback;
- monitoring;
- release risk.

Output:

- READY
- READY WITH WARNINGS
- NOT READY
- BLOCKED

---

# Mandatory Execution Order

Mode C must follow this sequence:

1. Project Profile
2. Project Discovery
3. Planner Agent
4. Architecture Agent
5. Pre-Approval Reviewer
6. USER APPROVAL
7. Implementation
8. QA Agent
9. Security Agent
10. Final Code Review
11. Code Review Agent
12. Release Agent
12. Production Readiness
13. Final Report

Do not skip stages unless the stage is genuinely not applicable.

When a stage is not applicable, record:

**N/A — reason**

---

# Approval Gate

No implementation may begin before:

- Planner Agent completes;
- Architecture Agent completes;
- Pre-Approval Reviewer completes;
- required corrections are resolved;
- the user explicitly approves the plan.

Approval must be explicit.

Examples of approval:

- "approved"
- "go ahead"
- "implement it"
- equivalent explicit authorization.

Do not interpret:

- conversation momentum;
- silence;
- asking questions;
- requesting clarification;

as approval to implement.

---

# Rejection Handling

If Planner or Architecture Agent returns REVISE or REJECT:

1. Stop.
2. Revise the plan.
3. Re-run the relevant review.
4. Do not implement.

If Pre-Approval Reviewer returns:

- APPROVE ? continue to user approval.
- APPROVE WITH CORRECTIONS ? correct before requesting approval.
- REVISE ? revise and review again.
- REJECT ? stop and redesign.

---

# Post-Approval Scope Protection

After approval:

Do not materially expand the approved architecture or change boundary without re-review.

If implementation reveals a material new requirement:

1. Stop.
2. Explain the discovery.
3. Reassess architecture and blast radius.
4. Obtain re-approval when required.

---

# Agent Communication

Each stage must consume the previous stage's output.

At minimum, carry forward:

- requirement;
- project profile;
- approved scope;
- recommended architecture;
- rejected alternatives;
- risks;
- evidence/assumptions;
- expected change boundary;
- testing requirements.

Agents must not silently replace decisions made by earlier stages.

---

# Final Mode C Rule

Mode C should behave like a disciplined engineering team, not unrestricted parallel agents.

Parallel work is allowed only when:

- tasks are independent;
- scope boundaries are clear;
- no shared decision is being made;
- parallel execution cannot bypass approval or review.

Architecture, security, QA, and release decisions must remain independently reviewable.

The final report must include:

- implementation summary;
- changed files;
- tests executed;
- browser/visual QA results;
- security result;
- production-readiness result;
- unresolved warnings;
- actual Git change scope;
- final status.


## Coordinator Authority

Mode C is coordinated by:

.agents/agents/mode-c-coordinator.md

The Coordinator is the primary orchestration role.

The Coordinator is responsible for:

- selecting the correct specialist agent;
- enforcing execution order;
- carrying decisions between stages;
- enforcing approval gates;
- handling review failures;
- protecting approved scope;
- coordinating QA, security, code review, and release;
- producing the final engineering status.

Specialist agents remain responsible for their own domain decisions.

The Coordinator must not override a specialist's domain review without explicit reasoning and re-review.

## Specialist Agent Mapping

| Stage | Agent |
|---|---|
| Planning | planner-agent |
| Architecture | architecture-agent |
| Pre-Approval | pre-approval-reviewer skill |
| QA | qa-agent |
| Security | security-agent |
| Code Review | code-review-agent |
| Release | release-agent |

## Coordinator First

When Mode C starts:

1. Load the Project Profile.
2. Load the Mode C Coordinator instructions.
3. Execute the mandatory workflow.
4. Invoke specialist responsibilities at the appropriate stage.
5. Preserve outputs between stages.
6. Enforce USER APPROVAL before implementation.
7. Produce the final report only after required reviews.

Do not treat Mode C as a collection of unrelated role prompts.

## Specialist Independence

Specialists may challenge previous decisions within their domain.

Examples:

- Architecture may reject unnecessary complexity.
- Security may reject unsafe implementation.
- QA may reject insufficient verification.
- Code Review may reject poor implementation quality.
- Release may reject unsafe deployment readiness.

A challenge requires the Coordinator to route the work back to the appropriate stage.

## No Approval Bypass

No specialist may:

- begin implementation before user approval;
- silently expand approved scope;
- mark another specialist's required review as complete;
- convert NOT VERIFIED into VERIFIED;
- convert BLOCKED into PASS;
- declare production readiness without release evidence.

The Coordinator must enforce these boundaries.

