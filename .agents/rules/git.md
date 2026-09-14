---
trigger: always_on
---

# Git Rules

## Purpose

Git changes must remain safe, intentional, reviewable, and reversible.

---

## 1. Protect Existing Work

Before modifying a repository:

* inspect `git status`
* inspect the current branch
* understand existing local changes
* do not overwrite user work
* do not discard changes without approval

Never assume uncommitted changes belong to the current task.

---

## 2. Inspect Before Acting

Before major Git operations, inspect:

```text
git status
git branch
git log --oneline -n 10
```

Understand the current repository state before changing it.

---

## 3. Branch Discipline

Prefer working on an appropriate feature/fix branch rather than directly modifying protected branches.

Do not switch branches if doing so would overwrite or conflict with uncommitted work.

---

## 4. Commits

Commits should be:

* focused
* logically grouped
* understandable
* related to one coherent change

Avoid giant commits containing unrelated work.

Commit messages should describe the actual change.

---

## 5. Never Commit Secrets

Before committing, check for:

* API keys
* passwords
* tokens
* private keys
* production credentials
* `.env` files containing secrets
* generated secret files

If a secret is discovered, stop and report it.

---

## 6. Generated Files

Do not automatically commit generated artifacts such as:

* build output
* caches
* temporary files
* logs
* local environment files

unless the project intentionally tracks them.

Follow the project's `.gitignore` and established conventions.

---

## 7. Before Commit

Run relevant checks:

* tests
* type checking
* linting
* build
* formatting
* security checks

The exact checks depend on the project.

---

## 8. Destructive Operations

Require explicit user approval before executing destructive Git operations such as:

```text
git reset --hard
git clean -fd
git checkout -- <files>
git restore <files>
git push --force
git branch -D
```

Do not use destructive commands merely to make the workspace clean.

---

## 9. History Preservation

Prefer preserving useful project history.

Do not rewrite shared history unless explicitly requested.

Avoid force pushing unless explicitly approved and understood.

---

## 10. Merge and Rebase

Before merge or rebase:

1. inspect the working tree
2. understand the target branch
3. identify possible conflicts
4. ensure important local work is safe

If conflicts appear:

* inspect both sides
* understand intent
* resolve carefully
* run relevant tests afterward

Never blindly choose one side of a conflict.

---

## 11. Pull and Synchronization

Before pulling or rebasing:

* inspect local changes
* inspect current branch
* understand remote state when relevant

Do not blindly overwrite local work with remote changes.

---

## 12. Push

Before pushing:

* confirm the correct remote
* confirm the correct branch
* run relevant verification
* ensure no accidental files are included
* ensure no secrets are present

Production-impacting or protected branches require user approval when appropriate.

---

## 13. Deployment

Git operations associated with production deployment require additional care.

Before deployment:

* verify branch
* verify commit
* verify tests
* verify environment
* verify configuration
* verify rollback strategy where relevant

Do not deploy simply because a commit was created.

---

## 14. Git Status Is Evidence

After meaningful Git operations, verify:

```text
git status
git log
```

Do not claim that a branch switch, commit, merge, rebase, or cleanup succeeded without checking.

---

## Core Principle

**Preserve work.
Understand state.
Make focused changes.
Avoid destructive operations.
Verify before pushing.**
