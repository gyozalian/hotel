---
title: Hotel CRM for guest houses and small hotels
created: 2026-11-03
updated: 2026-11-08
status: final
---

# PRD: Hotel CRM for guest houses and small hotels

## 0. Document Purpose
This PRD defines the launch version of a web-based hotel CRM for small guest houses and boutique hotels. It is intended for product, design, engineering, and operations stakeholders responsible for scope, UX, and delivery. The document aligns with the product brief in `docs/planning-artifacts/product-brief/brief.md` and the UX/UI mock set in `docs/planning-artifacts/ux-designs/`—especially the dashboard, booking calendar, pricing rules, room detail, guest profile, settings, and reports surfaces. The PRD uses a glossary-driven structure, nested functional requirements, explicit assumptions, and MVP scope boundaries so downstream work can be designed without ambiguity.

## 1. Vision
Small guest houses and boutique hotels lose time and money to fragmented operations: separate booking tools, manual pricing adjustments, disconnected guest records, and informal housekeeping workflows. This product replaces that fragmentation with one affordable, browser-based operating system for daily hotel management. It helps owners and managers prevent double-bookings, raise revenue by responding to occupancy changes, personalize guest communication, and coordinate internal teams with less manual overhead.

The core product idea is simple: a property manager should be able to open one dashboard, see the real status of the property, act on bookings and room readiness, and communicate with guests without juggling spreadsheets, channel apps, or several disconnected tools. The system is designed to feel practical and lightweight rather than enterprise-heavy: no new hardware, no local install, no complex implementation burden, and a clear value proposition at a sub-$50/month price point.

## 2. Target User and Core Roles

### 2.1 Primary User
- Property owner or general manager for a small guest house, boutique hotel, or serviced accommodation
- Lives in a fast-moving operational environment with limited admin time
- Needs a single source of truth on room status, bookings, guest communication, and hotel performance

### 2.2 Secondary Users
- Front desk or reservation manager
- Housekeeping staff
- Account/operations coordinator
- Channel or revenue manager (in later phases)

### 2.3 Jobs to Be Done
- Prevent overbooking and channel conflicts
- Quickly update room readiness and coordinate housekeeping
- Make pricing decisions without manual spreadsheets
- View occupancy and revenue status at a glance
- Keep guest history and preferences available for repeat stays
- Send pre-arrival reminders and check-in instructions without constant manual follow-up

### 2.4 Non-Users (v1)
- Large hotel chains with dedicated property management systems
- Properties requiring on-premise or hardware-based systems
- Operators who do not sell through online channels
- Multi-property organizations with complex franchise or brand standards

## 3. User Journeys

### UJ-1. Maria prevents a weekend overbooking
- Persona: Maria, owner of a 7-room guest house in Spain
- Context: She manages direct bookings, Airbnb, and Booking.com manually through her phone
- Entry state: Friday afternoon; multiple channels show overlapping dates for a room
- Path: Maria opens the dashboard, sees a sync warning, resolves the conflict in the booking grid, and updates channel availability
- Climax: She confirms the room is no longer double-booked and protects guest trust
- Resolution: The system logs the correction and updates occupancy and revenue views immediately

### UJ-2. Carlos increases rates for an upcoming busy weekend
- Persona: Carlos, manager of a 15-room boutique hotel in Mexico
- Context: He needs to raise rates without spending time doing manual channel edits
- Entry state: Occupancy is trending above target for the next 3 days
- Path: Carlos opens the pricing rule editor, adds a rule for occupancy thresholds, and saves it
- Climax: The system applies the price change across the relevant channels
- Resolution: Revenue per room rises without manual intervention while the rule remains auditable

### UJ-3. Housekeeper confirms room readiness
- Persona: Ana, housekeeping lead
- Context: There are multiple rooms changing status between departure and next check-in
- Entry state: The departure list is loaded and rooms are being prepared for the next arrival wave
- Path: Ana updates room status from dirty to inspect and then ready
- Climax: The system notifies the next team member and updates the dashboard in real time
- Resolution: The next guest checks in to a clean, ready room with no delay

