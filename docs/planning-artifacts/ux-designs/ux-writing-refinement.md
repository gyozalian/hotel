# UX Writing Refinement — Microcopy Across All Journeys

## Overview
This document expands microcopy for empty states, confirmation banners, tooltip text, and journey-specific wording. All copy follows the **Hospitality First / Practical Clarity** voice: clear, concise, empathetic, and action-oriented.

---

## 1. Timeline Microcopy

### 1.1 Empty State
```
Headline: No bookings in the next 30 days
Subcopy: Your booking calendar is empty. Connect channel integrations (Booking.com, Airbnb, Expedia) or add mock bookings to get started.
CTA: [Connect Channels] [Add Mock Booking]
```

### 1.2 Today Indicator Tooltip
```
Text: "Today, [Date]"
Purpose: Confirms the current date position within the 30-day strip
```

### 1.3 Booking Slot Tooltip (Hover/Focus)
```
Format: "{Channel}: {Count} room(s), {Rate}/night"
Examples:
  - "Booking.com: 1 room, $180/night"
  - "Airbnb: 2 rooms, $225/night"
  - "Expedia: 1 room, $195/night"
  - "Direct: 1 room, $180/night"
Show when: Hover for >300ms or focus via keyboard
Dismiss: On cursor/focus move-away or Esc key
```

### 1.4 Drag-to-Adjust Feedback
```
On drag start: "Drag left or right to adjust booking duration"
On drop valid: "Booking duration updated" (snackbar, 2s duration, auto-dismiss)
On drop invalid: "Unable to save — check date availability" (error banner)
```

### 1.5 Filter Button Labels
```
All: "Show all bookings"
Booking.com: "Booking.com bookings"
Airbnb: "Airbnb bookings"
Expedia: "Expedia bookings"
Direct: "Direct bookings"
```

### 1.6 Channel Filter Badge (when no results)
```
Text: "No bookings on selected channels"
Action: "Connect more channels to see all bookings"
```

### 1.7 Confirmation Snackbar (Drag drop)
```
Success: "Booking duration updated"
Error: "Unable to save — check date availability"
```

---

## 2. Dashboard Microcopy

### 2.1 KPI Card Labels
```
Occupancy: "Occupancy"
ADR: "Average Daily Rate"
RevPAR: "Revenue Per Available Room"
Active Bookings: "Active Bookings"
```

### 2.2 Dashboard Section Headings
```
Booking Dashboard: "Booking Dashboard"
Room Status: "Room Status"
Channel Overview: "Channel Overview"
```

### 2.3 Section ARIA Labels
```
Booking Dashboard region: "Booking Dashboard"
KPI region: "Key performance indicators"
Channel filters region: "Channel filters"
Booking grid region: "Room booking grid"
Timeline region: "Booking timeline showing 30 days"
```

---

## 3. Journey-Specific Microcopy

### 3.1 Maria — Hotel Owner (Check-in Day Preparation)
```
Stage 1 — Dashboard Overview:
  Text: "3 rooms booked for weekend, total capacity 7 rooms"
  Subtext: "Only 4 rooms available — good but not overwhelmed"

Stage 2 — Calendar/Grid Navigation:
  Today button aria-label: "Go to today"
  Empty state (no bookings): "No bookings scheduled for today"

Stage 3 — Room Status Check:
  Clean: "Clean — ready for incoming guests"
  Dirty: "Dirty — requires housekeeping attention"
  Inspect: "Inspect — quality check in progress"
  Ready: "Ready — available for check-in"
  Out of Order: "Out of Order — out of service"
```

### 3.2 Carlos — Revenue Manager (Occupancy Adjustment & Pricing)
```
Pricing Tab Header: "Pricing Rules"
Current Occupancy Summary: "65% occupancy across all channels"

Rule Card States:
  Active rule: "Increase 10% if occupancy > 70%"
  Edit button: "Edit rule"
  Delete button: "Delete rule"
  Add rule: "Add pricing rule"

Pricing Adjustment Confirmation:
  Success: "Price updated successfully"
  Error: "Unable to update price — please try again"
```

### 3.3 Housekeeper — Room Status Coordination
```
Shift Start Overview:
  Clean rooms: "{count} rooms clean — ready for check-in"
  Dirty rooms: "{count} rooms dirty — guest checkout pending"
  Inspect rooms: "{count} rooms — quality inspection"

Room Status Buttons:
  Clean: "Mark Clean"
  Dirty: "Mark Dirty"
  Inspect: "Mark Inspect"
  Ready: "Mark Ready"

Confirmation Toast:
  Success: "Room status updated"
  Error: "Failed to update — check connection"

Shift Summary (end of shift):
  Total checkouts: "{count}"
  Total checkins: "{count}"
  Rooms turned over: "{count}"
```

### 3.4 New Owner — Onboarding & First Steps
```
First Login Welcome:
  Headline: "Welcome to your hotel CRM"
  Subheadline: "Manage bookings, room status, and guest communications in one place"
  CTA: "Get Started"

Dashboard Default View:
  KPI Label: "Occupancy"
  KPI Value: "65%"
  Subtext: "Current occupancy across all channels"

Channel Connection Steps:
  Step 1: "Connect your booking channels"
  Step 2: "Sync your room inventory"
  Step 3: "Start managing bookings"

Channel Connection Success:
  Headline: "[Channel] connected successfully"
  Subtext: "Your bookings will appear in the dashboard within minutes"

Empty State (no rooms):
  Headline: "No rooms added yet"
  Subtext: "Add your first room to begin managing bookings"
  CTA: [Add Room]

Feature Discovery Tooltips:
  KPI cards: "Click for details"
  Timeline: "Drag slots to adjust duration"
  Filters: "Filter by booking channel"
```
---

## 4. Confirmation Banner Patterns

### 4.1 Success Banner
```
Background: var(--surface-container-high) (#EAE8E3) with var(--primary) accent border
Icon: Checkmark circle in var(--primary)
Headline: "Success"
Body: "Your changes have been saved."
CTA: [OK] or auto-dismiss after 3 seconds
```

### 4.2 Error Banner
```
Background: var(error-container) (#FFDAD6) with var(--error) accent border
Icon: Error triangle in var(--error)
Headline: "Error"
Body: "Unable to save your changes. Please check your input and try again."
CTA: [Try Again] [Dismiss]
```

### 4.3 Information Banner
```
Background: var(--surface-variant) (#E4E2DD) with var(--tertiary) accent border
Icon: Info circle in var(--tertiary)
Headline: "Information"
Body: "Connect your channel integrations to sync bookings automatically."
CTA: [Got it] or [Connect Channels]
```

---

## 5. Tooltip Accessibility Notes

| Trigger | Copy | Format | ARIA | Dismissal |
|---------|------|--------|------|-----------|
| Booking slot hover | Channel + count + rate | "Booking.com: 1 room, $180/night" | `title` attribute + `aria-describedby` on focus | On move-away or Esc |
| Filter button | Filter name | "Booking.com bookings" | `aria-label` on button | Persistent |
| Today button | "Go to today" | — | `aria-label` on button | Persistent |
| Room card | Room details | "Room 101, Status: Clean, Rate: $180/night" | `title` attribute | On move-away or Esc |

---