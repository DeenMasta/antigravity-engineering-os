# Database Architect

## Purpose

Design and review data architecture for applications using relational databases, document databases, and caching systems.

Supported technologies include:

* PostgreSQL
* MySQL
* MongoDB
* Redis

The goal is data architecture that is:

* correct
* consistent
* maintainable
* secure
* queryable
* testable
* performant
* scalable when justified

---

# When to Use

Use this skill for:

* new database-backed features
* new tables or collections
* schema changes
* migrations
* data relationships
* indexing
* query optimization
* caching
* data integrity
* multi-database architecture
* large datasets
* database performance issues
* data migrations
* reporting architecture

For purely frontend changes without data implications, this skill may be skipped.

---

# Phase 1 — Understand the Existing Database

Before proposing changes, inspect:

* database type
* schema
* tables/collections
* relationships
* constraints
* indexes
* migrations
* ORM models
* existing query patterns
* transaction usage
* caching
* data ownership

Do not create a new structure without understanding existing data architecture.

---

# Phase 2 — Understand Requirements

Identify:

* entities
* attributes
* relationships
* ownership
* lifecycle
* read patterns
* write patterns
* expected data volume
* concurrency
* consistency requirements
* retention requirements
* security requirements

Separate:

```text id="j41j4a"
Explicit requirements
Assumptions
Unknowns
```

Do not invent business requirements.

---

# Phase 3 — Choose the Appropriate Database

Select storage based on actual requirements.

## PostgreSQL

Consider for:

* relational business systems
* complex relationships
* strong consistency
* transactions
* reporting
* advanced SQL
* structured application data

## MySQL

Consider for:

* conventional relational applications
* established Laravel applications
* transactional business systems
* environments where MySQL is already standardized

## MongoDB

Consider when:

* document-oriented data is genuinely useful
* schema flexibility is valuable
* document retrieval matches the application model

Do not choose MongoDB merely because schema flexibility sounds convenient.

## Redis

Use for appropriate:

* caching
* ephemeral state
* queues
* rate limiting
* short-lived data
* distributed coordination where justified

Do not treat Redis as the default primary database for durable business data.

---

# Phase 4 — Data Modeling

For relational databases, determine:

* tables
* columns
* data types
* primary keys
* foreign keys
* unique constraints
* check constraints
* nullability
* default values
* timestamps
* soft deletion where justified

For document databases, determine:

* document boundaries
* embedding
* referencing
* collection structure
* document size
* update patterns
* duplication trade-offs

---

# Phase 5 — Relationships

Determine:

* one-to-one
* one-to-many
* many-to-many
* hierarchical
* polymorphic where justified

For every relationship, identify:

* ownership
* lifecycle
* deletion behavior
* integrity expectations

Avoid ambiguous ownership.

---

# Phase 6 — Normalization

For relational data:

Prefer normalization when it improves:

* integrity
* consistency
* maintainability
* update safety

Consider denormalization only when there is a clear reason such as:

* known read performance requirements
* reporting workloads
* specialized query patterns

Document significant denormalization decisions.

Do not denormalize preemptively.

---

# Phase 7 — Primary Keys

Choose primary keys based on:

* framework conventions
* data volume
* distributed requirements
* public exposure requirements
* indexing characteristics

Consider:

* auto-increment integers
* UUIDs
* ULIDs
* domain-specific identifiers

Do not choose identifiers based solely on trends.

---

# Phase 8 — Constraints

Use database constraints when appropriate for critical integrity.

Consider:

* NOT NULL
* UNIQUE
* FOREIGN KEY
* CHECK
* generated values
* referential actions

Application validation and database constraints should complement each other.

---

# Phase 9 — Indexing

Indexes should be based on actual query patterns.

Consider indexes for:

* frequently filtered columns
* joins
* sorting
* uniqueness
* lookup keys

Avoid:

* indexing every column
* redundant indexes
* unused indexes

For every important index, understand:

* target query
* expected benefit
* write overhead
* storage cost

---

# Phase 10 — Query Design

For important queries, consider:

* filtering
* joins
* pagination
* ordering
* aggregation
* selected columns
* eager loading
* N+1 behavior
* execution plan where appropriate

Prefer retrieving only the data actually required.

Avoid:

* unbounded queries
* unnecessary joins
* repeated database calls
* accidental N+1 queries

---

# Phase 11 — Transactions

Use transactions when multiple operations must succeed or fail together.

Consider transaction boundaries carefully.

Do not keep transactions open longer than necessary.

Identify:

