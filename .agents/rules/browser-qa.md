---
trigger: always_on
---

# Browser QA Rules

## Purpose

Browser QA verifies the behavior and rendered appearance of web applications in a real browser environment.

For meaningful frontend changes, source code inspection alone is not sufficient evidence.

The browser is an active verification tool.

---

## 1. When Browser QA Is Required

Browser QA is required for meaningful changes involving:

* pages
* layouts
* navigation
* forms
* dialogs
* tables
* dashboards
* authentication flows
* user interactions
* responsive behavior
* loading states
* empty states
* error states
* animations
* visual design
* accessibility-sensitive interactions

Pure backend changes may not require browser verification unless the change affects a user-visible flow.

---

## 2. Browser QA Principle

Use this sequence:

```text
IMPLEMENT
   ↓
RUN APPLICATION
   ↓
OPEN BROWSER
   ↓
NAVIGATE
   ↓
INTERACT
   ↓
VERIFY BEHAVIOR
   ↓
INSPECT VISUAL RESULT
   ↓
CHECK RESPONSIVE STATES
   ↓
CAPTURE EVIDENCE
   ↓
FIX ISSUES
   ↓
RE-TEST
```

Do not stop after the first successful page load.

---

## 3. Starting the Application

Before browser testing:

1. Identify the correct development/start command.
2. Check whether the application is already running.
3. Avoid starting duplicate servers unnecessarily.
4. Confirm the application is reachable.
5. Record the local URL and relevant port.

Prefer existing project scripts over inventing new commands.

Examples may include:

```text
npm run dev
npm run start
php artisan serve
docker compose up
flutter run
```

Use the project's documented commands where available.

---

## 4. Existing User Changes

Before starting or modifying the application environment:

* inspect current working state
* do not overwrite user changes
* do not reset the repository
* do not kill unrelated processes without justification
* do not modify environment configuration unnecessarily

Destructive environment changes require approval.

---

## 5. Browser Session

Use a dedicated browser session for verification when practical.

Maintain enough state to test:

* authentication
* navigation
* forms
* permissions
* persistent preferences

Do not reuse sensitive personal browser sessions unnecessarily.

---

## 6. Navigation Verification

Verify that the relevant page:

* can be reached
* loads without blocking errors
* displays expected content
* uses the expected URL
* preserves navigation behavior
* handles direct navigation appropriately

For authenticated pages, verify the expected authentication behavior.

---

## 7. User Flow Verification

Test the actual user journey rather than isolated screenshots.

Example:

```text
Login
 ↓
Dashboard
 ↓
Customer Management
 ↓
Create Customer
 ↓
Submit
 ↓
Success Feedback
 ↓
Customer Appears in List
```

Verify each meaningful transition.

---

## 8. Interaction Verification

Exercise relevant interactions such as:

* clicking
* typing
* selecting
* submitting
* opening dialogs
* closing dialogs
* filtering
* searching
* sorting
* pagination
* expanding/collapsing
* editing
* deleting where safe
* keyboard navigation

Verify both intended results and important failure behavior.

---

## 9. Form Verification

For forms, test:

### Valid Input

Expected submission succeeds.

### Invalid Input

Validation appears appropriately.

### Missing Input

Required fields are handled correctly.

### Submission State

Loading state is visible where appropriate.

### Failure

Server or network errors produce useful feedback.

### Success

Success feedback is clear and the UI updates correctly.

Where appropriate, test duplicate submissions and rapid interactions.

---

## 10. Authentication Verification

For authenticated applications, verify relevant states:

```text
Unauthenticated
Authenticated
Unauthorized
Session expired
Invalid credentials
```

Do not expose sensitive credentials in browser evidence.

---

## 11. Authorization Verification

When roles or permissions matter, verify behavior using representative user states.

Example:

```text
Admin
→ can perform action

Manager
→ can perform permitted actions

Regular User
→ cannot access restricted action

Unauthenticated
→ cannot access protected route
```

UI hiding is not sufficient evidence of authorization.

---

## 12. Console and Runtime Errors

During browser QA, inspect for:

* JavaScript errors
* uncaught exceptions
* failed network requests
* failed API calls
* broken resources
* hydration errors
* accessibility warnings where relevant
* unexpected runtime warnings

Do not ignore console errors simply because the page appears visually correct.

---

## 13. Network Verification

When relevant, inspect:

* failed requests
* unexpected status codes
* duplicate requests
* excessive requests
* slow requests
* malformed payloads
* incorrect response handling

For important interactions, verify that the frontend is communicating with the intended backend/API.

---

## 14. Visual Verification

Inspect the rendered page for:

### Layout

* alignment
* spacing
* container width
* sizing
* overflow
* positioning

### Typography

* font family
* hierarchy
* size
* weight
* line height
* wrapping