### UJ-4. Sam reviews monthly commission and property performance
- Persona: Sam, owner/operator who reviews financial performance monthly
- Context: He needs to reconcile booking revenue against channel costs
- Entry state: A month has closed and the property has bookings on Airbnb, Expedia, and direct website
- Path: Sam opens the reports section and reviews channel-level profit, commission, ADR, and RevPAR
- Climax: He can see the real net revenue and identify which channels are most profitable
- Resolution: The property can make channel decisions without spreadsheet reconciliation

## 4. Glossary
- Booking: A guest reservation for one or more nights for a room
- Channel: A booking source or distribution platform such as Booking.com, Airbnb, Expedia, direct website, or WhatsApp-based lead generation
- Double-booking: A room assigned to more than one guest for the same dates in overlapping periods
- ADR: Average Daily Rate = total room revenue / rooms sold
- RevPAR: Revenue per available room = total room revenue / total available rooms
- Guest profile: Unified record containing contact details, travel preferences, stay history, and communication notes
- Room status: The current readiness state of a room (clean, dirty, inspect, ready, out of order)
- Dynamic pricing: Automated rate adjustment based on occupancy, date range, or booking pattern rules
- Channel commission: Fee or cut taken by a distribution platform from booking revenue
- Pre-arrival automation: Automated guest messaging sequence triggered by stay date, booking status, or guest behavior

## 5. Product Scope and Business Constraints
- Web-based only; no native app required in v1
- Responsive design for mobile phones and tablets; desktop parity is expected for operations team workflows
- Zero-install architecture; works in modern browsers
- Price target under $50/month per property
- Must work with the hardware and devices the property already owns
- Must support direct booking flows and online marketplace integrations without requiring a dedicated IT team
- Guest communication must integrate with WhatsApp, email, and other simple channel interactions where available

## 6. Core Platform Features

### 6.1 Booking and Availability Management
**Description:** The system centralizes bookings across multiple booking sources and prevents conflicts before they impact the guest experience.

**Functional Requirements:**

#### FR-1: The system identifies and prevents room conflicts
The property manager can rely on the system to detect overlapping reservations across all connected channels and receive a clear conflict alert.

**Consequences:**
- A booking cannot be saved if it overlaps a currently occupied or reserved room
- The system indicates the source of the conflict and the affected room/date window
- The property manager can override only with explicit admin authorization and audit logging

#### FR-2: The system provides a unified booking calendar
The operator can review daily, weekly, or monthly room occupancy in one place.

**Consequences:**
- Each room displays occupancy and booking source by channel
- Date filtering and room filtering are available
- The calendar is usable on mobile devices and desktop browsers

#### FR-3: The system supports manual booking creation and editing
The operator can create, amend, or cancel bookings from the same operational UI.

**Consequences:**
- New bookings can be added manually when the source is direct or when sync is delayed
- Guest and stay details are editable without leaving the booking workflow
- Booking changes are logged with timestamp and actor

### 6.2 Pricing and Revenue Optimization
**Description:** The system lowers manual work and supports revenue decisions through simple and auditable pricing rules.

#### FR-4: The system allows rule-based pricing adjustments
The manager can configure occupancy-based rules that increase or decrease rates automatically.

**Consequences:**
- Rules can specify threshold values and percentage increase/decrease
- Rules can be scoped to all channels or a selected channel
- Rule outcomes are visible in the pricing dashboard and booking grid

#### FR-5: The system supports preview and audit of pricing actions
The operator can understand why rates changed before or after a rule executes.

**Consequences:**
- Each rule shows state, last execution, and applied date range
- Pricing changes preserve a revision trail for operational review
- Manual overrides remain possible without deleting the automation rule

### 6.3 Guest Profile and Communication
**Description:** Guest data is centralized to improve repeat stays and reduce manual follow-up friction.

#### FR-6: The system stores a unified guest profile for repeat stays
The property can retrieve each guest's contact details, preferences, transaction history, and notes from one place.

**Consequences:**
- Guest lookup supports name, phone, or email
- Profiles show check-in history, room preferences, service notes, and communication records
- Profiles are permissioned so staff only see what they are allowed to access

#### FR-7: The system sends booking confirmations and pre-arrival messaging
The property can send booking and stay communications through approved channels from one guest context.

