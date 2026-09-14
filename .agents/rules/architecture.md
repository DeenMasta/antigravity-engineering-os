---
trigger: always_on
---

# Architecture Rules

## Purpose

Design systems that are:

* maintainable
* understandable
* scalable when justified
* testable
* secure
* operationally practical

Use pragmatic clean architecture rather than blindly applying an architectural pattern.

---

## 1. Start With the Existing System

Before proposing architecture changes:

1. Inspect the existing project structure.
2. Identify the current architectural style.
3. Identify module boundaries.
4. Identify data flow.
5. Identify authentication and authorization boundaries.
6. Identify existing reusable infrastructure.
7. Identify conventions already established by the project.

Do not redesign the system before understanding it.

---

## 2. Architecture Must Match Project Complexity

Use the simplest architecture that can safely support the expected requirements.

### Simple Project

Prefer:

* straightforward modules
* simple data flow
* minimal abstractions
* framework-native patterns

Do not introduce complex architectural layers without justification.

### Medium Project

Consider:

* clear feature/module boundaries
* service boundaries
* reusable domain logic
* explicit API contracts
* dedicated validation
* clear database boundaries

### Large / Long-Lived Project

Consider:

* bounded modules
* strong separation of responsibilities
* explicit domain boundaries
* well-defined interfaces
* independent testability
* clear infrastructure boundaries
* scalability strategies
* observability
* background processing
* caching
* resilience

Complexity must be justified by actual requirements.

---

## 3. Prefer Feature-Oriented Organization

When the framework and project type allow it, group related functionality by feature/domain rather than creating large global folders organized only by technical type.

Prefer concepts such as:

```text
customers/
orders/
inventory/
authentication/
reporting/
```

over unnecessarily fragmented structures such as:

```text
controllers/
services/
repositories/
helpers/
utils/
```

The actual organization must follow the framework and existing project conventions.

---

## 4. Separation of Concerns

Separate responsibilities when doing so improves clarity and testability.

Examples:

* UI presentation
* user interaction
* application logic
* domain/business logic
* persistence
* external integrations
* infrastructure

Do not create a separate class or layer merely to satisfy an architectural pattern.

---

## 5. Dependency Direction

Prefer dependencies that move toward stable abstractions and core business behavior.

Avoid:

* circular dependencies
* UI directly controlling persistence details
* domain logic tightly coupled to infrastructure
* database-specific behavior leaking unnecessarily across unrelated layers

Keep infrastructure replaceable where that provides meaningful value.

---

## 6. Business Logic Placement

Business rules should have a clear and predictable home.

Do not scatter important business rules across:

* controllers
* UI components
* database queries
* random helpers
* event handlers
* duplicated validation logic

Keep business behavior close to the domain or application layer appropriate to the project's architecture.

---

## 7. API Architecture

For APIs:

* define clear resource boundaries
* validate input at the boundary
* authorize access explicitly
* use consistent response structures
* handle errors consistently
* avoid leaking internal implementation details
* define predictable pagination/filtering/sorting behavior where relevant

Consider API versioning when the project has external consumers or long-lived contracts.

Do not create versioning complexity for purely internal APIs without a real requirement.

---

## 8. Database Architecture

Before changing a schema:

1. Understand current tables and relationships.
2. Identify ownership of data.
3. Identify constraints.
4. Identify indexes.
5. Identify query patterns.
6. Consider concurrency and consistency requirements.
7. Consider migration and rollback implications.

Prefer database constraints for invariants that genuinely belong at the database layer.

Do not rely exclusively on application validation for critical integrity rules.

---

## 9. Scalability

When considering scalability, evaluate:

* traffic
* concurrent users
* data volume
* request frequency
* database workload
* file/storage requirements
* background jobs
* external service dependencies
* failure modes

Do not add distributed systems, microservices, queues, event buses, or caching merely because they are considered "scalable."

Introduce them when the workload or business requirements justify them.

---

## 10. Modular Monolith Preference

For many business applications, prefer a well-structured modular monolith before considering microservices.

A modular monolith should have:

* clear feature boundaries
* controlled dependencies
* explicit interfaces where necessary
* isolated business logic
* testable modules

Consider microservices only when there is a concrete reason such as:

* independent scaling requirements
* independent deployment requirements
* organizational boundaries
* technology isolation
* fault isolation
* independently evolving domains

---

## 11. State Management

