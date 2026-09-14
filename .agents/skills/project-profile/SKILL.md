# Project Profile

## Purpose

Load and apply the project's engineering configuration before making significant technical or product decisions.

The Project Profile defines:

* project type
* technology stack
* architecture philosophy
* quality requirements
* UI/UX direction
* testing requirements
* security requirements
* infrastructure
* approval requirements
* AI capabilities

The profile provides project context. It does not override explicit user instructions or project-specific rules.

---

# 1. Locate the Project Profile

When operating inside a project, look for:

```text
.project/project-profile.yaml
```

If it does not exist, check whether a project-specific profile exists elsewhere in the repository.

Do not assume a profile exists.

---

# 2. Profile Loading

Before substantial feature planning, architecture decisions, UI implementation, or infrastructure work:

1. Locate the active Project Profile.
2. Read it.
3. Extract relevant settings.
4. Apply those settings to the current task.

Do not repeatedly reload the profile unnecessarily when its contents have not changed.

---

# 3. Profile Sections

The profile may contain:

```text id="6w24a1"
project
engineering
frontend
backend
mobile
database
infrastructure
ui
testing
approval
ai
```

Only relevant sections need to influence a specific task.

---

# 4. Project Identity

Read:

```yaml
project:
  name:
  type:
  description:
```

Use `project.type` to understand the product context.

Possible types include:

* landing_page
* corporate_website
* internal_business_system
* saas
* pos
* flutter_app
* custom_client_app
* ai_application

The actual project type should come from the active profile.

---

# 5. Engineering Configuration

Read:

```yaml
engineering:
  quality:
  philosophy:
  scalability:
  maintainability:
  testing:
  security:
```

Use these values to determine the expected engineering standard.

For example:

```text id="u2kl57"
quality: strict
philosophy: pragmatic-clean
scalability: high
maintainability: high
```

means:

* quality requirements are strict
* architecture should remain pragmatic
* maintainability is important
* reasonable scalability should be considered

Do not interpret "high scalability" as permission to over-engineer the system.

---

# 6. Frontend Configuration

Read:

```yaml
frontend:
  framework:
  language:
  styling:
  components:
  state_management:
  ui_style:
```

Use these settings when designing frontend architecture and selecting relevant skills.

Examples:

```text id="gpt1g5"
framework: nextjs
language: typescript
styling: tailwind
components: shadcn
```

The implementation should follow the project's actual installed versions and existing conventions.

Do not blindly install dependencies simply because a profile mentions a technology.

---

# 7. Backend Configuration

Read:

```yaml
backend:
  framework:
  language:
  api_style:
  authentication:
```

Use these values when planning backend changes.

Inspect the actual repository before assuming the configured framework is implemented exactly as described.

---

# 8. Mobile Configuration

Read:

```yaml
mobile:
  framework:
  language:
  state_management:
```

Apply when working on mobile functionality.

Verify the real project dependencies and architecture before implementation.

---

# 9. Database Configuration

Read:

```yaml
database:
  primary:
  secondary:
  cache:
```

Use this to identify the intended data infrastructure.

Do not automatically introduce every database or cache listed in the profile.

A database should only be used when the feature requires it.

---

# 10. Infrastructure Configuration

Read:

```yaml
infrastructure:
  hosting:
  containerization:
  cdn_dns:
  ci_cd:
  monitoring:
```

Use this to guide deployment and operational planning.

Infrastructure changes still require approval according to the project's approval settings and conservative-approval rules.

---

# 11. UI Configuration

Read:

```yaml
ui:
  style:
  density:
  responsive:
  accessibility:
  visual_qa:
  animation:
```

These values define the intended visual quality.

For example:

```text id="6c9tqk"
style: enterprise
density: comfortable
responsive: true
accessibility: strict
visual_qa: required
animation: subtle
```

means UI implementation should use an enterprise-oriented visual language with comfortable information density, responsive behavior, strict accessibility, required browser/visual verification, and restrained animation.

---

# 12. Testing Configuration

Read:

```yaml
testing:
  unit:
  integration:
  e2e:
  browser:
  visual:
```

Translate each setting into an implementation requirement.

