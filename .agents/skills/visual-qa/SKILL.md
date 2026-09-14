# Visual QA

## Purpose

Inspect the rendered web application in a real browser and verify that its visual appearance, usability, responsiveness, accessibility, and interaction behavior meet the project's requirements.

Visual QA is evidence-based.

Do not judge a UI only from source code.

---

# When to Use

Use this skill for:

* new pages
* dashboard screens
* landing pages
* forms
* tables
* navigation
* dialogs
* cards
* responsive changes
* component changes
* design-system changes
* typography changes
* spacing changes
* animations
* accessibility-sensitive UI
* major frontend refactors

For purely backend changes with no user-visible impact, visual QA may be skipped.

---

# Required Inputs

Before reviewing a UI, identify:

* Project Profile
* selected UI style
* target page
* intended user flow
* relevant design-system rules
* expected viewport classes
* existing visual conventions

When possible, inspect the existing application before judging a new screen.

---

# Phase 1 — Start the Application

## 1. Identify the Start Command

Inspect:

* package.json
* project documentation
* framework conventions
* existing scripts

Use the project's existing development command.

Examples:

```text id="glqxyl"
npm run dev
npm run start
pnpm dev
yarn dev
docker compose up
php artisan serve
```

Do not invent a new application start strategy unnecessarily.

---

## 2. Confirm Application Availability

Confirm:

* application process started
* expected URL is reachable
* expected route loads
* no blocking startup errors exist

Record the relevant local URL.

---

# Phase 2 — Browser Inspection

Use the available browser automation capability.

Navigate to the target screen.

Inspect:

* page rendering
* layout
* navigation
* text
* components
* interactions
* runtime errors
* network failures

Do not consider the page verified merely because it loaded.

---

# Phase 3 — User Flow

Exercise the actual user journey.

Example:

```text id="i9t5p9"
Open dashboard
 ↓
Open customer management
 ↓
Search customer
 ↓
Open customer
 ↓
Edit customer
 ↓
Submit
 ↓
Verify success
```

The actual flow must follow the feature requirements.

Verify:

* navigation
* interaction
* state changes
* feedback
* success behavior
* error behavior

---

# Phase 4 — Visual Inspection

Inspect the rendered UI against the Project Profile.

## Layout

Check:

* alignment
* spacing
* sizing
* container width
* positioning
* whitespace
* overflow
* vertical rhythm
* horizontal rhythm

## Typography

Check:

* font family
* heading hierarchy
* font size
* weight
* line height
* letter spacing
* wrapping
* readability

## Color

Check:

* primary colors
* secondary colors
* text contrast
* borders
* backgrounds
* semantic state colors
* accent usage

## Components

Check:

* buttons
* inputs
* selects
* tables
* cards
* tabs
* dialogs
* navigation
* badges
* alerts
* pagination

---

# Phase 5 — Interaction States

Inspect relevant states:

```text id="5ztsbs"
Default
Hover
Focus
Active
Disabled
Loading
Selected
Success
Error
Empty
```

The exact states depend on the component.

Do not evaluate only the ideal/default state.

---

# Phase 6 — Responsive Inspection

Inspect relevant viewport classes:

```text id="rdx3pe"
Mobile
Tablet
Desktop
```

Use representative dimensions appropriate to the project.

Check:

* navigation
* spacing
* typography
* tables
* forms
* dialogs
* cards
* buttons
* images
* overflow
* wrapping
* touch interactions

Specifically check for:

* horizontal scrolling
* clipped content
* overlapping elements
* unusably small controls
* broken layouts
* excessive whitespace
* unreadable text

---

# Phase 7 — Accessibility Inspection

Check where relevant:

* keyboard navigation
* focus visibility
* tab order
* semantic controls
* accessible names
* labels
* contrast
* touch target size
* dialog behavior
* error communication
* reduced motion

Do not rely solely on automated accessibility checks.

Perform interaction-based verification where appropriate.

---

# Phase 8 — Runtime Inspection

Check for:

