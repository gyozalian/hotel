# Feature Gap Analysis: 7 MVP Features vs. Affordable CRM/PMS Solutions
## Mapped Against Top 5 Cost-Effective Solutions (<$50/month threshold)

*Analysis compiled from vendor documentation, feature comparisons, and public roadmaps as of November 3, 2026.*

---

## Executive Summary

The 7 MVP features identified in brainstorming can be mapped against existing SMB-friendly solutions, but **no single solution covers all 7 features under $50/month** without trade-offs. The most critical gaps are:

1. **Dynamic pricing rules engine** — absent from all entry-tier solutions under $50/mo
2. **Channel commission tracking** — only LodgeHog addresses this among affordable options
3. **Pre-arrival automation** — only LodgeHog and FrontDesko offer basic versions

However, **viable combinations** exist that cover 5-7 features under $50/month depending on property size.

---

## MVP Feature Mapping Matrix

| MVP Feature | Description | Critical Requirement | Coverage Across Solutions |
|-------------|-------------|---------------------|--------------------------|
| **MVP #1** | Real-time multi-platform booking sync | Two-way API sync with Booking.com, Airbnb, Expedia to prevent double-booking | ✓ All 5 solutions cover this via channel manager add-on. API connections provide real-time sync; iCal connections lag by hours. |
| **MVP #2** | Simple dynamic pricing rules engine | Rules-based pricing (weekend boost, occupancy-based discounts, per-channel adjustments) | ✗ Major gap. Only LodgeHog offers basic per-channel rate adjustments. RoomMaster/RoomRaccoon Essentials tiers add it but push cost to $48-50+/mo. Not available in any solution under $50/mo without dynamic pricing add-on. |
| **MVP #3** | Unified guest profile | Single guest profile consolidating stays across all channels, with contact info, preferences, history | ✓ All 5 solutions cover this. PMS guest database serves as central repository. Cross-channel dedup (preventing duplicate profiles for same guest) included in all. |
| **MVP #4** | Pre-arrival automation | Automated guest communication before arrival (welcome messages, check-in instructions, upsell offers) | ✗ Partial. LodgeHog and FrontDesko offer basic automated messaging. NOBEDS, eviivo Entry, RoomMaster Entry do not advertise this in entry tiers. |
| **MVP #5** | Channel commission tracking | Track/Report OTA commissions paid (Booking.com 15-20%, Airbnb 3%, Expedia 15-20%) | ✗ Significant gap. Only LodgeHog addresses commission tracking via "per-channel rate adjustments" to offset differing commission rates. Other solutions lack this feature. |
| **MVP #6** | Basic reporting dashboard | Occupancy rate, ADR, RevPAR, booking source breakdown, visual dashboards | ✓ All 5 solutions cover this. LodgeHog offers most comprehensive visual dashboard. FrontDesko/NOBEDR provide basic occupancy/ADR reports. All include booking source attribution. |
| **MVP #7** | Task coordination Lite | Internal task assignment (housekeeping, maintenance, to-do items) with basic tracking | ✓ All 5 solutions cover this. Even entry-tier includes basic task assignment. LodgeHog adds housekeeping integration and AI co-host. FrontDesko includes staff role-based permissions. |

---

## Detailed Per-Feature Analysis

### MVP #1: Real-time Multi-Platform Booking Sync
**Status**: ✓ COVERED by all solutions

**How it works**: Channel manager connects PMS to OTA APIs (Booking.com, Airbnb, Expedia). When a booking comes in on one channel, availability is instantly updated across all others. Prevents double-bookings.

**Solution coverage**:
- **FrontDesko**: Channel manager add-on ($35-54/mo). API connections to Booking.com, Airbnb, Expedia.
- **LodgeHog**: Channel manager add-on ($9.90/mo paid plan). API connections to Booking.com, Airbnb, Expedia.
- **NOBEDS**: Channel manager add-on (€25/mo up to 9 rooms, €99/mo Premium). API connections documented.
- **eviivo**: Channel manager included in $50/mo flat rate. API connections to major OTAs.
- **RoomMaster Entry**: Channel manager included in $18/mo (annual). API connections to Booking.com, Expedia, Airbnb.