Possible values include:

* required
* recommended
* optional
* disabled

Never report a required check as passed if it was not performed.

---

# 13. Approval Configuration

Read:

```yaml
approval:
  architecture:
  database:
  security:
  major_dependencies:
  infrastructure:
  deployment:
```

These values determine which categories require explicit user approval.

The conservative-approval rule remains authoritative for safety-sensitive operations.

---

# 14. AI Configuration

Read:

```yaml
ai:
  providers:
  agents:
  mcp:
```

Use this to determine whether AI-specific capabilities are expected.

Possible providers may include:

* openai
* gemini

Do not expose API keys or provider credentials.

---

# 15. Profile and Repository Consistency

The profile is configuration, not proof.

Before implementation:

Compare important profile settings against the actual repository.

Examples:

```text
Profile says:
Next.js

Repository shows:
Next.js project

→ consistent
```

or:

```text
Profile says:
PostgreSQL

Repository shows:
MySQL

→ mismatch
```

When a significant mismatch exists:

1. Identify it.
2. Do not silently rewrite the project to match the profile.
3. Determine whether the profile is outdated or the repository differs intentionally.
4. Report the mismatch.
5. Update the profile only with appropriate approval.

---

# 16. Profile Priority

When information conflicts, use this priority:

```text
Explicit current user instruction
        ↓
Project-specific rules
        ↓
Current repository reality
        ↓
Project Profile
        ↓
Engineering OS defaults
        ↓
General assumptions
```

Do not allow a stale profile to override the actual project.

---

# 17. Profile Selection

For reusable presets:

```text
.project/presets/
```

may contain profiles such as:

```text
landing-page.yaml
internal-business-system.yaml
saas.yaml
flutter-app.yaml
ai-application.yaml
custom-client-app.yaml
```

A preset is a starting point.

When creating a project from a preset:

1. Copy the preset.
2. Customize project-specific settings.
3. Verify against the actual repository.
4. Treat the resulting project profile as the project's active configuration.

---

# 18. No Profile

If no profile exists:

For simple tasks, continue using repository conventions and Engineering OS rules.

For substantial tasks, recommend creating a profile before making major architectural decisions.

Do not invent a detailed profile silently.

---

# 19. Profile Changes

Changing important profile values can change architecture, testing, security, or deployment behavior.

Examples:

```text
database
backend framework
authentication
quality level
security level
deployment platform
UI style
testing requirements
```

Material profile changes should be explicitly communicated to the user.

---

# 20. Profile-Aware Planning

Feature planning should explicitly use the active profile.

A substantial feature plan should be able to state:

```text
Project Type:
...

Frontend:
...

Backend:
...

Database:
...

UI Style:
...

Testing Requirements:
...

Security Requirements:
...

Approval Requirements:
...
```

This confirms that the plan is based on actual project configuration.

---

# 21. Profile-Aware Skill Selection

Use the profile to determine which skills are relevant.

Example:

```text id="1l6t83"
Next.js project
→ React / Next.js skills
→ UI/UX skills
→ Browser QA
→ Web design guidelines

Flutter project
→ Flutter skills
→ Dart skills
→ mobile testing
→ responsive UI

Laravel project
→ Laravel skills
→ API skills
→ database skills
→ security
```

Do not load or apply unrelated technology guidance merely because it exists in the Engineering OS.

---

# 22. Profile-Aware Quality

The profile determines the expected quality level.

For strict projects:

* verification is required
* tests are required
* browser QA is required for applicable UI
* security review is required for sensitive changes
* production-readiness assessment is required

For simpler projects, requirements may be reduced appropriately.

Do not lower a project's quality requirements merely to finish faster.

---

# 23. Output

When useful, report:

```text id="qy2v3f"
PROJECT PROFILE

Type:
...

Stack:
...

Architecture:
...

UI:
...

Testing:
...

Security:
...

Infrastructure:
...

Approval:
...
```

Only report values that were actually read from the active profile.

---

# Core Principle

**The Project Profile provides context, not authority.**

Use it to make decisions consistent with the project.

Verify it against reality.

Do not let stale configuration override the repository.

Do not silently change important project requirements.
