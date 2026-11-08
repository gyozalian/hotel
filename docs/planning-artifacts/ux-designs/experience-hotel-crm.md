---
name: hotel-crm-experience
description: User experience design for hotel CRM application
status: draft
---
# hotel-crm — Experience Spine

Web application, responsive layout (mobile-first, then tablet, then desktop parity). Consumer posture, business-focused by default. Paired with `design-hotel-crm.md` (DESIGN.md). Demonstrates: information architecture, user flows, state patterns, and key screen designs. Responsive design principles applied throughout.

## Foundation

Web application, responsive layout (mobile-first, then tablet, then desktop). No native system UI — inherits browser conventions for navigation, form elements, and dynamic type. `design-hotel-crm.md` is the visual identity reference; this spine is the experience and interaction design.

## Information Architecture

| Surface | Reached from | Purpose |
|---|---|---|
| Dashboard | Top app bar (default landing) | Occupancy, ADR, RevPAR overview + quick actions |
| Calendar / Booking Grid | Dashboard or left navigation | Real-time booking view across all channels with synchronization status |
| Room Detail | Room card tap/click | Individual room view with status, history, and actions |
| Guest Profile | Guest search or profile link | Unified guest record with preferences, stay history, communication notes |
| Pricing Rules | Dashboard → Pricing tab | Dynamic pricing rule engine with occupancy-based thresholds |
| Commission Tracking | Dashboard → Reports tab | Monthly reconciliation report with gross/commission/net by channel |
| Housekeeping Coordination | Dashboard → Staff tab | Room status updates and housekeeping notifications |
| Settings | Top app bar → Settings | Property configuration, channel connections, user permissions |

Bottom navigation (mobile) or sidebar (desktop) primary destinations:
- **Today/Calendar** — Current booking situation and immediate actions
- **Bookings** — Full booking list and grid view
- **Guests** — Guest profile management
- **Reports** — Dashboard and commission reports
- **Settings** — Property and channel configuration

## Voice and Tone

Microcopy. Brand voice and aesthetic posture live in `design-hotel-crm.md`.

| Do | Don't |
|---|---|
| "Today's occupancy" | "How's your occupancy today?" |
| "Save booking" | "Booking saved successfully ✓" |
| "Channel offline" | "Connection lost — retrying" |
| "Add pricing rule" | "Configure dynamic pricing" |
| Short, complete sentences for status messages. | Lengthy explanations, streak counters, encouragement, exclamation marks in error states. |

## Component Patterns

Behavioral. Visual specs live in `design-hotel-crm.md.Components`.

| Component | Use | Behavioral rules |
|---|---|---|
| Booking grid cell | Calendar view | Tap/click selects room; shows current channel badges and rate; tap opens room detail |
| Status pill | Room card, grid header | Color-coded; tap opens status change modal/flow |
| Pricing rule card | Pricing rules engine | Hover reveals edit/delete; clicking opens rule editor; new rule form opens in modal |
| Commission summary card | Reports dashboard | Hover reveals detailed breakdown; click opens monthly reconciliation view |
| Room status form | Housekeeping coordination | Field: room number (read-only), status dropdown; submit shows confirmation banner |
| Guest search | Guest profile management | Typing filters results; select guest opens profile in current view or modal |
| Date range picker | Calendar, reports, pricing | Standard calendar component; pre-sets: Today, This Week, This Month, Custom range |

## State Patterns

| State | Surface | Treatment |
|---|---|---|
| Cold open | Dashboard | Shows latest occupancy stats, quick-add booking button, recent activity preview |
| No bookings | Booking grid | "No bookings yet — add your first booking" CTA; guest can add manual entry or connect channels |
| Channel offline | Booking grid | Channel badge shows subtle warning overlay; booking still visible but sync status noted |
| Loading | Any surface | Skeleton loaders matching component anatomy; spinners for async operations |
| Error | Any surface | Inline error message + recovery action button; never block primary task flow |
| Success | Any surface | Brief confirmation banner (3-5 seconds) then dismisses automatically |
| Empty state | Guest list, booking filters | Guides user toward next action with clear CTA and context |
| Focus | Composer, input fields | Native browser outline enhanced with corner radius accent color on focus |

## Interaction Primitives

- Tap/click to act on booking cells, room cards, status pills, CTA buttons
- Drag to adjust (e.g., occupancy threshold slider for pricing rules)
- Swipe right on room card to quick-mark status (mobile)
- Pull-to-refresh on booking grid and dashboard (mobile and desktop)
- Keyboard navigation throughout; focus visible on all interactive elements
- Esc key closes modals, dropdowns, and overlays; returns focus to triggering element

## Key Flows

### Flow 1 — Check-in Day: Maria reviews weekend bookings (evening before)

1. Maria opens the CRM web app on her phone or laptop. Dashboard loads as default.
2. Today/Calendar surface shows occupancy overview: 3 rooms booked for weekend, total capacity 7 rooms.
3. She taps the Booking Grid surface to see detailed view across Booking.com, Airbnb, and direct website.
4. Color-coded channel badges appear on each room card. No conflicts shown (green status).
5. She taps a room card to open Room Detail. Confirmation: no double-bookings, rates correct.
6. **Climax:** She taps "Mark Ready" for rooms that will be vacant; housekeeping receives automatic notification.
7. Confirmation banner: "3 rooms marked ready — housekeeping notified."