**Consequences:**
- Staff can send or trigger guest messages from booking or guest profile context
- Message history is visible per booking and per guest
- Messaging is sent through WhatsApp or email depending on guest preference or system configuration

#### FR-8: The system tracks guest replies and follow-up actions
The property can easily respond to guest questions and service requests without leaving the booking workflow.

**Consequences:**
- Guest replies are surfaced inside the booking or guest profile view
- Staff can convert a reply into a follow-up task or internal note
- Communication outcomes are visible in guest history

### 6.4 Housekeeping and Operations Coordination
**Description:** Staff can manage room readiness and operational status without a separate tool or spreadsheet.

#### FR-9: The system supports room status updates
Staff can mark rooms as clean, dirty, inspect, ready, or out of order.

**Consequences:**
- Status changes are visible in real time to the operations team
- Status adjustments are timestamped and attributed to a staff member
- Status history is retained for operational review and troubleshooting

#### FR-10: The system notifies housekeeping when rooms are ready
The property can automatically send or surface housekeeping notifications when room status changes.

**Consequences:**
- Housekeeping receives a clear task and room reference
- Staff can acknowledge readiness and mark the task complete
- The dashboard reflects the updated status immediately

### 6.5 Reporting, Finance, and Performance
**Description:** The system surfaces the key performance indicators that matter to small property operators without requiring a full analytics stack.

#### FR-11: The dashboard shows occupancy, ADR, RevPAR, and channel performance
The property owner can see operational performance in a single summary screen.

**Consequences:**
- Dashboard cards display occupancy, ADR, RevPAR, revenue trend, and channel mix
- Metrics are filterable by date range
- Channel-level and overall metrics remain comparable on the same view

#### FR-12: The system calculates commission and net revenue by channel
The owner can review the property's true revenue after platform fees.

**Consequences:**
- Each booking shows gross rate, platform fee, and net revenue
- Commission reports show totals by channel and month
- CSV export enables finance or accounting reconciliation

### 6.6 Automation Workflows
**Description:** Automation is a separate operational module for repeatable guest and internal workflows.

#### FR-13: The system provides a dedicated automation module
The property can configure and manage automations separately from manual guest communication and daily operations views.

**Consequences:**
- Automation center includes templates, triggers, and timing rules for guest-facing and internal notifications
- Rules support common triggers such as booking created, pre-arrival windows, check-out completed, and room-ready events
- Each automation can be activated, paused, edited, or duplicated without deleting historical runs

#### FR-14: The system tracks automation execution and fallback behavior
The property can monitor whether automations ran, failed, or were skipped, and can recover from failed runs safely.

**Consequences:**
- Each automation run records status, timestamp, target, and delivery channel
- Failed automations surface clear error states and retry options
- Critical workflows can define fallback behavior (for example, fallback to email if WhatsApp delivery fails)

### 6.7 User Management and Access Levels
**Description:** User management and access governance are separate from general property settings and include explicit access levels.

#### FR-15: The system supports user authentication and managed user accounts
The property administrator can create, disable, and manage user accounts for all staff who access the system.

**Consequences:**
- User lifecycle includes invite/create, activate, suspend, and remove states
- Login sessions and failed access attempts are recorded where appropriate
- Password reset and account recovery are available through admin-approved workflows

#### FR-16: The system enforces role-based access levels
The property administrator can assign and change access levels that control what each user can view and edit.

**Consequences:**
- Access levels include owner/admin, manager, front desk, housekeeping, and read-only reporting access
- Permission boundaries prevent unauthorized edits to rates, settings, automations, or guest records
- Sensitive actions (rate rules, user-role changes, channel settings) are restricted to authorized access levels only

### 6.8 Admin and Basic System Configuration
**Description:** The application must include the core property-level setup needed to run day-to-day operations safely.

#### FR-17: The system allows property-level setup and channel connection management
The admin can configure property details and connect the channels relevant to the business.

**Consequences:**
- Property name, settings, currency, and room inventory are editable
- Channel sync status is visible and actionable
- When a channel is offline or disconnected, status is shown to reduce false certainty

#### FR-18: The system produces basic audit logs
The platform retains enough operational history to support dispute resolution and internal accountability.

**Consequences:**
- Booking changes, pricing edits, room-status updates, and guest communication actions are logged
- Audit records show what changed, by whom, and when
- The log supports basic troubleshooting and owner review