### Color

* background
* text
* borders
* accents
* semantic states
* contrast

### Components

* buttons
* forms
* cards
* tables
* dialogs
* navigation
* alerts
* badges

### Interaction States

* hover
* focus
* active
* disabled
* loading
* selected
* error
* success

---

## 15. Responsive Verification

Verify relevant viewport classes:

```text
Mobile
Tablet
Desktop
```

At minimum, inspect the layouts that are important to the target product.

Check:

* horizontal overflow
* navigation behavior
* text wrapping
* controls
* tables
* dialogs
* cards
* buttons
* spacing
* images
* touch interaction

Do not claim responsive support based on CSS inspection alone.

---

## 16. Visual Evidence

For meaningful visual verification, capture screenshots when practical.

Screenshots should show:

* the affected page
* relevant UI state
* relevant viewport
* enough surrounding context to judge the layout

For responsive changes, capture representative viewport states.

Use screenshots as evidence for visual findings.

---

## 17. UI Critique

After rendering the feature, critique it against:

### Product Fit

* Does the visual design fit the selected Project Profile?

### Hierarchy

* Is the primary action obvious?
* Is important information visually prioritized?

### Consistency

* Does it match existing components?
* Are spacing and typography consistent?

### Usability

* Can users understand what to do?
* Is feedback clear?
* Is error recovery understandable?

### Responsiveness

* Is the layout appropriate across viewports?
* Is content still usable on smaller screens?

### Accessibility

* Can keyboard users operate it?
* Are focus states visible?
* Are labels and semantics appropriate?
* Is contrast sufficient?

### Polish

* Are alignment and spacing deliberate?
* Are there visual bugs?
* Are there awkward transitions?
* Are there unnecessary decorative elements?

---

## 18. Visual Regression

When changing an existing interface:

1. Identify affected pages/components.
2. Verify the target change.
3. Inspect related pages using the same shared components.
4. Compare expected behavior and appearance.
5. Investigate unintended changes.

Shared component changes should receive broader visual verification.

---

## 19. Error-State Verification

Do not verify only the happy path.

Where relevant, test:

```text
Loading
Empty
Success
Validation Error
Server Error
Network Failure
Unauthorized
Not Found
Permission Denied
```

Make sure each state is understandable and visually appropriate.

---

## 20. Accessibility-Oriented Browser QA

Where applicable, verify:

* keyboard navigation
* tab order
* focus visibility
* dialog focus behavior
* labels
* buttons/links
* interactive controls
* semantic elements
* zoom behavior
* visible error messaging

Automated accessibility tools can assist but do not replace interaction-based verification.

---

## 21. Browser Debugging

When a browser test fails:

1. Reproduce the failure.
2. Identify whether the problem is frontend, backend, data, browser state, or environment.
3. Inspect console output.
4. Inspect network activity where relevant.
5. Identify the root cause.
6. Fix the root cause.
7. Re-run the failing flow.
8. Re-run relevant regression checks.

Do not randomly modify multiple files until the browser appears to work.

---

## 22. Browser Performance Signals

When performance is relevant, inspect:

* slow navigation
* long network requests
* excessive requests
* large resources
* layout instability
* unnecessary rendering
* delayed interaction
* excessive client-side work

Do not claim performance improvements without evidence.

---

## 23. Browser Safety

Do not perform destructive actions against real production systems during ordinary browser QA.

Use:

* local development
* test environments
* safe test accounts
* test databases

If a test could cause irreversible data loss, stop and request approval or use a safe test environment.

---

## 24. Browser QA Completion Gate

Before marking browser QA as passed, determine:

```text
Application Started       PASS / FAIL
Target Page Loaded        PASS / FAIL
User Flow                 PASS / FAIL
Interactions              PASS / FAIL
Console Errors            PASS / FAIL
Network Errors             PASS / FAIL / N/A
Responsive QA             PASS / FAIL / N/A
Visual QA                 PASS / FAIL
Accessibility QA          PASS / FAIL / N/A
Error States              PASS / FAIL / N/A
Regression Checks         PASS / FAIL / N/A
Evidence Captured         PASS / FAIL / N/A
```

Only mark PASS when the check was actually performed.

---

## 25. Browser QA Status

Use:

### PASSED

Required checks passed with supporting evidence.

### PASSED WITH WARNINGS

Required checks passed but non-blocking issues remain.

### FAILED

One or more required checks failed.

### NOT VERIFIED

Required verification was not performed.

### BLOCKED

Verification could not be performed because of an external blocker.

---

## Core Browser QA Principle

**A web application is not fully verified until the rendered application has been exercised and inspected.**

Code can be correct while the user experience is broken.

Therefore:

**Serve it.
Open it.
Use it.
Inspect it.
Capture evidence.
Fix it.
Use it again.**
