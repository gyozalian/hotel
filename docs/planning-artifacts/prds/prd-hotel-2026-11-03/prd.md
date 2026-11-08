---
title: CRM application for guest houses and small hotels
created: 2026-11-03
updated: 2026-11-03
status: final
---

# PRD: CRM application for guest houses and small hotels
*Working title — confirm.*

## 0. Document Purpose
[1 paragraph: who this PRD is for (PM, stakeholders, downstream workflow owners), how it's structured (Glossary-anchored vocabulary, features grouped with FRs nested, assumptions tagged inline and indexed). If UX work or other inputs already exist, name them here and reference where they live — this PRD builds on them, it does not duplicate.]

This PRD defines the minimum viable CRM application for small guest houses and hotels, targeting owners/managers who need affordable, web-based property management with booking platform integration. Structured with glossary-anchored vocabulary, features grouped with functionally nested requirements, and assumptions tagged inline for explicit confirmation. Builds on the product brief at docs/planning-artifacts/product-brief/brief.md.

## 1. Vision
[2-3 paragraphs: what this is, what it does for the user, why it matters. Compelling enough to stand alone.]

Small guest houses and hotels lose revenue and staff time to expensive, complex property management systems that cost $50-100+/month plus new hardware. This CRM application replaces fragmented solutions with an affordable, web-based platform at under $50/month with zero new hardware required. By combining real-time booking synchronization, automated dynamic pricing, and unified guest profiles, properties can prevent double-bookings, increase RevPAR through intelligent rate adjustment, and personalize guest interactions to drive repeat business — all through a responsive web interface that works on the devices they already have.

## 2. Target User

### 2.1 Jobs To Be Done
- **Primary:** Prevent double-bookings across all distribution channels to avoid lost revenue and guest dissatisfaction
- **Secondary:** Adjust room rates dynamically based on occupancy to maximize revenue per available room
- **Tertiary:** Maintain comprehensive guest profiles to enable personalization and encourage repeat bookings
- **Operational:** Reduce manual coordination overhead for room status, housekeeping, and pre-arrival communications

### 2.2 Non-Users (v1) *(add when the audience boundary is non-obvious)*
- Large hotel chains with established property management systems
- Properties requiring on-premise installation or dedicated IT support
- Operations that do not use any online booking channels (Booking.com, Airbnb, Expedia, direct website)

### 2.3 Key User Journeys
*Named-persona narratives the product enables. Numbered globally as UJ-1 through UJ-N. FRs reference journeys by ID inline ("realizes UJ-3"); SMs may also cross-reference.*

**UJ-1. Maria prevents double-bookings before the weekend rush**
- **Persona + context:** Maria, owner of a 7-room guest house in Spain, manages bookings directly and through Booking.com and Airbnb, uses WhatsApp for guest communication
- **Entry state:** Friday afternoon, 3 rooms already booked on direct website, 2 on Booking.com, 1 on Airbnb
- **Path:** Opens CRM on phone browser, views unified calendar, sees conflict flag for one room, manually adjusts Airbnb availability, confirms no double-booking
- **Climax:** Weekend passes without double-booking incidents; guests arrive smoothly
- **Resolution:** Maria saves an estimated $200 in potential lost revenue and avoids guest complaints; updates pricing for next weekend
- **Edge case:** If she discovers a double-booking after confirmation, the system logs the event and flags it for follow-up

**UJ-2. Carlos adjusts pricing for high-occupancy weekend**
- **Persona + context:** Carlos, manager of a 15-room boutique hotel in Mexico, monitors occupancy trends and needs to optimize rates
- **Entry state:** Wednesday evening, occupancy at 65% across all channels for upcoming weekend
- **Path:** Opens CRM dashboard, views dynamic pricing recommendations based on occupancy rules, increases rates 10% for weekend stays where occupancy >70%
- **Climax:** Weekend bookings come in at the new rates; RevPAR increases measurabley
- **Resolution:** Ends weekend with 90% occupancy and higher per-room revenue; sets baseline rules for following week
- **Edge case:** If local events or holidays are not in the system, manual override allows rate adjustments outside automated rules

**Scope dial:**
- **Lighter** — hobby/solo, library/CLI, or when the UJ is essentially a JTBD restated: a single sentence works.
- **Heavier** — auth, multi-device handoff, complex navigation, or anything feeding downstream UX/architecture: add a numbered Flow, an Edge cases list, and a capability → FR mapping.

## 3. Glossary
*Downstream workflows and readers must use these terms exactly. FRs, UJs, and SMs use Glossary terms verbatim; introducing a synonym anywhere in the PRD is a discipline violation. If §4 introduces a new domain noun, add it to the Glossary in the same pass.*

- **Double-booking** — Two or more guests assigned to the same room for the same dates across any distribution channel
- **Channel** — Any distribution platform where rooms are listed and booked (Booking.com, Airbnb, Expedia, direct website, WhatsApp)
- **Dynamic pricing** — Automated room rate adjustment based on occupancy rules, demand patterns, and time-based factors
- **RevPAR** — Revenue per Available Room = total room revenue divided by total available rooms in a given period
- **ADR** — Average Daily Rate = total room revenue divided by number of rooms sold in a given period
- **Guest profile** — Unified record per guest combining basic info, preference history, stay history, and communication notes
- **Pre-arrival automation** — Automated sequences sending booking confirmations, check-in instructions, required documents, and upsell opportunities before guest arrival
- **Channel commission** — Platform fee percentage or amount deducted from booking revenue for each distribution channel

## 4. Features
*Each subsection is a coherent feature: behavioral description first, FRs nested under it, optional feature-specific NFRs and notes. FRs are numbered globally (FR-1 through FR-N) so downstream artifacts have stable references even if features get reorganized. Reference user journeys by ID inline ("realizes UJ-2") where the chain matters.*

### 4.1 Real-time multi-platform booking sync
**Description:** [The system prevents double-bookings by synchronizing availability across all distribution channels in real-time. When a room is booked on any channel (Booking.com, Airbnb, Expedia, or direct website), the availability is instantly updated across all other channels. Realizes UJ-1.]

**Functional Requirements:**

#### FR-1: System prevents double-bookings across all connected channels
[Actor] can rely on the system to flag any availability conflict when a booking is made on any channel, realizs UJ-1.

**Consequences (testable):**
- System returns a conflict warning when a booking would overlap with existing reservations on any channel
- Once a booking is confirmed on one channel, that room becomes unavailable on all other channels within 60 seconds
- Unified central calendar displays real-time availability across all channels in single view

**Out of Scope:** *(optional — what this FR explicitly does NOT cover)*
- Manual override of channel availability without admin authentication
- Integration with property management systems beyond booking channel APIs
- Real-time synchronization with third-party channel managers not in scope v1

#### FR-2: Central unified calendar view
[Actor] can view all bookings across all channels in a single calendar interface, realizs UJ-1.

**Consequences (testable):**
- Calendar displays bookings from all connected channels with visual distinction per channel
- Date range selector allows viewing day, week, or month views
- Color coding indicates source channel for each booking

**Feature-specific NFRs:** *(only if any apply uniquely to this feature)*
- Load time under 2 seconds for calendar with up to 50 active bookings across 4 channels
- Mobile-responsive design — calendar accessible and usable on phone and tablet browsers

**Notes:** *[ASSUMPTION: Hotel owners have reliable internet connectivity for real-time sync]*

### 4.2 Simple dynamic pricing rules engine
**Description:** [Automated rate adjustment based on occupancy rules enables property owners to maximize revenue without manual rate changes. Rules like "increase 10% if occupancy > 70%" or "decrease 20% if < 2 nights available" are applied automatically. Realizes UJ-2.]

**Functional Requirements:**

#### FR-3: Property owners can define dynamic pricing rules based on occupancy
[Actor] can create, edit, and delete pricing rules that adjust room rates based on current occupancy levels, realizs UJ-2.

**Consequences (testable):**
- Rule interface allows specifying occupancy threshold (e.g., "if occupancy > 70%")
- Rule interface allows specifying rate adjustment percentage (e.g., "increase 10%")
- Rules can be set per channel or globally across all channels
- System automatically applies rules and updates rates on all connected channels

**Feature-specific NFRs:** *(only if any apply uniquely to this feature)*
- Rule creation/edit takes under 2 minutes
- Rate changes propagate to all channels within 5 minutes of rule evaluation
- System evaluates rules at least once per hour during business days

**Notes:** *[ASSUMPTION: Property owners want automated (not manual) rate adjustments]*

### 4.3 Unified guest profile
**Description:** [One page per guest with basic info + preference history + stay history + communication notes enables personalization and repeat business. Realizes value of guest data for loyalty and targeted communications.]

**Functional Requirements:**

#### FR-4: System stores one guest profile per unique guest
[Actor] can look up any guest by name or contact info and see their complete profile including basic info, preferences, stay history, and communication notes.

**Consequences (testable):**
- Guest search by name, email, or phone number returns complete profile
- Profile includes: name, contact info, preferences (room type, floor, amenities), stay history (dates, channels, spend), communication notes (special requests, follow-up actions)
- Profile is editable by authorized staff only

**Feature-specific NFRs:** *(only if any apply uniquely to this feature)*
- Guest search returns results in under 1 second
- Profile page loads in under 2 seconds
- Supports up to 10,000 guest profiles without performance degradation

**Notes:** *[ASSUMPTION: Guest data privacy regulations (GDPR, etc.) will be handled in downstream compliance work]*

### 4.4 Pre-arrival automation
**Description:** [Automated sequences send booking confirmations, check-in instructions, required documents, and upsell opportunities to guests before arrival, reducing no-shows and improving guest experience.]

**Functional Requirements:**

#### FR-5: System sends automated booking confirmation immediately after booking
[Actor] can rely on the system to send a booking confirmation to the guest via their preferred communication channel (WhatsApp, email) immediately after any booking is confirmed, realizes value of UJ-1 and UJ-2 flow.

**Consequences (testable):**
- Confirmation sent within 5 minutes of booking confirmation on any channel
- Confirmation includes: booking reference, check-in date/time, property address, contact information
- Confirmation sent via guest's preferred channel (WhatsApp if available, else email)

#### FR-6: System sends pre-arrival instructions and required documents
[Actor] can rely on the system to send check-in instructions and required documents to guests at configurable times before arrival (e.g., 48 hours, 24 hours, 12 hours), realizes value of reducing day-of arrival friction.

**Consequences (testable):**
- Customizable send times: 48h, 24h, 12h before arrival
- Instructions include: check-in time, parking information, local area tips, contact for issues
- Required documents (ID, vaccination, etc.) attached or linked as needed

#### FR-7: System sends upsell opportunities before arrival
[Actor] can configure upsell offers (room upgrades, late check-out, special packages) to be sent to guests before arrival, realizes additional revenue and enhances guest experience.

**Consequences (testable):**
- Upsell offers configurable per property: room type upgrades, add-on services, local experience partnerships
- Offers sent at configurable time before arrival
- Guest can accept or decline upsell directly through response channel

**Feature-specific NFRs:** *(only if any apply uniquely to this feature)*
- Confirmation sent within 5 minutes of booking
- Pre-arrival messages sent within 1 minute of scheduled time
- Upsell offers appear in guest response channel within 2 minutes of guest interaction

**Notes:** *[ASSUMPTION: Guests will respond to WhatsApp/email communications from properties]*

### 4.5 Channel commission tracking
**Description:** [Net rate after each platform's cut is tracked and total owed per month is calculated, giving property owners clear visibility into platform costs and true revenue.]

**Functional Requirements:**

#### FR-8: System tracks net rate after each platform's commission
[Actor] can view the net amount received after each channel's commission/deduction for every booking, enabling accurate revenue tracking.

**Consequences (testable):**
- For each booking, system displays: gross rate, channel commission percentage/amount, net rate received
- Monthly summary shows total gross revenue, total commissions, total net revenue per channel
- Commission rates configurable per channel (default: Booking.com 15%, Airbnb 13%, Expedia 12%, direct 0%)

#### FR-9: System calculates total amount owed to property per month
[Actor] can view a monthly reconciliation report showing total amounts due from each channel, enabling cash flow planning.

**Consequences (testable):**
- Monthly report aggregates: bookings per channel, net rate per booking, total per channel, grand total
- Report includes pending payments, paid payments, and overdue amounts
- Exportable in CSV format for accounting integration

**Feature-specific NFRs:** *(only if any apply uniquely to this feature)*
- Monthly report generates in under 3 seconds
- Commission rates configurable with immediate effect on future bookings
- Export includes all necessary fields for accountant reconciliation

**Notes:** *[ASSUMPTION: Property owners need accurate commission tracking for budgeting and profitability analysis]*

### 4.6 Basic reporting dashboard
**Description:** [Occupancy, ADR, RevPAR, revenue by channel, and growth trends give property owners immediate visibility into performance without requiring data expertise or external analytics tools.]

**Functional Requirements:**

#### FR-10: Dashboard displays key occupancy and revenue metrics
[Actor] can view occupancy rate, ADR, and RevPAR for selected date ranges and channel breakdowns.

**Consequences (testable):**
- Occupancy rate = rooms sold / available rooms × 100, for selected period
- ADR = total room revenue / rooms sold, for selected period
- RevPAR = total room revenue / total available rooms, for selected period
- Metrics available for date range selection (last 7 days, last 30 days, custom range)
- Channel breakdown shows metrics per distribution channel

#### FR-11: Dashboard shows revenue trends over time
[Actor] can view growth trends comparing current period to previous periods.

**Consequences (testable):**
- Year-over-year and month-over-month growth percentages displayed
- Visual trend indicators (up/down arrows, color coding)
- Ability to export data for external analysis

**Feature-specific NFRs:** *(only if any apply uniquely to this feature)*
- Dashboard loads in under 2 seconds
- Metrics update in real-time as new bookings come in
- Supports date range selection without page reload

**Notes:** *[ASSUMPTION: Property owners can interpret basic hospitality metrics without training]*

### 4.7 Task coordination Lite
**Description:** [Room status updates and housekeeping notifications keep staff aligned on property operations using phones they already have, reducing miscommunication and improving turnover time.]

**Functional Requirements:**

#### FR-12: Staff can update room status (clean, dirty, inspect, ready)
[Actor] can mark room status in the system, and changes are visible to all authorized staff in real-time.

**Consequences (testable):**
- Status options: clean, dirty, inspect, ready, out of order
- Status change timestamp and staff member identified
- Real-time update visible to all authorized staff accessing the system

#### FR-13: Housekeeping notifications are sent when rooms become ready
[Actor] can rely on the system to notify housekeeping when rooms are marked ready, enabling faster turnover.

**Consequences (testable):**
- Notification sent to housekeeping team when room status changes to "ready"
- Notification includes: room number, property section, any special notes from previous guest
- Housekeeping can acknowledge receipt and update status accordingly

**Feature-specific NFRs:** *(only if any apply uniquely to this feature)*
- Status update acknowledgment within 10 seconds
- Notification delivered to staff mobile devices within 30 seconds
- System supports up to 20 staff members simultaneously

**Notes:** *[ASSUMPTION: Staff have access to mobile phones or tablets for system access during shifts]*

## 5. Non-Goals (Explicit)
- [NON-GOAL for MVP] Integration with existing property management systems (PMS) beyond booking channel APIs
- [NON-GOAL for MVP] Mobile native apps (iOS/Android) — web-only delivery
- [NON-GOAL for MVP] Advanced analytics (cohort analysis, predictive forecasting, machine learning)
- [NON-GOAL for MVP] Multi-property management (single-property v1, multi-property v2+)
- [NON-GOAL for MVP] Rate discounting or profit-optimization algorithms beyond simple occupancy-based rules
- [NON-GOAL for MVP] Guest-facing mobile app or portal
- [NOTE FOR PM] Multi-language support — v1 English-only, consider i18n for v2 if market requires

## 6. MVP Scope

### 6.1 In Scope
- Real-time multi-platform booking sync across Booking.com, Airbnb, Expedia, direct website
- Simple dynamic pricing rules engine with occupancy-based thresholds
- Unified guest profile with basic info, preferences, stay history, communication notes
- Pre-arrival automation: booking confirmations via WhatsApp/email, check-in instructions, required documents
- Channel commission tracking with net rate calculation and monthly reconciliation
- Basic reporting dashboard: occupancy, ADR, RevPAR, revenue by channel, growth trends
- Task coordination Lite: room status updates, housekeeping notifications
- Web-based delivery, zero installation, responsive design for phones/tablets
- Cost <$50/month per property
- Integration with WhatsApp for guest communication

### 6.2 Out of Scope for MVP
- Integration with existing PMS systems beyond booking channel APIs
- Mobile native apps (iOS/Android)
- Advanced analytics and predictive forecasting
- Multi-property management
- Rate discounting or profit-optimization beyond occupancy-based rules
- Guest-facing mobile app or portal
- Multi-language support (v1 English-only)

## 7. Success Metrics

*Each SM cross-references the FR(s) it validates.*

**Primary**
- **SM-1: Double-booking prevention rate** — Target: ≥99.5% of bookings across all channels have no conflicts, validated by FR-1, FR-2. Measured weekly through automated audit of booking logs vs. calendar conflicts.
- **SM-2: Dynamic pricing adoption and revenue impact** — Target: ≥30% of properties with dynamic pricing enabled adopt at least one rule within 30 days, and report RevPAR increase of ≥5% within first 3 months, validated by FR-3.
- **SM-3: Guest retention through unified profiles and personalization** — Target: 20% of guests with 2+ stays within 6 months show repeat booking behavior, validated by FR-4 and post-stay communication tracking.
- **SM-4: Operational efficiency via task coordination and pre-arrival automation** — Target: Housekeeping room turnover time reduced by ≥20% and staff time spent on manual communications reduced by ≥30%, validated by FR-12, FR-13, FR-5, FR-6.

**Secondary**
- **SM-5: Channel commission tracking accuracy** — Target: Tracked net rates match actual payments received within ±2% variance, validated by FR-8, FR-9.
- **SM-6: Reporting dashboard usage** — Target: ≥70% of property owners log into dashboard at least once per month, and ≥50% use channel breakdown metrics, validated by FR-10, FR-11.

**Counter-metrics (do not optimize)**
- **SM-C1: Do not optimize for maximum occupancy at expense of guest experience** — Over-booking or over-pricing that drives guests away should be avoided; a property with 85% occupancy and satisfied guests is preferred over 95% with complaints.
- **SM-C2: Do not optimize for maximum automation at expense of staff control** — Automated features must have clear admin override and audit trails; properties must retain ability to manually override or disable rules.

[Length scales with stakes. Hobby/utility PRD: a single sentence may be enough ("Success: I use this weekly and don't abandon it after a month"). Public launch / enterprise: full quantitative breakdown with measurement methods. Counter-metrics are as load-bearing as primary metrics — they prevent the architect from optimizing the wrong thing and the dev from gaming the wrong target.]

## 8. Open Questions
1. [ASSUMPTION: What price point per property per month is sustainable while staying under $50/month target?]
2. [ASSUMPTION: What WhatsApp/business API integration model is available and cost-effective for small properties?]
3. [ASSUMPTION: What level of data export/integration do property owners need with existing accounting software?]
4. [ASSUMPTION: What are the typical internet connectivity conditions for target properties (urban vs. rural locations)?]
5. [ASSUMPTION: What level of technical literacy do property owners/managers have for system setup and daily use?]
6. [ASSUMPTION: What commission structures do major channels (Booking.com, Airbnb, Expedia) typically use that need to be accommodated?]
7. [ASSUMPTION: What guest communication preferences vary by region/market (WhatsApp vs. email vs. SMS)?]

## 9. Assumptions Index
*Every `[ASSUMPTION]` from the document, surfaced for explicit confirmation:*
- Inline assumption from §4.1 — Hotel owners have reliable internet connectivity for real-time sync
- Inline assumption from §4.2 — Property owners want automated (not manual) rate adjustments
- Inline assumption from §4.3 — Guest data privacy regulations will be handled in downstream compliance work
- Inline assumption from §4.4 — Guests will respond to WhatsApp/email communications from properties
- Inline assumption from §4.5 — Property owners need accurate commission tracking for budgeting and profitability analysis
- Inline assumption from §4.6 — Property owners can interpret basic hospitality metrics without training
- Inline assumption from §4.7 — Staff have access to mobile phones or tablets for system access during shifts
- Inline assumption from §7 — Counter-metrics SM-C1 and SM-C2 are meaningful constraints on optimization decisions

---
---
title: CRM application for guest houses and small hotels
created: 2026-11-03
updated: 2026-11-03
status: final
---
