# User Journey Map — Housekeeping Staff: Room Status Coordination

**Persona**: Housekeeper at a small guest house/boutique hotel  
**Journey**: Shift start, updating room status during guest turnover  
**Date**: 2026-11-04  
**Context**: Pre-activation UX design for hotel CRM

---

## Journey Overview

The housekeeper needs to efficiently update room status as guests check out and new guests check in. The system must be fast, reliable, and provide clear audit trails — but shouldn't get in the way of the actual work.

### Stages & Touchpoints

| Stage | Action | Thoughts & Feelings | Pain Points | Delighters |
|-------|--------|---------------------|-------------|------------|
| **1. Open CRM on Device** | Opens web app on phone or terminal in housekeeping area | • "Let me see which rooms need attention"<br>• Wants quick overview without typing | • Slow load on mobile data<br>• Too many features cluttering the screen | **Dashboard shows room status overview** immediately — clean/dirty/inspect/ready/out of order<br>• **Single-column mobile layout** optimized for thumb navigation |
| **2. Select a Room** | Taps a room to quick-select | • "This room is ready — need to mark it so next guest can check in"<br>• Focused on the task, not the tool | • Can't easily find rooms that need updating<br>• Unclear which status to select | **Room status pill** on each card shows current color + text (e.g., "Green, Clean")<br>• **Quick-select tap cycle**: Clean → Inspect → Ready → Clean (loops) |
| **3. Change Status** | Selects new status via dropdown/swipe | • Changes from "Clean" → "Inspect" → "Ready" via selection<br>• Wants to mark special notes if needed | • Dropdowns too slow on mobile<br>• Can't add notes easily | **Status dropdown optimized for mobile** — large tap targets, swipe gestures<br>• **Special notes field** optional, appears when needed<br>• **System timestamps** the change and identifies which staff member made it |
| **4. Submit Update** | Submits status change | • "Done — system knows this room is ready now"<br>• Satisfied when confirmation is clear | • Uncertain if change synced to all staff<br>• Worried about losing work if connection drops | **Real-time update visible** to all authorized staff accessing the system<br>• **Notification sent** to housekeeping team when room is marked "ready"<br>• **Notification includes**: room number, property section, any special notes from previous guest |
| **5. Acknowledge Receipt** | Housekeeper acknowledges notification | • "OK, room is ready, I'll let the guest in"<br>• Updates status accordingly | • Acknowledgment process unclear<br>• No record of who acknowledged what | **Housekeeper taps "Acknowledge"** on notification<br>• **Status updates accordingly** — room shows as ready for check-in<br>• **Audit log** records all changes with timestamps and user IDs |
| **6. Handle Connection Loss** | If staff loses connection mid-shift | • "Hope the change saved locally..."<br>• Frustration at not knowing status | • Changes might not sync<br>• Unclear what already synced | **Changes queue locally** and sync when connection restored<br>• **Audit log** records all changes with timestamps and user IDs even offline<br>• **Visual indicator** shows sync status (pending/synced) |

### Key Emotional Arc

```
Open App → Orientation (status overview) → Action (quick status change) → Validation (real-time update) → Acknowledgement (acknowledge receipt) → Reliability (sync on recovery)
```

### Success Metrics for This Journey

- **Time per room status update**: < 30 seconds from selection to acknowledgment
- **Sync reliability**: 100% of changes synced when connection restored (even after extended outage)
- **Notification clarity**: 100% of "ready" notifications include room number and relevant special notes
- **Audit completeness**: Every status change recorded with user ID and timestamp

### Design Principles Demonstrated

1. **Touch-first design** — Large tap targets, swipe gestures for status cycling, minimal typing
2. **Local resilience** — Changes queue locally, sync when connection restored; never lose work
3. **Minimal ack friction** — "Acknowledge" tap is quick, no long forms or confirmation steps
4. **Information sovereignty** — Audit log provides transparency without burdening daily work
5. **Context in notifications** — Special notes from previous guest carried through to next check-in

### Empty & Error States

- **No rooms need updating**: "No rooms need status update — all set for check-in" with CTA to refresh
- **Room already being updated**: Badge shows "Updating..." with last update timestamp
- **Save failure**: Inline error + retry button; changes queued locally anyway