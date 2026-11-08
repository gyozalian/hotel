# Timeline Interactive Components — Component Specification

## Overview
This document details all interactive components of the 30-day booking timeline, including hover states, drag-to-adjust, filter toggles, today button, and empty states. All components follow the **Hospitality First / Practical Clarity** design system from `design-hotel-crm.md`.

---

## 1. Timeline Strip

### 1.1 Visual Structure
- **Container**: `.timeline-container` with `overflow-x: auto`, custom scrollbar hidden, `border-radius: var(--rounded-md)`, padding `calc(var(--spacing-unit) * 2) 0`
- **Strip**: `.timeline-strip` with `display: flex`, `gap: var(--spacing-unit)`, `padding-bottom: calc(var(--spacing-unit) * 2)`, `min-width: calc(30 * 32px)` (960px for 30 days)
- **Day cell**: `.timeline-day` with `flex-shrink: 0`, `width: 32px`, `height: 32px`, `position: relative`, `cursor: pointer`

### 1.2 States & Visual Variants

| State | CSS Classes | Visual Changes | Interaction |
|-------|-------------|----------------|-------------|
| **Default** | `.timeline-day` | Background: `var(--surface-container)`, text color: `var(--on-surface-variant)`, border-radius: `var(--rounded-sm)` on hover only | None |
| **Hover** | `.timeline-day:hover` | Transform: `scale(1.08)`, background highlight via subtle shadow | Tooltip/booking slots reveal on sustained hover (>300ms) |
| **Today** | `.timeline-day.today` | Vertical indicator: `::before` pseudo-element, 2px wide, full height, color: `var(--primary)`, positioned at `left: 50%`, `transform: translateX(-50%)` | None (permanent marker) |
| **Keyboard Focus** | `.timeline-day:focus-visible` | Outline: `2px solid var(--primary)`, outline-offset: `2px`, background: `var(--primary-fixed-dim)` | Move focus to adjacent day with ArrowLeft/ArrowRight |
| **Active/Select** | `.timeline-day:active` | Transform: `scale(0.98)` — press feedback | Book slot selection/drag start |
| **Reduced Motion** | `@media (prefers-reduced-motion: reduce)` | All transitions set to `none`, no scale/hover animations | Accessibility compliance |

