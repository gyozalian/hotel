# Addendum: Hotel CRM launch details

## 1. Product assumptions and operational model
- The product is sold to independent guest houses and small boutique hotels, not large chains.
- Property owners need a simplified tool that reduces manual work without requiring a dedicated technical admin.
- The primary operational surfaces are booking, room status, guest communication, pricing, and reporting.
- The system should support a modern browser environment with no new hardware or install step.

## 2. Suggested user roles
- Owner/Admin: full access to property settings and financial reporting
- Manager: can edit bookings, pricing rules, and guest records
- Front Desk: can create bookings and update statuses within approved operational limits
- Housekeeping: can update room readiness and acknowledge tasks
- Read-only analyst: can review reports without modification rights

## 3. Operational workflow assumptions
- A booking can come from a direct website, Airbnb, Booking.com, Expedia, or a manually created reservation.
- Channel data is synchronized asynchronously; when a sync fails, the operator must see a visible offline or stale status.
- All major business changes should be auditable by the owner or admin.
- Each room can have a current state and history; that state should update across the dashboard and operational views.

## 4. Key user-facing surfaces
- Dashboard overview: occupancy, ADR, RevPAR, booking alerts, and quick actions
- Booking calendar: room-by-date grid or list with channel badges and conflict visualization
- Room detail: room number, status, guest notes, and action buttons
- Guest profile: stay history, message log, notes, special requests, preferences
- Pricing rules: occupancy threshold, adjustment %, channel scope, and revision history
- Reports: monthly commission summary, channel performance, and trend identification
- Settings: channel connections, property setup, user access, and general configuration

## 5. Non-functional guardrails
- Slow or unsure interactions should be treated as product bugs, not acceptable workflow quirks.
- The app must remain usable on a phone in the middle of an operational shift.
- Automation should be reversible; the owner must be able to override or disable it without losing audited history.
- No action should require deep spreadsheet knowledge or external analysis to interpret the result.

## 6. Roadmap notes for post-v1 work
- Multi-property rollup and portfolio management
- Deeper forecasting and predictive pricing
- Deeper accounting integrations and ERP sync
- Guest portal and self-service digital concierge
- Expanded localization and multilingual support
- Advanced occupancy forecasting and seasonal pricing optimization

## 7. Product validation checklist
- Does the workflow reduce operational time compared with the existing manual process?
- Can the owner understand the dashboard without training?
- Can the staff update room status from the mobile interface during a busy shift?
- Can a direct-booking or channel-booking conflict be resolved quickly and confidently?
- Can the owner reconcile channel costs and revenue without spreadsheets?

## 8. Source references
- `docs/planning-artifacts/product-brief/brief.md`
- `docs/planning-artifacts/ux-designs/design-mocks/design-hotel-crm.md`
- `docs/planning-artifacts/ux-designs/experience-hotel-crm.md`