Failure: Channel shows offline banner → Maria sees which channels need manual sync; she can still manually adjust availability.

### Flow 2 — Occupancy Adjustment: Carlos adjusts pricing for high-occupancy weekend (Wednesday evening)

1. Carlos opens the CRM web app. Dashboard shows current occupancy: 65% across all channels.
2. He navigates to Pricing Rules tab. Current rules displayed as cards: "Increase 10% if occupancy > 70%."
3. He taps "Add Pricing Rule." Form opens with fields: Rule name, Occupancy threshold (> %), Rate adjustment (+ %).
4. He sets threshold to 70%, adjustment to +10%. System validates and saves rule.
5. **Climax:** Rule activates immediately. System evaluates every hour. Weekend rates auto-adjust when occupancy crosses 70%.
6. Confirmation: "Pricing rule saved — will auto-adjust rates when occupancy > 70%."
7. He views Dashboard. RevPAR trend sparkline shows upward movement as bookings come in at new rates.

Failure: Rule save fails validation → error message explains threshold must be 0-100%, adjustment -50% to +200%.

### Flow 3 — Guest Follow-up: System sends pre-arrival automation

1. A guest books a 3-night stay on Booking.com.
2. System automatically creates guest profile (or updates existing) with basic info, stay dates, channel source.
3. 48 hours before arrival: System sends WhatsApp booking confirmation (if guest has WhatsApp) or email.
4. 24 hours before arrival: System sends check-in instructions, parking info, local area tips, contact for issues.
5. 12 hours before arrival: System sends any required documents (if applicable).
6. **Climax:** Guest responds to WhatsApp with special request (e.g., late check-out). Property staff see notification in CRM → can fulfill request.
7. Confirmation: "Pre-arrival messages sent — guest can respond via reply channel."

Failure: Guest has no WhatsApp → system falls back to email; CRM shows "Confirmation sent via email" badge on guest profile.

### Flow 4 — Housekeeping Coordination: Staff updates room status during turnover

1. Housekeeper opens CRM on phone or terminal in housekeeping area.
2. Dashboard shows room status overview. She taps a room to quick-select.
3. Status pill changes from "Clean" → "Inspect" → "Ready" via dropdown selection.
4. System timestamps the change and identifies which staff member made it.
5. Real-time update visible to all authorized staff accessing the system.
6. Notification sent to housekeeping team when room is marked "ready" — includes room number, property section, any special notes from previous guest.
7. Housekeeper acknowledges receipt and updates status accordingly.
8. **Climax:** Next guest checks in to clean, ready room. No wait time, positive experience.

Failure: Staff loses connection → change queues locally, syncs when connection restored. Audit log records all changes with timestamps and user IDs.

## Empty States

| Surface | Empty State Message | CTA |
|---|---|---|
| Booking grid (no bookings) | "No bookings yet — add your first booking" | "Connect Channel" button → guides through Booking.com/Airbnb/Expedia connection |
| Guest list (no guests) | "No guests yet — start by adding a new guest" | "Add Guest" button → opens guest profile form |
| Pricing rules (no rules) | "No pricing rules yet — add your first rule to start auto-adjusting rates" | "Add Pricing Rule" CTA opens rule editor |
| Commission report (no month) | "No reconciliation data yet — bookings will appear here as they come in" | N/A — data populates with bookings |
| Guest search (no matches) | "No matches found — try a different name or contact info" | Refine search or "Add new guest" |

## Accessibility Floor

Behavioral. Visual contrast lives in `design-hotel-crm.md`.

- VoiceOver / TalkBack: every interactive element labeled with role + state. Status pills announce color and text (e.g., "Green, Clean").
- Dynamic type honored through `design-hotel-crm.md` typography tokens. UI must remain legible at largest setting — no truncated controls.
- Reduce Motion: skip save-indicator fade; show confirmation banner immediately.
- Tap targets ≥ 44px (mobile) / 48px (desktop) minimum hit area.
- Focus traversal follows reading order on every surface.
- Color is not the only means of conveying information (status pills also use text labels: "Clean", "Dirty", etc.).
- Error messages provide clear action text for recovery.

## Inspiration & Anti-patterns

- **Lifted from hotel property apps:** the booking grid with channel badges and real-time sync status.
- **Lifted from hospitality dashboards:** KPI cards with sparklines and trend indicators.
- **Rejected — Complex PMS interfaces:** property management systems that require dedicated IT support and on-premise installation. This is web-only, zero-install.
- **Rejected — Manual spreadsheet tracking:** over-reliance on manual rate changes and commission calculations. Automation is key.
- **Rejected — Guest-facing portals:** v1 is staff/admin-facing only. Guest portal considered for v2.

## Key Screens (mockups promoted at finalize)

Typically 2-4 load-bearing surfaces Promoted at Finalize:
1. **Dashboard at rest** — KPI overview with quick actions, channel status indicators
2. **Booking grid at rest** — Room cards with channel badges, current status, rates
3. **Room detail view** — Individual room with full information, history, and action buttons
4. **Pricing rule editor** — Add/edit dynamic pricing rule form with occupancy threshold and rate adjustment

These mockups illustrate the spine's component patterns, state patterns, and flow steps so future designers and developers have visual reference.