For frontend and mobile systems:

Choose the simplest state strategy that handles the actual requirements.

Distinguish between:

* local UI state
* server state
* shared application state
* persistent state
* derived state

Avoid putting all state into one global store by default.

Avoid duplicating server state into client state without a clear reason.

---

## 12. Caching

Caching should have:

* a clear purpose
* a defined invalidation strategy
* an understood consistency model
* measurable benefit where practical

Never add caching without considering invalidation and stale-data behavior.

---

## 13. Background Processing

Use background jobs when work is:

* slow
* expensive
* retryable
* asynchronous by nature
* not required for immediate user response

Examples:

* email delivery
* report generation
* large imports
* image processing
* external API synchronization
* scheduled processing

Do not introduce queues simply because the application has a backend.

---

## 14. External Integrations

Isolate third-party integrations behind clear boundaries where appropriate.

Examples:

```text
Application
    ↓
Integration Interface
    ↓
Provider Adapter
    ↓
External API
```

Do not allow provider-specific behavior to spread throughout the entire application.

External integrations should have:

* timeout handling
* error handling
* retry policy where appropriate
* logging
* observability
* secrets management

---

## 15. Authentication and Authorization

Treat authentication and authorization as separate concerns.

Authentication answers:

> Who are you?

Authorization answers:

> What are you allowed to do?

Authorization should be enforced at the appropriate backend/server boundary and must not rely solely on UI restrictions.

For systems with roles and permissions, define permissions explicitly rather than scattering role checks throughout the codebase.

---

## 16. Configuration and Secrets

Separate:

* source code
* environment configuration
* secrets
* deployment configuration

Never hardcode:

* passwords
* API keys
* tokens
* private keys
* production credentials

Use the platform's appropriate secret/configuration mechanism.

---

## 17. Observability

Production systems should have appropriate:

* logging
* error reporting
* metrics
* health checks
* tracing where justified

The level of observability should match system criticality.

Do not build an enterprise observability platform for a simple static website.

---

## 18. Reliability

For systems that depend on external services, consider:

* timeouts
* retries
* idempotency
* graceful failure
* fallback behavior
* circuit breaking where justified
* queue retry policies
* duplicate-request handling

Do not add resilience patterns without understanding their failure modes.

---

## 19. Data Flow Must Be Explicit

For non-trivial features, be able to explain:

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

If data flow is difficult to explain, reconsider the architecture.

---

## 20. Architecture Decisions

For significant architectural decisions, document:

* problem
* context
* options considered
* chosen approach
* why it was chosen
* trade-offs
* consequences

Prefer short decision records over large architectural documents when the decision is straightforward.

---

## 21. Migration Strategy

When improving an existing architecture:

Prefer incremental migration over unnecessary full rewrites.

A migration plan should consider:

1. compatibility
2. coexistence
3. migration sequence
4. rollback
5. data migration
6. deployment risk
7. testing

Never replace a functioning production architecture wholesale without justification.

---

## 22. Architecture Approval Gate

User approval is required before implementing a change that materially affects:

* system architecture
* module boundaries
* database architecture
* authentication architecture
* infrastructure architecture
* deployment architecture
* major dependencies
* public API contracts

The proposal should clearly identify the impact and trade-offs.

---

## 23. Architecture Review Checklist

Before implementation of a substantial feature, verify:

### Structure

* Are responsibilities clearly separated?
* Are boundaries understandable?
* Are dependencies reasonable?

### Maintainability

* Will another developer understand this?
* Is the abstraction justified?
* Is duplication controlled?

### Scalability

* Will this architecture handle the expected workload?
* Are obvious bottlenecks addressed?
* Are scaling mechanisms justified?

### Reliability

* What happens when dependencies fail?
* Are timeouts and retries appropriate?
* Is important work recoverable?

### Security

* Where are authentication and authorization enforced?
* Are trust boundaries clear?
* Is sensitive data protected?

### Operations

* Can the feature be monitored?
* Can errors be diagnosed?
* Can it be deployed and rolled back safely?

### Complexity

* Is there unnecessary architecture?
* Could the same result be achieved more simply?

---

## Core Architecture Principle

Prefer:

**simple → modular → testable → maintainable → scalable when justified**

Avoid:

**simple → immediately over-engineered → difficult to maintain**

Architecture exists to solve real problems, not to demonstrate architectural knowledge.
