# User Journey Map — New Hotel Owner: Onboarding & First Steps

**Persona**: Ambitious new hotel owner, just acquired their first property  
**Journey**: First days using the CRM — setting up, connecting channels, seeing first bookings  
**Date**: 2026-11-04  
**Context**: Pre-activation UX design for hotel CRM — supports v1 staff/admin focus, guest portal v2

---

## Journey Overview

The new owner needs to feel empowered, not overwhelmed. They're transitioning from spreadsheet tracking or manual management to a web-based CRM. The journey should build confidence, provide clear wins, and gradually introduce features.

### Stages & Touchpoints

| Stage | Action | Thoughts & Feelings | Pain Points | Delighters |
|-------|--------|---------------------|-------------|------------|
| **1. First Login** | Logs into CRM for the first time | • "Let me see what this system can do"<br>• A mix of excitement and uncertainty | • Too many features at once, decision paralysis<br>• Unclear where to start | **Dashboard lands as default** with clean KPI overview: occupancy, ADR, RevPAR<br>• **Welcome tour** optional, can skip at any time<br>• **Color-coded status** gives immediate visual context |
| **2. Add First Property Details** | Configures property: name, location, room count, contact info | • "I need to make sure the system knows my property"<br>• Wants to feel the system is "theirs" quickly | • Fields unclear what's required vs optional<br>• Afraid of breaking something by editing | **Guided property setup** wizard, step-by-step<br>• **Inline validation** on each field (e.g., "Phone number format")<br>• **Auto-save** prevents data loss |
| **3. Connect Distribution Channels** | Connects Booking.com, Airbnb, Expedia, direct website | • "Let me get bookings from all the places I list my rooms"<br>• Excited but anxious about technical connection | • Connection failures, API limits, unclear setup flow<br>• Embarrassed if technical knowledge gaps show | **Channel connection cards** with big "Connect" buttons<br>• **Step-by-step OAuth flow** in modal, no leaving the app<br>• **Status badges**: "Connected", "Syncing", "Offline" with tooltips on hover/long-press |
| **4. Add First Room** | Creates first room(s) in the system: room number, type, base rate | • "Now I need to enter my rooms"<br>• Wants to see things start populating quickly | • Complex room types, rate categories, channel mappings confuse new user<br>• Unclear how rooms map to channels | **Simple room form**: room number, type (select), base rate, default status<br>• **Channel badges** appear automatically once channels are connected<br>• **Room grid preview** shows new room in context of existing rooms |
| **5. See First Booking Appear** | First booking comes in from connected channel | • "A booking just came in from Booking.com!"<br>• Validated that the system works and they have guests | • Booking looks wrong (wrong room, wrong rate)<br>• Can't tell if it sync correctly | **Booking appears in grid** with channel badge, room number, rate<br>• **Confirmation banner**: "1 booking from Booking.com — rate: $X/night"<br>• **Quick action buttons**: "Mark Ready," "View Guest Profile," "Edit Rate" |
| **6. Set First Pricing Rule** | Creates first dynamic pricing rule | • "I want rates to auto-adjust based on how full the hotel is"<br>• Empowered by automation, but cautious | • What threshold makes sense? What adjustment percentage?<br>• Fear of pricing too high/low and losing business | **Suggested starter rule**: "Increase 10% if occupancy > 70%" based on industry norms<br>• **Rule preview**: shows what would happen at current occupancy levels<br>• **Undo button** if they want to remove the rule |
| **7. Generate First Report** | Views commission/reconciliation report | • "Let me see how much I earned and what I owe channels"<br>• Want transparency without hiring an accountant | • Reports too technical, too much data at once<br>• Unclear what "comission net" means after channel cuts | **Simple commission summary card**: gross, commission, net — three numbers side-by-side<br>• **Hover reveals breakdown**: which channel, which room, which guest<br>• **Month selector**: Today, This Week, This Month, Custom range |
| **8. Build Confidence Over Days** | Repeated daily/weekly use, explores more features | • "This system actually helps me run my hotel better"<br>• Gradually explores Guest Profiles, Settings, Housekeeping tab | • Feature creep, not knowing what to learn next<br>• Overwhelmed by power features they don't need yet | ** Progressive disclosure**: core features (bookings, pricing, rooms) first<br>• **Feature hints** appear contextually (e.g., "Try the Guest Profiles tab when you have multiple guests")<br>• **Weekly digest email**: "One thing you can do this week to improve occupancy" |

### Key Emotional Arc

```
First Login → Orientation (dashboard KPIs) → Setup (property + channels) → First Win (first booking) → Empowerment (first rule) → Transparency (first report) → Confidence (daily use)
```

### Success Metrics for This Journey

- **Time to first booking**: < 15 minutes from login to first booking appearing in system
- **Channel connection success rate**: 90%+ of users successfully connect at least one channel on first try
- **Rule creation within first week**: 70%+ of owners create at least one dynamic pricing rule
- **Report comprehension**: 80%+ of owners can explain what "gross/commission/net" means after viewing one report
- **Retention to day 7**: 60%+ of new owners still active after one week (vs. typical 30% for complex PMS)

### Design Principles Demonstrated

1. **Progressive disclosure** — Core features first; advanced features revealed over time
2. **Suggested defaults** — Starter pricing rule based on industry norms reduces decision fatigue
3. **Visible wins early** — First booking appearing confirms the system works and value is being delivered
4. **Technical shielding** — OAuth flows hidden; channel connections "just work" with tooltips for edge cases
5. **Transparency without jargon** — Commission shown as gross/commission/net with simple hover breakdowns

### Onboarding Pain Points Mitigated

- **"Where do I start?"**: Dashboard default + welcome tour removes decision paralysis
- **"Is this right?":** Inline validation + auto-save prevents anxiety about making mistakes
- **"Does it work?":** First booking confirmation + notification proves system is active
- **"Is this valuable?":** First report gives immediate transparency without accounting knowledge
- **"What next?":** Feature hints + weekly digest guide gradual exploration without overwhelm