### 1.3 Booking Slot Visuals
- **Slot**: `.timeline-booking` positioned `absolute` at `bottom: 0`, `height: 24px`, `border-radius: var(--rounded-sm)`
- **Channel Coding**:
  - Booking.com: `background: var(--primary)` (#59452B)
  - Airbnb: `background: var(--secondary)` (#A43B2C)
  - Expedia: `background: var(--tertiary)` (#374A5F)
  - Direct: `background: var(--primary-container)` (#735C41)
- **Tooltip**: `.timeline-booking.tooltip` with `border: 1px solid var(--on-primary-container)`, `padding: 2px 4px`, visible on hover/focus

### 1.4 Accessibility
- Each `.timeline-day` has `tabindex="0"` and `role="tab"` with descriptive `aria-label` (e.g., "Day 4, Today")
- Channel tooltips have `title` attribute for hover/focus reveal
- Reduced-motion media query disables all non-essential animations
- Minimum 44px tap target: day cells are 32px square + interactive padding via hit-area

---

## 2. Drag-to-Adjust Interaction

### 2.1 Interaction Flow
1. **Press**: User clicks/taps on a `.timeline-booking` slot
2. **Drag**: Mouse/finger moves horizontally across day cells
3. **Drop**: User releases to adjust booking duration
4. **Visual Feedback**: Slot moves with cursor, ghost outline follows

### 2.2 Drag State Classes

| State | Classes | Visual Changes |
|-------|---------|----------------|
| **Drag Start** | `.timeline-booking.dragging` | `opacity: 0.8`, `box-shadow: 0 0 0 2px var(--primary-fixed)`, cursor: `grabbing` |
| **Drag Over Adjacent Day** | `.timeline-day.hover-under-cursor` | Background highlight: `var(--surface-variant)`, temporary booking preview |
| **Drop Valid** | `.timeline-booking.dropped` | Snap to new position, subtle checkmark/confirm for 1.2s, then revert if invalid |
| **Drop Invalid** | `.timeline-booking.invalid-drop` | Shake animation (`transform: translateX(-5px)` then `+5px` then back), border glow `var(--error)` |

### 2.3 Invalid Drop Scenarios
- Dropping on a day that would exceed maximum stay (e.g., beyond day 30)
- Dropping overlapping an existing booking without merging
- Dropping on a day with `status: out-of-order` rooms

### 2.4 Accessibility
- Drag operations respect keyboard activation (Space/Enter on selected booking)
- ARIA live region announces duration change: `aria-live="polite"` on container
- Escape key cancels drag, returns slot to original position
- All drag interactions have corresponding keyboard alternatives

---

## 3. Today Button

### 3.1 Visual Structure
```html
<button class="today-button" aria-label="Go to today">
    Today <svg ...>
</button>
```

### 3.2 States

| State | Classes | Visual Changes |
|-------|---------|----------------|
| **Default** | `.today-button` | Background: `var(--surface-container)` (#F5F3EE), border: `1px solid var(--outline)` (#D1C4B9), text: `var(--on-surface)` (#1B1C19), font-size: 13px, font-weight: 500 |
| **Hover** | `.today-button:hover` | Border color: `var(--primary)` (#59452B), subtle background transition |
| **Focus** | `.today-button:focus` | Outline: `2px solid var(--primary)`, outline-offset: `2px`, no background color change |
| **Active** | `.today-button:active` | Transform: `scale(0.98)`, press feedback |

### 3.3 Behavior
- Scrolls timeline strip to center the current date (`.timeline-day.today`)
- ARIA `aria-live="polite"` announces "Scrolling to today"
- Persistent display — always visible, not toggled

### 3.4 Accessibility
- Minimum 44px tap target: button is `padding: var(--spacing-unit) var(--spacing-gutter)` = 8px 24px = 32px × 32px approximate hit area
- Focus visible outline meets WCAG 2.1 AA (3:1 contrast minimum)
- Text label clear and unambiguous

---

## 4. Channel Filter Toggles

### 4.1 Visual Structure
```html
<div class="channel-filters" role="tablist" aria-label="Channel filters">
    <button class="filter-button active" role="tab">All</button>
    <button class="filter-button" role="tab">Booking.com</button>
    ...
</div>
```

### 4.2 States

| State | Classes | Visual Changes |
|-------|---------|----------------|
| **Active** | `.filter-button.active` | Background: `var(--primary)` (#59452B), color: `var(--on-primary)` (#FFFFFF), border: `1px solid var(--primary)` |
| **Hover (inactive)** | `.filter-button:hover:not(.active)` | Border color: `var(--on-surface-variant)` (#4E453D), color: `var(--on-surface)` (#1B1C19) |
| **Focus (inactive)** | `.filter-button:focus:not(.active)` | Outline: `2px solid var(--primary)`, outline-offset: `2px`, color: `var(--on-surface)` |
| **Pressed** | `.filter-button:active` | Transform: `scale(0.98)` |

### 4.3 Behavior
- Click filters booking grid and timeline slots by channel
- Active state persists until another filter selected
- "All" button resets to show all channels
- Filter state stored in URL hash or application state (not URL param for v1)

### 4.4 Accessibility
- `role="tablist"` with `role="tab"` on each button
- `aria-controls` pointing to corresponding booking grid region
- `aria-selected` on each button reflecting active state
- Keyboard navigation: ArrowLeft/ArrowRight cycle through filters, Space/Enter activates
- Focus returns to first filter after activation

---

## 5. Booking Grid Cells

### 5.1 Visual Structure
```html
<div class="room-card status-clean">
    <div class="room-number">Room 101</div>
    <div class="channel-badges">...</div>
    <div class="room-status">Clean</div>
    <div class="room-rate">$180/night</div>
</div>
```

### 5.2 Status Variants

| Status | Border Color | BG Accent | Text Color |
|--------|-------------|-----------|------------|
| **Clean** | `3px solid #4caf50` (#4CAF50) | — | `var(--on-surface)` |
| **Dirty** | `3px solid #ff9800` (#FF9800) | — | `var(--on-surface)` |
| **Inspect** | `3px solid #2196f3` (#2196F3) | — | `var(--on-surface)` |
| **Ready** | `3px solid #8bc34a` (#8BC34A) | — | `var(--on-surface)` |
| **Out of Order** | `3px solid #f44336` (#F44336) | — | `var(--on-surface)` |

### 5.3 Channel Badges
- Displayed as small pills above room number
- Background: `var(--surface-variant)` (#E4E2DD), text: `var(--on-surface-variant)` (#4E453D)
- Border-radius: `var(--rounded-sm)`, font-size: 10px, font-weight: 500

### 5.4 Hover States
- `.room-card:hover`: border-color: `var(--on-surface-variant)`, no background shift (maintains clarity)
- Row/column emphasis on focus: `:focus-visible` outlines on grid container

---

## 6. Empty States

### 6.1 Timeline Empty State
When no bookings exist for the 30-day period:
- **Visual**: Gray day cells with minimal numbering, no booking slots rendered
- **Microcopy**: "No bookings in the next 30 days" beneath timeline
- **CTA**: "Add mock booking" or "Connect channel" button

### 6.2 Booking Grid Empty State
When no rooms are configured:
- **Visual**: Full-width message card with illustration/placeholder
- **Microcopy**: "No rooms added yet. Add your first room to begin managing bookings."
- **CTA**: "Add Room" primary button

### 6.3 Filters Empty State
When all channels are filtered out:
- **Visual**: Dimmed timeline days, "No bookings on selected channels" badge
- **Microcopy**: "Showing bookings from selected channels only. Connect more channels to see all bookings."

---

## 7. Tooltip Text Reference

| Trigger | Tooltip Text | Duration | Accessibility |
|---------|-------------|----------|---------------|
| Timeline booking slot hover | "Booking.com: 1 room, $180/night" | Appear after 300ms delay, dismiss on move-away | `title` attribute + `aria-describedby` on focus |
| Today button | "Go to today" | Persistent | Clear label |
| Filter button (active) | "Selected filter" | Persistent | `aria-selected` state |
| Room card hover | "Room 101, Status: Clean, Rate: $180/night" | Immediate on hover | `title` attribute |
| Drag start | "Drag to adjust duration" | Persistent during drag | Live region announcement |

---

## 8. State Variant Summary Table

| Component | States | Key Visual Differences | Accessibility Notes |
|-----------|--------|----------------------|---------------------|
| Timeline Day | Default / Hover / Today / Focus / Active / Reduced Motion | Scale (1.08/0.98), vertical today indicator, outline on focus | Keyboard nav, aria-labels, respect reduced-motion |
| Booking Slot | Default / Hover / Tooltip / Dragging / Dropped / Invalid | Opacity, shadow, border glow, shake animation | DragDrop ARIA live, escape to cancel |
| Today Button | Default / Hover / Focus / Active | Border color change, outline, scale press | 44px target, focus-visible outline |
| Filter Button | Active / Hover / Focus / Pressed | BG color swap (primary vs surface), text color swap, outline | Tablist roles, aria-selected, arrow key nav |
| Room Card | Hover / Status variants | Border color only (no background change) | Focus outlines, status text is screen-reader visible |

---