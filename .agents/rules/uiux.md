---
trigger: always_on
---

# UI/UX Rules

## Purpose

Create interfaces that are visually polished, usable, accessible, responsive, consistent, and appropriate for the project's product type.

UI quality is not determined by source code alone. The rendered application must be visually inspected and verified.

---

## 1. Design Before Implementation

For non-trivial UI work:

1. Understand the user and task.
2. Identify the user flow.
3. Determine the information hierarchy.
4. Determine the required states.
5. Select an appropriate visual style.
6. Define the component structure.
7. Define responsive behavior.
8. Then implement.

Do not immediately generate a page without understanding its purpose.

---

## 2. Project UI Profile

Every project should have an explicit UI profile when practical.

The profile may specify:

* visual style
* product type
* density
* typography character
* color approach
* corner radius
* elevation
* animation level
* layout preferences
* responsive strategy
* accessibility requirements

Possible visual styles include:

* modern SaaS
* enterprise
* corporate
* minimal
* premium
* dashboard
* mobile-first
* custom

The selected style must remain consistent across the application.

---

## 3. Use the Existing Design System

Before introducing new visual patterns:

1. Inspect the existing design system.
2. Reuse existing tokens.
3. Reuse existing components.
4. Follow established spacing.
5. Follow established typography.
6. Follow established interaction patterns.

Do not create visually similar duplicate components when an existing component is appropriate.

---

## 4. Design System

Where a project uses a design system, define and consistently use:

### Tokens

* colors
* typography
* spacing
* radii
* shadows
* borders
* transitions
* breakpoints
* z-index rules where needed

### Components

* buttons
* inputs
* selects
* dialogs
* dropdowns
* navigation
* tables
* cards
* alerts
* badges
* tabs
* tooltips
* pagination
* forms

Components should have predictable variants and states.

---

## 5. Visual Hierarchy

Every page should communicate hierarchy clearly.

Consider:

* primary action
* secondary actions
* heading hierarchy
* grouping
* spacing
* contrast
* information density
* visual emphasis

Users should be able to identify the purpose of the page and its primary action quickly.

Avoid:

* competing primary actions
* excessive visual noise
* arbitrary decorative elements
* inconsistent emphasis

---

## 6. Layout

Prefer layouts that are:

* intentional
* balanced
* responsive
* consistent
* appropriate to the content density

Use spacing systematically.

Avoid:

* arbitrary margins everywhere
* random element dimensions
* unnecessary container nesting
* accidental alignment
* inconsistent widths

---

## 7. Typography

Typography should provide:

* clear hierarchy
* readable body text
* appropriate line length
* appropriate line height
* consistent font weights
* predictable heading scale

Do not use excessive font sizes or weights merely to create visual impact.

Typography must remain usable across responsive sizes.

---

## 8. Color

Use a coherent color system.

Prioritize:

* semantic meaning
* readability
* contrast
* consistency
* restrained accent usage

Do not assign colors independently to individual components without considering the overall system.

Status colors should have consistent meanings across the product.

---

## 9. Components Must Have States

Interactive components should consider relevant states such as:

* default
* hover
* focus
* active
* disabled
* loading
* success
* error
* selected
* empty

Do not implement only the ideal state.

---

## 10. Forms

Forms should provide:

* clear labels
* understandable grouping
* appropriate input types
* validation
* useful error messages
* loading behavior
* success feedback
* keyboard accessibility

Do not depend solely on placeholder text as a field label.

Errors should clearly explain what needs to be corrected.

---

## 11. Tables and Data-Dense UI

For enterprise and business applications:

Consider:

* readable density
* column hierarchy
* sorting
* filtering
* pagination
* responsive behavior
* empty state
* loading state
* error state
* row actions
* bulk actions where appropriate

Do not make tables visually impressive at the expense of information clarity.

---

## 12. Loading States

Loading states should communicate progress appropriately.

Prefer:

* skeletons when layout stability matters
* meaningful progress indicators for long operations
* disabled controls during submission
* optimistic UI only when safe and understandable

Avoid unnecessary full-page loading screens.

---

## 13. Empty States

Every important collection or dashboard should have an appropriate empty state when applicable.

A useful empty state should communicate:

* what is missing
* why the area is empty when useful
* what the user can do next

Avoid empty spaces with no explanation.

---

## 14. Error States

Errors should be:

* understandable
* actionable
* appropriately placed
* visually distinguishable
* safe to expose

Do not expose raw stack traces or sensitive backend details to users.

---

## 15. Responsive Design

UI must be considered across:

* mobile
* tablet
* desktop
* large desktop where relevant

Do not merely shrink the desktop layout.

Responsive behavior may require changes in:

* navigation
* information density
* table presentation
* controls
* spacing
* content order
* interaction patterns

---

## 16. Accessibility

Accessibility is part of quality, not an optional enhancement.

Consider:

* semantic HTML
* keyboard navigation
* visible focus
* proper labels
* appropriate roles
* color contrast
* touch target size
* screen-reader compatibility
* reduced motion
* error announcements where relevant

Do not use color alone to communicate important information.

---

## 17. Motion

Use animation intentionally.

Animation should:

* communicate state
* provide feedback
* improve continuity
* support understanding

Avoid:

* excessive animation
* animation that delays users
* distracting motion
* decorative animation without purpose

Respect reduced-motion preferences where appropriate.

---

## 18. Mobile Interaction

For touch interfaces:

* use sufficient touch targets
* avoid interactions that require precision
* ensure dialogs fit smaller screens
* avoid hover-only functionality
* keep important actions accessible
* handle keyboard and viewport changes appropriately

---

## 19. UI Implementation Quality

Prefer:

* reusable components
* design tokens
* consistent variants
* semantic structure
* predictable state management
* accessible primitives

Avoid:

* arbitrary inline styling everywhere
* duplicated visual patterns
* inconsistent spacing
* hardcoded magic dimensions
* one-off components that should be shared

---

## 20. Visual Verification

For UI changes, source code review is insufficient.

The agent should, when practical:

1. Start the application.
2. Open the affected screen in a browser.
3. Navigate through the relevant user flow.
4. Inspect the rendered result.
5. Capture screenshots when useful.
6. Check multiple viewport sizes.
7. Compare the result against the selected UI profile and design system.
8. Identify visual and UX problems.
9. Fix the problems.
10. Re-check the rendered result.

Use browser automation and screenshots as evidence.

---

## 21. UI Critique

The UI should be reviewed against:

### Visual

* hierarchy
* spacing
* alignment
* typography
* color
* contrast
* consistency
* density
* visual balance

### UX

* clarity
* discoverability
* flow
* feedback
* error recovery
* cognitive load
* interaction predictability

### Responsive

* mobile layout
* tablet layout
* desktop layout
* overflow
* wrapping
* navigation behavior
* table behavior

### Accessibility

* keyboard navigation
* focus
* labels
* contrast
* semantics
* motion

### Consistency

* buttons
* forms
* navigation
* dialogs
* tables
* spacing
* states

---

## 22. Browser Verification Standard

For meaningful frontend changes, the agent should verify at least the relevant viewport classes:

```text
mobile
tablet
desktop
```

Exact pixel sizes should follow the project or testing strategy.

Do not claim a responsive UI is verified from a single desktop viewport.

---

## 23. UI Regression

When modifying an existing interface:

* preserve existing behavior unless intentionally changed
* check affected shared components
* check sibling pages using shared components
* verify responsive behavior
* verify theme consistency
* verify important states

A shared component change can create regressions elsewhere.

---

## 24. Visual Quality Over AI Decoration

Do not add:

* gradients
* glassmorphism
* excessive rounded containers
* excessive shadows
* excessive animations
* decorative icons
* visual effects

simply because they are common in AI-generated interfaces.

Every visual decision should support the product, user, hierarchy, or brand.

---

## 25. Product-Appropriate Design

Do not use the same visual density for every product.

### Modern SaaS

May emphasize:

* clean hierarchy
* spacious layout
* subtle motion
* strong typography
* clear primary actions

### Enterprise

May emphasize:

* information density
* efficient navigation
* tables
* filters
* predictable interactions
* minimal decorative motion

### Corporate

May emphasize:

* credibility
* clarity
* brand consistency
* restrained visual treatment

### Premium

May emphasize:

* refined typography
* whitespace
* composition
* controlled motion
* high visual consistency

The project profile should determine the final direction.

---

## 26. Design Review Before Final Approval

Before declaring a frontend feature complete, verify:

* Does the UI match the selected project style?
* Is the hierarchy clear?
* Is the primary action obvious?
* Are all important states handled?
* Is it responsive?
* Is it accessible?
* Is it consistent with the existing design system?
* Has it been visually inspected in a browser?
* Were visual issues actually fixed after inspection?

---

## Core UI Principle

The goal is not:

**"Generate a pretty UI."**

The goal is:

**"Create a coherent interface that is appropriate for the product, easy to use, accessible, responsive, visually consistent, and verified in the rendered application."**