**Gap nuance**: All provide API connections, but reliability and sync speed vary. Hosthub and Nowistay advertise "<5 minutes" sync; traditional hotel channel managers may have longer sync intervals. For guest house/SMB use, all listed solutions should provide adequate real-time sync (<30 minutes).

---

### MVP #2: Simple Dynamic Pricing Rules Engine
**Status**: ✗ MAJOR GAP — Not available under $50/month

**What it does**: Allows property owners to set rules like:
- "Increase rate by 20% on weekends (Friday-Sunday)"
- "Reduce rate by 15% if weekly occupancy < 30%"
- "Apply 10% surcharge for Airbnb to offset 3% host fee"
- "Dynamic pricing based on local events, historical data"

**Solution coverage**:
- **FrontDesko**: Not advertised as feature in entry tier. Would require custom integration or premium add-on.
- **LodgeHog**: ✓ Basic per-channel rate adjustments. Set base rate and apply percentage adjustments per channel to offset commission differences (Airbnb 3% vs Booking.com 15-20%).
- **NOBEDS**: Not advertised as feature in entry tier.
- **eviivo**: ✗ Not in Entry tier. Essentials tier adds dynamic pricing (price unspecified, likely $30+/mo additional).
- **RoomMaster Entry**: ✗ Not in Entry tier. Essentials tier adds dynamic pricing (included in $30/mo tier, pushing total to $48/mo annual).

**Workarounds & Alternatives**:
1. **Manual pricing updates** — feasible for small properties with few rooms
2. **Separate dynamic pricing tools**: Smartpricing (~$15-20/mo), RoomPriceGenie, Automize — but pushes total cost over $50
3. **Rules-based manual approach** — set rates monthly based on occupancy forecasts
4. **LodgeHog's per-channel rate adjustments** — best available option for MVP. Allows offsetting commission differences without full dynamic pricing engine.

**Recommendation for MVP**: Launch without automated dynamic pricing. Use LodgeHog's basic per-channel rate adjustments ($9.90/mo) or manual rate updates. Add dynamic pricing in Phase 2.

---

### MVP #3: Unified Guest Profile
**Status**: ✓ COVERED by all solutions

**What it does**: Single guest profile that consolidates:
- Name, contact info (email, phone, address)
- Stay history across all channels (Booking.com, Airbnb, Expedia, direct website)
- Preferences (room type, floor, pillow type, anniversaries, special occasions)
- Notes (allergies, accessibility needs, communication preferences)
- Total spending, lifetime value

**Solution coverage**:
- **All 5 solutions** (FrontDesko, LodgeHog, NOBEDS, eviivo, RoomMaster Entry) include guest profile database as part of PMS.
- **Cross-channel dedup**: All prevent duplicate profiles for the same guest who books on multiple OTAs. Typically matches by email address or phone number.
- **Guest notes/appendages**: FrontDesko and LodgeHog offer the most robust note-taking. NOBEDS and RoomMaster include basic notes. eviivo includes guest info but less emphasis on preference tracking.

**Critical consideration**: "Unified" means ONE profile per guest, not multiple profiles across channels. All solutions listed achieve this via the central PMS database. This is a key differentiator from enterprise CRMs that may create separate profiles per channel.

---

### MVP #4: Pre-Arrival Automation
**Status**: ⚠ PARTIAL — Only LodgeHog and FrontDesko offer basic versions

**What it does**: Automated guest communication sent before arrival, typically:
- Day-of-or 2-3 days before arrival: Welcome message with property info, directions, check-in instructions
- Day-of arrival: Confirmation of late check-in, key pickup info
- Upsell offers: Late check-out, airport transfer, room upgrade, spa dinner reservation

