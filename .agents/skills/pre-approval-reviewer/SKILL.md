---

name: pre-approval-reviewer
description: Critically review a proposed implementation plan before user approval. Challenge assumptions, architecture, testing, accessibility, security, performance, scope, and unsupported claims.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Pre-Approval Reviewer

## Purpose

Act as a skeptical senior reviewer immediately before a substantial implementation plan is presented for user approval.

Do not redesign the feature from scratch.

Instead:

**Challenge the proposal. Find weaknesses. Demand evidence.**

---

## When to Use

Use this skill before asking the user to approve a substantial implementation plan.

---

# Review Sequence

## 1. Requirement Integrity

Check:

* Does the plan actually solve the requested problem?
* Is any product requirement invented?
* Are assumptions clearly identified?
* Is there unnecessary scope?

Flag claims that are not supported by requirements or repository evidence.

---

## 2. Existing-System Fit

Check:

* Does the proposal respect existing architecture?
* Does it reuse existing components?
* Does it reuse existing services?
* Does it introduce unnecessary new patterns?
* Does it unnecessarily rewrite working code?

Flag deviations that are not justified.

---

## 3. Architecture

Challenge:

* unnecessary abstractions
* unnecessary services
* unnecessary repositories
* unnecessary infrastructure
* premature microservices
* unclear responsibilities
* excessive coupling
* unclear data flow

Ask:

> Is there a simpler architecture that satisfies the same requirements?

If yes, identify it.

---

## 4. Database

When applicable, challenge:

* unnecessary tables
* unnecessary collections
* incorrect relationships
* missing constraints
* missing indexes
* unjustified denormalization
* unsafe migrations
* unnecessary caching
* unclear data ownership

Do not recommend a database change merely because it is technically possible.

---

## 5. API

Challenge:

* unnecessary endpoints
* inconsistent conventions
* missing validation
* missing authorization
* excessive response data
* unnecessary versioning
* inconsistent error handling

---

## 6. UI/UX

Challenge:

* unsupported design assumptions
* unnecessary redesign
* visual inconsistency
* unclear hierarchy
* missing states
* poor responsive behavior
* inaccessible interactions
* unjustified visual complexity

Do not accept claims such as:

> "This will convert better"

unless evidence supports the claim.

Prefer:

> "This may improve clarity"

when it is a design judgment rather than verified evidence.

---

## 7. Accessibility

Never accept claims such as:

> "Accessibility is guaranteed."

unless actual verification supports the statement.

Check for:

* semantic structure
* labels
* keyboard access
* focus visibility
* contrast
* touch targets
* error communication
* reduced motion where relevant

Require browser-based verification where appropriate.

---

## 8. Performance

Challenge claims such as:

* "optimized"
* "fast"
* "no performance impact"
* "best quality"
* "production optimized"

unless evidence exists.

For image optimization, caching, bundle size, database performance, rendering, or network behavior:

1. Identify the claim.
2. Ask what evidence supports it.
3. Require measurement where practical.

Do not optimize blindly.

---

## 9. Testing

Check whether the proposed test strategy matches the change.

For meaningful UI changes, consider:

* unit/component tests where useful
* browser verification
* responsive testing
* visual inspection
* accessibility verification
* runtime error inspection
* regression checks

Build + lint alone are not sufficient evidence for a substantial UI change.

---

## 10. Security

Challenge claims such as:

> "Security risk is zero."

Prefer evidence-based wording.

Check:

* authentication
* authorization
* input handling
* secrets
* data exposure
* external services
* configuration
* file handling

Present "no new security-sensitive surface identified" when appropriate rather than making absolute security claims.

---

## 11. Scope

Identify:

* required work
* optional work
* unrelated work
* speculative improvements

Reject scope creep unless necessary for the approved feature.

---

## 12. Dependencies

Challenge every new dependency:

* Is it necessary?
* Does the project already have equivalent functionality?
* What security implications exist?
* What maintenance burden exists?
* Is its addition actually justified?

---

## 13. Verification

For every important claim, classify it:

```text
VERIFIED
INFERRED
ASSUMED
NOT VERIFIED
BLOCKED
```

Do not allow assumptions to appear as verified facts.

---

# Review Result

Return one of:

## APPROVE

The proposal is sufficiently sound.

## APPROVE WITH CORRECTIONS

The proposal is usable but requires specific corrections before approval.

## REVISE

Significant issues should be corrected before requesting user approval.

## REJECT

The proposal has a fundamental architectural, security, data, scope, or requirements problem.

---

# Required Output

Use:

```text
PRE-APPROVAL REVIEW
===================

Overall:
APPROVE
APPROVE WITH CORRECTIONS
REVISE
REJECT

Strong Points:
...

Issues Found:
...

Unsupported Claims:
...

Architecture:
...

Database:
...

UI/UX:
...

Accessibility:
...

Testing:
...

Security:
...

Performance:
...

Scope:
...

Required Corrections:
...

Evidence Needed:
...
```

---

# Core Principle

**The approval gate should receive a challenged plan, not an unchecked plan.**

Before asking the user to approve:

**Question it.
Challenge it.
Check it.
Then present it.**

## UI Complexity Enforcement

For UI-related plans, actively enforce the Architecture UI Complexity Gate.

Do not approve a plan merely because the resulting interface may look more sophisticated.

Before approval, inspect every proposed:

- Client Component
- abstraction layer
- animation system
- mouse-tracking interaction
- parallax effect
- particle system
- 3D effect
- browser-dependent interaction
- new UI dependency
- reusable component introduced for a single use case

For each item, require explicit justification:

1. User problem solved.
2. Why a simpler implementation is insufficient.
3. Performance implications.
4. Accessibility implications.
5. Maintenance implications.
6. Consistency with the Project UI Profile.

### Complexity Review Decision

Mark the plan as **REVISE** when:

- visual effects are included primarily for novelty;
- multiple Client Components are introduced without a demonstrated client-side requirement;
- abstractions are introduced without reuse or architectural justification;
- animation complexity is disproportionate to the feature;
- browser APIs are used without a real UX requirement;
- the proposed solution is materially more complex than a simpler viable alternative.

Mark the plan as **APPROVE** only when the complexity is justified by the actual product requirement and the simpler alternative has been considered.

### Preferred UI Decision Order

Evaluate UI solutions in this order:

1. Typography
2. Layout and composition
3. Spacing and hierarchy
4. Imagery and content
5. Color and contrast
6. Restrained motion
7. Interactive effects
8. Advanced visual effects

Do not move to a more complex level merely because it is visually possible.

### Client Component Gate

A Client Component must have a demonstrated requirement for:

- client-side state;
- browser APIs;
- event-driven interaction;
- animation requiring runtime interaction; or
- another verified client-only capability.

A Client Component must not be introduced solely because it makes component organization feel cleaner.

### Dependency Gate

For every new UI dependency, determine:

- why the dependency is required;
- whether the existing stack can solve the problem;
- bundle/performance impact;
- maintenance cost;
- accessibility implications;
- compatibility with the installed framework version.

Reject unnecessary dependencies.

### Evidence Standard

Do not accept unsupported claims such as:

- "this will improve conversion";
- "this will improve performance";
- "this is more accessible";
- "this is production ready";
- "this is better for scalability"

unless the plan identifies the supporting evidence.

Use these labels:

- VERIFIED
- INFERRED
- ASSUMED
- NOT VERIFIED
- BLOCKED

Unsupported claims must not be presented as facts.

### Final UI Review Question

Before requesting user approval, answer:

> Is this the simplest architecture that can satisfy the actual product, interaction, visual, accessibility, and performance requirements?

If the answer is no, revise the plan before requesting approval.

## Change Scope and Blast Radius Gate

Every implementation plan must define the expected change scope before approval.

The plan must identify:

1. Files expected to be created.
2. Files expected to be modified.
3. Files expected to be deleted or replaced.
4. Systems or modules affected.
5. Dependencies affected.
6. Configuration affected.
7. Database or API surfaces affected, when applicable.
8. Expected regression areas.

### Blast Radius Assessment

Classify the expected blast radius as:

- LOW
- MEDIUM
- HIGH
- CRITICAL

Explain why the classification was chosen.

Examples:

**LOW**
A self-contained UI component with no shared-state or API changes.

**MEDIUM**
A shared component, layout, authentication flow, or common service is modified.

**HIGH**
Multiple application layers, shared infrastructure, database schema, or major API contracts are affected.

**CRITICAL**
Production infrastructure, security boundaries, destructive data operations, authentication/authorization foundations, or irreversible migrations are involved.

### No Unrelated Refactors

Do not include unrelated:

- file reorganizations;
- component rewrites;
- dependency upgrades;
- formatting changes;
- architecture migrations;
- naming cleanups;
- database changes;
- configuration changes;
- performance rewrites.

unless they are required for the requested feature.

A discovered improvement is not automatically part of the feature scope.

Record unrelated improvements separately rather than silently implementing them.

### Expected Change Boundary

Before implementation, define an expected change boundary.

The implementation should normally remain inside that boundary unless new evidence requires expansion.

If implementation reveals that additional files or systems must change:

1. Explain why.
2. Reassess the blast radius.
3. Determine whether the change remains within approved scope.
4. Request re-approval when the change is materially larger than approved.

### Expected vs Actual Changes

After implementation, compare the actual Git diff against the approved expected change boundary.

Check for:

- unexpected files;
- unrelated refactors;
- unexpected dependencies;
- unexpected configuration changes;
- unexpected database changes;
- unexpected API changes;
- unexpected deletion or replacement.

Unexpected changes must be investigated before the feature is considered complete.

### Scope Decision

Before approval, answer:

> What is the smallest set of changes required to satisfy this feature?

If the proposed implementation changes significantly more than that set, return **REVISE** and require scope reduction or explicit justification.

### Git Evidence

Use Git as evidence of the actual implementation scope.

The final review must inspect:

- git status;
- git diff;
- changed file list;
- dependency/configuration changes.

Do not claim that implementation stayed within scope without checking the actual changes.