## 7. UX and Design Alignment
The product design work already defines the key operational surfaces that must be present in v1:
- Dashboard overview with KPI cards and quick actions
- Booking grid or calendar with room cards and channel badges
- Room detail view with room history and status actions
- Guest profile with stay history and notes
- Automation center for templates, triggers, and delivery monitoring
- Pricing rule editor for occupancy-based dynamic pricing
- Reports surface with commission and performance summaries
- Settings view for channels, property configuration, and user access
- User management and access levels view for account and permission administration

These screens should be treated as the required UX baseline for launch. They are not optional visual enhancements; they are the operational workflow for the product and should be reflected in engineering delivery planning.

## 8. Non-Functional Requirements
- Performance: dashboard and booking grid must load quickly on modern mobile and desktop browsers
- Accessibility: color is not the only signal; status labels, keyboard support, and screen-reader-friendly actions are required
- Reliability: booking and room-status changes must persist and sync without data loss under normal connectivity conditions
- Security: role-based access and minimal permissioning are required; guest data must be protected from unauthorized access
- Auditability: major business events must be traceable to a user and a timestamp
- Responsiveness: UI must remain usable in phone/tablet layouts with clear tap targets and dense task flows
- Maintainability: the feature set should be structured so deeper analytics, multi-property expansion, or more advanced automation can be added later

## 9. MVP Scope

### In-Scope for v1
- Unified booking calendar and availability management
- Dynamic pricing rules with occupancy-based logic
- Unified guest profiles and communication history
- Separate automation module for pre-arrival messaging and operational triggers
- Housekeeping task coordination and room-status updates
- Reporting for occupancy, ADR, RevPAR, channel revenue, and commission
- User management with access levels and permission boundaries
- Property settings, channel status management, and basic governance
- Web-first responsive customer experience for existing devices

### Out of Scope for v1
- Native iOS/Android apps
- Multi-property portfolio management
- Advanced predictive revenue forecasting or machine learning
- Deep accounting or ERP integrations
- Guest portal or customer self-service app
- Multi-language support beyond the initial English-language deployment

## 10. Success Metrics

### Primary Metrics
- **SM-1: Booking integrity** — 99.5% or higher of bookings are created without conflict, measured weekly
- **SM-2: Revenue uplift** — properties using pricing rules report at least 5% RevPAR improvement within 90 days of activation
- **SM-3: Guest retention** — guest records support repeat-stay behavior and personalized follow-up with measurable lift in return stays
- **SM-4: Operational efficiency** — room turnover time and manual communication effort decrease by at least 20-30% after activation

### Secondary Metrics
- **SM-5: Commission accuracy** — channel fee reconciliation aligns with actual payouts within a small tolerance band
- **SM-6: Dashboard engagement** — property owners review the reporting dashboard at least monthly and use channel insights to make operational decisions

### Counter-Metrics
- **CM-1:** Do not maximize occupancy at the cost of guest satisfaction or overbooking pressure
- **CM-2:** Do not automate so much that staff lose direct operational control or override capabilities

## 11. Open Questions and Key Assumptions
1. What is the sustainable monthly price per property while staying under the <$50 target?
2. Which WhatsApp or business messaging model is most pragmatic for small properties in the target market?
3. What level of accounting export is required for month-end reconciliation?
4. How variable is connectivity quality across the intended property locations?
5. What is the likely technical sophistication of the average property owner/operator?
6. What are the most common channel commission structures and booking fee variations in the target market?
7. Do some properties expect SMS, WhatsApp, or email as their default guest communication channel?

## 12. Risks and Release Guidance
- Channel API reliability varies; sync status and manual recovery paths must be first-class experiences
- Pricing automation can create poor outcomes if thresholds are not clear to the operator
- Guest communication quality can be damaged if the system over-automates without staff review
- Going too broad in v1 would create product complexity and slow operational adoption

The right release posture is a focused v1 that solves the daily hotel operations problem without creating a complex enterprise platform. This product should feel like a dependable operating tool, not a replacement for a full PMS or ERP.

---

This PRD is aligned to the brief and UX mock set and should be treated as the launch baseline for product definition and engineering planning.