**Solution coverage**:
- **FrontDesko**: ✓ Guest app + messaging integration. Automated messages can be triggered by stay date. Limited template customization.
- **LodgeHog**: ✓ Automated message templates and scheduling. "AI Co-host" feature adds auto-replies to common guest queries. Message scheduling by stay date.
- **NOBEDS**: ✗ Not advertised in entry tier. May require manual messaging or higher tier.
- **eviivo**: ✗ Not in Entry tier. Guest communication features in higher tiers.
- **RoomMaster Entry**: ✗ Not in Entry tier. Professional tier adds guest communication.

**LodgeHog's implementation**: 
- Create message templates for "Welcome," "Check-in instructions," "Local recommendations"
- Schedule messages to send on specific dates relative to checkout
- AI Co-host auto-replies to common questions (WiFi password, check-in time, etc.)
- Messages can be personalized with guest name, booking date, room type

**FrontDesko's implementation**:
- Guest mobile app sends automated messages
- Triggered by booking confirmation or stay date
- Limited to pre-defined message types
- Integrates with channel manager for stay date tracking

**Recommendation**: LodgeHog offers the most capable pre-arrival automation at $9.90/mo. FrontDesko ($35-54/mo) is the only other option with this feature.

---

### MVP #5: Channel Commission Tracking
**Status**: ✗ SIGNIFICANT GAP — Only LodgeHog addresses this

**What it does**: Track and report the commissions paid to OTAs per booking/channels:
- Booking.com: Typically 15-20% commission per booking
- Airbnb: 3% host fee (plus 14%+ guest fee, depending on location)
- Expedia: 15-20% commission (negotiable for volume)
- Vrbo: ~3-5% (if applicable)

**Why it matters**: Property owners need to know:
- True net revenue per booking (gross minus OTA commission)
- Which channels are most profitable after commissions
- Optimization opportunities (e.g., push more direct bookings via booking engine)
- Commission accruals for accounting purposes

**Solution coverage**:
- **LodgeHog**: ✓ Per-channel rate adjustments account for commission differences. Set base rate and apply percentage adjustments per channel to maintain target payout. E.g., if Airbnb takes 3% host fee and Booking.com takes 15%, adjust rates so net payout is equalized.
- **FrontDesko**: ✗ Not advertised as feature. May require manual tracking or integration with accounting software.
- **NOBEDS**: ✗ Not advertised as feature.
- **eviivo**: ✗ Not in Entry tier. Reporting features in higher tiers.
- **RoomMaster Entry**: ✗ Not in Entry tier. Professional tier adds reporting.

**LodgeHog's approach**: 
- Configure per-channel rate adjustments in channel manager settings
- Set base direct-booking rate, then add percentage markups per channel to offset commissions
- Owner reporting dashboard shows revenue breakdown by channel
- Helps property owners understand true profitability per distribution channel

**Workaround without dedicated feature**: 
- Manual spreadsheet tracking of commissions by channel
- Export booking data from each OTA and calculate net revenue
- Third-party accounting integration (Xero, QuickBooks) with OTA connectors

**Recommendation**: LodgeHog is the only affordable solution with built-in commission tracking logic. For other solutions, plan for manual tracking or accept limited visibility into commission analysis.

---

### MVP #6: Basic Reporting Dashboard
**Status**: ✓ COVERED by all solutions

**What it reports**: Core hospitality KPIs:
- **Occupancy rate**: Percentage of rooms occupied over a period
- **ADR (Average Daily Rate)**: Average revenue per occupied room
- **RevPAR (Revenue Per Available Room)**: Occupancy × ADR (most properties miss this in entry tiers)
- **Booking source breakdown**: Which channel (Booking.com, Airbnb, Expedia, direct website) each booking came from
- **Length of stay statistics**: Average, minimum, maximum stay durations
- **Revenue by period**: Weekly, monthly, yearly totals

**Solution coverage**:
- **LodgeHog**: ✓ Most comprehensive. Visual dashboard with owner reporting, revenue breakdown by channel, occupancy trends, ADR tracking.
- **FrontDesko**: ✓ Basic reporting. Occupancy rate, ADR, booking source attribution. May lack RevPAR calculation.
- **NOBEDS**: ✓ Basic reporting. Reservation calendar stats, occupancy basics, guest list exports.
- **eviivo**: ✓ Basic reporting. Occupancy, ADR, booking source basic breakdown.
- **RoomMaster Entry**: ✓ Basic reporting. Occupancy, ADR, reservation statistics.

