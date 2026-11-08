# User Journey Map — Maria: Check-in Day Preparation

**Persona**: Maria, hotel owner/manager of a small guest house with 7 rooms  
**Journey**: Evening before weekend check-in  
**Date**: 2026-11-04  
**Context**: Pre-activation UX design for hotel CRM

---

## Journey Overview

Maria is preparing for a busy weekend. She wants to ensure all bookings are confirmed, rooms are ready, and any issues are resolved before guests arrive.

### Stages & Touchpoints

| Stage | Action | Thoughts & Feelings | Pain Points | Delighters |
|-------|--------|---------------------|-------------|------------|
| **1. Launch App** | Opens CRM web app on phone or laptop | • "I hope everything is set for the weekend"<br>• Quick check of dashboard overview | • Slow load time<br>• Unclear which surface to open first | **Dashboard loads as default** — immediately shows occupancy stats, feels reassuring |
| **2. Review Overview** | Views Today/Calendar surface | • "3 rooms booked for weekend, total capacity 7 rooms"<br>• "Only 4 rooms available — good but not overwhelmed" | • Uncertain about which channels have bookings<br>• Can't tell if there are conflicts | **Color-coded channel badges** appear on room cards — instantly shows Booking.com, Airbnb, direct source |
| **3. Drill into Bookings** | Taps Booking Grid surface for detailed view | • "Let me see the full picture across all channels"<br>• Wants to spot any double-bookings or rate issues | • Channels going offline without warning<br>• Can't tell which rooms have sync issues | **Channel badges with sync status** — green = synced, orange = warning, red = offline |
| **4. Inspect Specific Rooms** | Taps individual room card to open Room Detail | • "Confirm no double-bookings, rates are correct"<br>• Wants to see guest history and notes | • Missing guest details when needed<br>• Can't quickly see room history | **Room detail shows**: full info, booking history, channel sources, guest notes, current status |
| **5. Mark Rooms Ready** | Taps "Mark Ready" for vacant rooms | • "These rooms will be vacant; housekeeping needs to know"<br>• Satisfied when action is quick | • Housekeeping not notified automatically<br>• Uncertain if change went through | **Climax: Tap "Mark Ready"** → housekeeping receives automatic notification<br>• Confirmation banner: "3 rooms marked ready — housekeeping notified." |
| **6. Handle Failures** | If channel shows offline banner | • "Which channels need manual sync?"<br>• Frustration at being blocked | • Can't adjust availability if channel is offline<br>• No clear path to retry | **Offline banner is subtle** — still shows bookings visible but notes sync status<br>• Maria can manually adjust availability; system remembers last known good state |

### Key Emotional Arc

```
Launch App → Relief (dashboard default) → Curiosity (booking grid) → Confidence (room details) → Satisfaction (mark ready) → Control (offline handling)
```

### Success Metrics for This Journey

- **Time to overview**: < 30 seconds from app launch to understanding weekend situation
- **Conflict detection**: 100% of double-bookings identified before guest arrival
- **Housekeeping notification**: 100% of "Mark Ready" actions trigger notification
- **Offline resilience**: Maria can still adjust availability when 1+ channels are offline

### Design Principles Demonstrated

1. **Default landing reduces friction** — Dashboard as default means Maria doesn't have to think about where to start
2. **Color-coding as language** — Channel badges communicate sync status instantly, no reading required
3. **Climax moment with confirmation** — "Mark Ready" action has clear before/after with housekeeping notification
4. **Graceful failure** — Offline channels still show bookings; manual override available without blocking primary task