* browser console errors
* uncaught exceptions
* failed requests
* failed API calls
* hydration errors
* broken images
* missing resources
* unexpected redirects

A UI that looks correct while producing significant runtime errors should not pass visual QA.

---

# Phase 9 — Visual Critique

Review the interface critically.

Ask:

### Product Fit

Does the interface match the intended product?

### Style

Does it match the selected Project Profile?

### Hierarchy

Can users identify:

* where they are
* what the page is for
* what action matters most

### Usability

Can users understand what to do without unnecessary effort?

### Consistency

Does the UI match:

* existing components
* spacing
* typography
* colors
* interaction patterns

### Polish

Look for:

* awkward spacing
* inconsistent alignment
* strange proportions
* unnecessary decoration
* poor typography
* excessive borders
* excessive shadows
* excessive rounded containers
* excessive animation
* visual noise

Do not add design elements merely to make the interface appear more "AI-generated."

---

# Phase 10 — Design-System Verification

When a design system exists, verify:

* tokens are reused
* components are reused
* spacing is consistent
* variants are consistent
* colors are consistent
* typography is consistent
* states are consistent

Do not create a visually similar replacement for an existing design-system component without justification.

---

# Phase 11 — Evidence

Capture screenshots when practical.

Screenshots should show:

* relevant page
* meaningful UI state
* representative viewport
* enough surrounding context for evaluation

For responsive work, capture representative mobile/tablet/desktop states.

Evidence should support any visual finding reported to the user.

---

# Phase 12 — Fix and Re-Test

If issues are discovered:

1. Identify the issue.
2. Determine the root cause.
3. Fix the implementation.
4. Re-render the application.
5. Repeat the relevant browser flow.
6. Re-inspect the visual result.
7. Confirm the issue is actually resolved.

Do not declare success immediately after editing source code.

---

# Phase 13 — Regression Review

When the change affects shared components:

Inspect other relevant screens using the same component.

Examples:

```text id="ypr1nd"
Shared Button
→ inspect important button usages

Shared Modal
→ inspect important modal usages

Shared Table
→ inspect important table pages

Shared Navigation
→ inspect major application routes
```

The broader the blast radius, the broader the visual regression check.

---

# Phase 14 — Visual QA Result

Produce:

```text id="gfdh2v"
VISUAL QA

Status:
PASS
PASS WITH WARNINGS
FAIL
NOT VERIFIED
BLOCKED

Application:
...

Pages Tested:
...

User Flows:
...

Responsive:
...

Accessibility:
...

Runtime:
...

Visual Findings:
...

Fixes Applied:
...

Evidence:
...

Remaining Issues:
...
```

---

# PASS Criteria

Visual QA may PASS only when:

* target page renders correctly
* intended user flow works
* relevant interactions work
* no important unresolved runtime errors remain
* responsive behavior is acceptable
* visual hierarchy is acceptable
* UI matches the selected style
* design-system consistency is maintained
* accessibility requirements are reasonably satisfied
* relevant issues found during inspection were resolved
* re-testing confirms the fixes

---

# PASS WITH WARNINGS

Use this when:

* required behavior works
* visual quality is acceptable
* no blocking issue remains
* minor non-blocking issues remain

List every warning.

---

# FAIL

Use this when:

* important interactions are broken
* layout is broken
* responsive behavior is broken
* accessibility has a significant issue
* runtime errors affect the feature
* visual problems materially reduce usability
* required user flows fail

---

# NOT VERIFIED

Use this when the required browser/visual checks were not performed.

---

# BLOCKED

Use this when visual verification cannot be performed because of:

* application startup failure
* environment failure
* missing dependency
* unavailable browser
* unavailable test data
* permission issue
* infrastructure issue

Do not convert BLOCKED into PASS.

---

# Core Principle

**Never trust the screenshotless assumption that the UI is good.**

Render it.

Use it.

Inspect it.

Critique it.

Fix it.

Render it again.

**Visual correctness must be demonstrated, not assumed.**