**Missing in most entry tiers**: RevPAR (Revenue Per Available Room) is the most commonly absent metric. Properties with zero RevPAR need to calculate it manually (Occupancy % × ADR).

**LodgeHog's differentiator**: Includes RevPAR, competitive set benchmarking (if properties opt-in), and owner-level reporting that aggregates across multiple properties (even free tier supports single-property reporting).

**Recommendation**: All solutions meet the "basic reporting" threshold. LodgeHog offers the most complete dashboard. If RevPAR is critical, plan to calculate manually or upgrade to a solution that includes it.

---

### MVP #7: Task Coordination Lite
**Status**: ✓ COVERED by all solutions

**What it does**: Internal task assignment and tracking for:
- Housekeeping (room cleaning after check-out, before check-in)
- Maintenance (repair requests, recurring maintenance items)
- Front desk (to-do items, follow-up tasks, guest requests)
- Staff communication (shift handovers, internal notes)

**Solution coverage**:
- **All 5 solutions** include basic task coordination as part of the PMS.
- **Task assignment**: Assign tasks to specific staff members by role/name.
- **Status tracking**: Task status (pending, in progress, completed) visible to all staff.
- **Priority levels**: Low, medium, high task prioritization.
- **Notifications**: Staff receive task assignments via email or in-app notifications.

**Feature depth varies**:
- **LodgeHog**: ✓ Most complete. Task assignment + housekeeping task sync + AI co-host for guest query handling + multi-user role-based access. Team access included in paid plans.
- **FrontDesko**: ✓ Staff role-based permissions + task coordination included in PMS. Task visibility by role.
- **NOBEDS**: ✓ Basic task tracking. Multi-role manager support in paid plans. Task assignment and status tracking.
- **eviivo**: ✓ Basic task management features. Staff roles and task assignment included.
- **RoomMaster Entry**: ✓ Task management features included. Staff roles and task assignment.

**LodgeHog's differentiator**: Housekeeping task integration — when a checkout is processed, housekeeping tasks are automatically generated for room cleaning. AI co-host handles common guest queries, reducing front desk task load.

**Recommendation**: All solutions cover the MVP requirement. LodgeHog offers the most advanced task coordination, but even the entry-level features of other solutions suffice for "Lite" coordination.

---

## Viable Combinations: Which Features Can You Get Under $50/month?