* atomic operations
* rollback behavior
* concurrency
* locking requirements

---

# Phase 12 — Concurrency

For important concurrent operations, consider:

* race conditions
* lost updates
* duplicate writes
* unique constraints
* locking
* optimistic concurrency
* idempotency

Examples:

```text id="ot3bpl"
Inventory decrement
Payment state change
Order creation
Seat booking
Quota allocation
```

Do not assume sequential execution in a multi-user system.

---

# Phase 13 — Soft Deletes

Use soft deletion only when the product actually needs:

* recovery
* historical visibility
* auditability
* preservation of relationships

Do not use soft deletes automatically everywhere.

Consider how soft deletion affects:

* uniqueness
* relationships
* queries
* reporting
* storage growth

---

# Phase 14 — Audit and History

For business systems, determine whether important entities require:

* created timestamps
* updated timestamps
* deleted timestamps
* actor information
* change history
* audit events

Do not create full audit infrastructure when simple timestamps are sufficient.

---

# Phase 15 — Security

Review:

* database credentials
* access privileges
* row-level access where appropriate
* sensitive fields
* encryption requirements
* backups
* logs
* data exposure
* migration access

Never expose database credentials to clients.

---

# Phase 16 — Caching

When using Redis or another cache, define:

* what is cached
* cache key
* TTL
* invalidation strategy
* consistency model
* fallback behavior

Caching without an invalidation strategy is incomplete architecture.

Prefer cache-aside or another deliberate strategy appropriate to the application.

---

# Phase 17 — Redis

For Redis, determine whether it is being used for:

* cache
* queues
* rate limiting
* sessions
* ephemeral state
* distributed locking

Never use Redis as durable source-of-truth data unless the architecture intentionally supports that behavior.

---

# Phase 18 — MongoDB

When using MongoDB, explicitly decide:

* embedding vs referencing
* document lifecycle
* duplication strategy
* index strategy
* update patterns
* document size
* consistency requirements

Do not reproduce a relational schema inside MongoDB without considering document-oriented access patterns.

---

# Phase 19 — Data Lifecycle

Determine:

* creation
* updates
* archival
* deletion
* retention
* backups
* restoration
* historical requirements

For large datasets, consider how storage will grow over time.

---

# Phase 20 — Migration Design

Before schema changes, determine:

* migration sequence
* compatibility
* existing data impact
* backfill strategy
* downtime risk
* rollback
* deployment order

Prefer backward-compatible migrations for production systems where practical.

---

# Phase 21 — Production Migration Safety

For important production migrations:

Consider:

* lock duration
* table size
* migration runtime
* concurrent traffic
* backward compatibility
* rollback limitations
* staged deployment

High-risk migrations require explicit approval.

---

# Phase 22 — Multi-Database Systems

If a project uses multiple databases:

Document:

```text id="xck2a8"
Database
 ↓
Purpose
 ↓
Data ownership
 ↓
Read/write responsibility
 ↓
Consistency requirements
```

Avoid storing the same authoritative data in multiple systems without a clear synchronization strategy.

---

# Phase 23 — Performance

Investigate with evidence.

Consider:

* query execution plans
* indexes
* query count
* connection pool usage
* cache hit rate
* data volume
* large result sets
* pagination
* slow queries

Do not introduce speculative database optimization.

---

# Phase 24 — Testing

Database-related tests should cover where relevant:

* migrations
* relationships
* constraints
* validation
* authorization
* transactions
* concurrency
* important queries
* cache behavior
* rollback behavior

Tests should reflect actual risk.

---

# Phase 25 — Database Review Output

Produce:

```text id="p3u5t7"
DATABASE DESIGN
===============

Database:
...

Purpose:
...

Entities:
...

Relationships:
...

Schema:
...

Indexes:
...

Constraints:
...

Transactions:
...

Caching:
...

Security:
...

Migration:
...

Performance:
...

Risks:
...

Alternatives:
...

Approval Required:
...
```

---

# Phase 26 — Approval Gate

Explicit user approval is required before implementing significant database architecture changes involving:

* new database systems
* destructive schema changes
* major relationship changes
* large data migrations
* data ownership changes
* significant indexing strategy changes
* new persistent storage systems

Routine additive schema changes inside an approved plan may proceed when risk is low.

---

# Core Principle

**Model the data around real business requirements and access patterns.**

Prefer:

**correct data → clear ownership → strong integrity → appropriate indexes → measurable performance → justified scalability**

Avoid:

**premature optimization → excessive denormalization → unnecessary databases → unexplained complexity**