### Combination A: LodgeHog ($9.90/mo) + Manual Workarounds
| MVP Feature | Covered? | Notes |
|-------------|----------|-------|
| 1. Booking sync | ✓ | Channel manager add-on $9.90/mo |
| 2. Dynamic pricing | ✗ | Not available; manual updates or LodgeHog per-channel rate adjustments as partial workaround |
| 3. Unified guest profile | ✓ | Free plan includes basic guest profiles |
| 4. Pre-arrival automation | ✓ | Automated message templates and AI Co-host |
| 5. Commission tracking | ✓ | Per-channel rate adjustments offset commission differences |
| 6. Reporting dashboard | ✓ | Visual dashboard with occupancy, ADR, channel breakdown |
| 7. Task coordination | ✓ | Basic task assignment and tracking |
| **Total covered** | **6/7** | Only dynamic pricing (MVP #2) is missing. Can be added later as Phase 2. |
| **Total cost** | **$9.90/mo** | Within <$50 threshold ✓ |

### Combination B: FrontDesko ($35-54/mo, room-count dependent)
| MVP Feature | Covered? | Notes |
|-------------|----------|-------|
| 1. Booking sync | ✓ | Channel manager add-on $35-54/mo |
| 2. Dynamic pricing | ✗ | Not in entry tier; would require premium add-on |
| 3. Unified guest profile | ✓ | Full guest database with cross-channel history |
| 4. Pre-arrival automation | ✓ | Guest app + messaging automation |
| 5. Commission tracking | ✗ | Not advertised as feature |
| 6. Reporting dashboard | ✓ | Basic occupancy, ADR, booking source reports |
| 7. Task coordination | ✓ | Staff role-based permissions |
| **Total covered** | **5/7** | Dynamic pricing (MVP #2) and commission tracking (MVP #5) missing. Feature completeness highest of any single solution. |
| **Total cost** | **$35-54/mo** | Under $50 only for properties ≤30 rooms. At 31-50 rooms, hits $54/mo (slightly over threshold). |

### Combination C: NOBEDS Free + Channel Manager (€25/mo ~ $27/mo)
| MVP Feature | Covered? | Notes |
|-------------|----------|-------|
| 1. Booking sync | ✓ (paid channel manager) | Channel manager API connections available |
| 2. Dynamic pricing | ✗ | Not advertised in entry tier |
| 3. Unified guest profile | ✓ | Basic guest profiles with reservation history |
| 4. Pre-arrival automation | ✗ | Not advertised |
| 5. Commission tracking | ✗ | Not advertised |
| 6. Reporting dashboard | ✓ | Basic occupancy and reservation stats |
| 7. Task coordination | ✓ | Basic task tracking included |
| **Total covered** | **4/7** | Free plan is quite limited. Channel manager adds €25/mo (up to 9 rooms only). |
| **Total cost** | **€25/mo (~$27/mo)** | Under $50, but limited to 9 rooms for channel manager. Free plan lacks many MVP features. |

### Combination D: RoomMaster Entry ($18/mo annual + dynamic pricing upgrade)
| MVP Feature | Covered? | Notes |
|-------------|----------|-------|
| 1. Booking sync | ✓ | Channel manager included in $18/mo entry tier |
| 2. Dynamic pricing | ✓ (upgrade path) | Essentials tier ~$30/mo additional. Total ~$48/mo annualized. |
| 3. Unified guest profile | ✓ | Guest database with cross-channel history |
| 4. Pre-arrival automation | ✗ | Not in Entry tier; Professional tier adds it |
| 5. Commission tracking | ✗ | Not in Entry tier; Professional tier adds it |
| 6. Reporting dashboard | ✓ | Basic occupancy, ADR, reservation stats |
| 7. Task coordination | ✓ | Task management included |
| **Total covered** | **5/7** | Dynamic pricing requires upgrade. Commission tracking and pre-arrival automation require higher tiers. |
| **Total cost** | **$48/mo annualized** (with dynamic pricing upgrade) | Barely under $50, but requires annual commitment and two-tier pricing. |

### Combination E: Hybrid Stack (LodgeHog Free + Smartpricing $15/mo)
| MVP Feature | Covered? | Notes |
|-------------|----------|-------|
| 1. Booking sync | ✓ | LodgeHog free plan lacks channel manager; add $9.90/mo channel manager |
| 2. Dynamic pricing | ✓ | Smartpricing ~$15-20/mo adds rules-based dynamic pricing |
| 3. Unified guest profile | ✗ | Free plan basic guest profiles; full unification in paid plans |
| 4. Pre-arrival automation | ✓ | LodgeHog automated message templates |
| 5. Commission tracking | ✓ | LodgeHog per-channel rate adjustments |
| 6. Reporting dashboard | ✓ | LodgeHog visual dashboard (with Smartpricing data) |
| 7. Task coordination | ✓ | LodgeHog basic task assignment |
| **Total covered** | **6/7** | Unified guest profile (MVP #3) is weakest link on free plan. |
| **Total cost** | **$25-30/mo** | $9.90 (LodgeHog channel) + $15-20 (Smartpricing) = ~$25-30/mo. Within <$50 threshold. |

---

## Recommended MVP Configuration

Based on the analysis, here are three recommended approaches:

### Recommendation 1: LodgeHog Paid Plan ($9.90/mo) — Best Overall Value
**Features covered**: 6/7 MVP features (all except full dynamic pricing engine)
**Total cost**: $9.90/month — well under $50 threshold
**Best for**: Properties prioritizing cost efficiency and core booking sync + guest management
**Phase 2 additions**: 
- Smartpricing or similar dynamic pricing tool (~$15-20/mo) when ready for revenue optimization
- Advanced reporting upgrades as property grows

### Recommendation 2: FrontDesko ($35-42/mo for ≤30 rooms) — Best Feature Completeness
**Features covered**: 5/7 MVP features (all core features, missing dynamic pricing + commission tracking)
**Total cost**: $35-42/month for properties up to 30 rooms — under $50 threshold
**Best for**: Properties wanting full PMS + CRM functionality in one platform, willing to pay more for integrated feature set
**Phase 2 additions**: 
- Dynamic pricing rules engine as separate tool or upgrade
- Commission tracking via manual methods or integrated accounting

### Recommendation 3: Hybrid Stack (LodgeHog + Smartpricing) ($25-30/mo) — Best Feature Balance
**Features covered**: 6/7 MVP features (unified guest profile is the gap on free plan)
**Total cost**: ~$25-30/month — comfortably under $50 threshold
**Best for**: Properties wanting dynamic pricing from launch + core CRM features
**Trade-off**: Unified guest profile may be less complete on LodgeHog free plan vs. FrontDesko's integrated database. May need to export/import guest data or accept some duplication.

---

## Implementation Priority Matrix

| Feature | Implementation Effort | Business Impact | Priority |
|---------|----------------------|-----------------|----------|
| Booking sync (MVP #1) | Low (channel manager setup) | Critical (prevents double-bookings, enables distribution) | P0 — Launch prerequisite |
| Unified guest profile (MVP #3) | Low (PMS configuration) | High (enables personalized future communications, loyalty) | P0 — Foundation for guest retention |
| Basic reporting (MVP #6) | Low (standard PMS output) | Medium (informs daily operations, occupancy monitoring) | P1 — Post-launch within 30 days |
| Task coordination (MVP #7) | Low (staff onboarding) | Medium (improves internal efficiency, housekeeping flow) | P1 — Post-launch within 30 days |
| Pre-arrival automation (MVP #4) | Medium (message template creation) | High (improves guest experience, reduces front desk workload) | P1 — Within 60 days |
| Commission tracking (MVP #5) | Low (LodgeHog) / Medium (manual for others) | Medium (financial visibility, channel profitability) | P2 — Phase 2, within 90 days |
| Dynamic pricing rules (MVP #2) | Medium-High (rules definition, tool integration) | High (revenue optimization, competitive positioning) | P2 — Phase 2, within 90 days |

**Priority legend**: P0 = must have at launch, P1 = within first 60 days, P2 = within first 90 days / Phase 2

---

## Conclusion

**No single solution covers all 7 MVP features under $50/month**, but viable configurations exist:

1. **LodgeHog ($9.90/mo)** covers 6/7 features — the best value for money. Only dynamic pricing rules engine is missing, which can be added in Phase 2.

2. **FrontDesko ($35-54/mo)** covers 5/7 features with the most depth, but room-count dependency makes it over $50 at 31-50 rooms.

3. **Hybrid stack (LodgeHog + Smartpricing, ~$25-30/mo)** covers 6/7 features with the best balance, at the cost of slightly less unified guest profiles on the free/plans.

**The $50/month threshold is achievable**, but requires either:
- Accepting feature trade-offs (most likely dynamic pricing engine missing at launch)
- Choosing a solution slightly over $50 for full feature coverage (FrontDesko at $54/mo for 31-50 rooms)
- Building a hybrid stack of best-in-class tools within budget

**Recommended next step**: Pilot LodgeHog paid plan ($9.90/mo) with 2-3 guest house properties for 30-60 days, then evaluate which additional features (dynamic pricing, enhanced reporting) become pressing enough to justify Phase 2 investment.

---
*Analysis compiled from vendor documentation, feature comparisons, and public roadmaps as of November 3, 2026. All pricing reflects publicly listed rates as of 2026. Feature availability based on publicly advertised capabilities; actual functionality may vary. Recommendations should be validated with trials/de-mos before final purchasing decisions.*