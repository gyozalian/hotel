# User Journey Map — Carlos: Occupancy Adjustment & Pricing

**Persona**: Carlos, front desk/revenue manager at a small hotel with 10+ rooms  
**Journey**: Wednesday evening, adjusting pricing for upcoming weekend  
**Date**: 2026-11-04  
**Context**: Pre-activation UX design for hotel CRM

---

## Journey Overview

Carlos needs to optimize room rates based on occupancy levels. The dynamic pricing engine should make this intuitive and confident, not tedious.

### Stages & Touchpoints

| Stage | Action | Thoughts & Feelings | Pain Points | Delighters |
|-------|--------|---------------------|-------------|------------|
| **1. Open Pricing Tab** | Navigates from Dashboard to Pricing Rules tab | • "Let me see what rules are currently active"<br>• Curious about current occupancy level | • Can't find the tab<br>• Un sure what rules exist | **Persistent top app bar** with Pricing tab — always accessible, current occupancy shown: "65% across all channels" |
| **2. View Existing Rules** | Sees current rules displayed as cards | • "Increase 10% if occupancy > 70%." — familiar rule<br>• Wants to add a new rule for different threshold | • Can't tell if rule is active/inactive<br>• Unclear which rule applies when | **Rule cards show**: name, occupancy threshold, rate adjustment, last triggered date, status indicator |
| **3. Add New Rule** | Taps "Add Pricing Rule" → form opens | • "I need a rule for Friday night high occupancy"<br>• Anxious about setting wrong threshold/adjuster | • Form fields unclear what values are valid<br>• Fear of breaking existing rates | **Form opens with clear fields**: Rule name, Occupancy threshold (> %), Rate adjustment (+ %)\n• **Inline validation**: threshold must be 0-100%, adjustment -50% to +200% |
| **4. Configure Rule** | Sets threshold to 70%, adjustment to +10% | • "This feels right — when it's busy, raise rates"<br>• Validates the rule makes sense for business | • Uncertain if 70% is the right threshold<br>• Woried about upsetting guests with high rates | **System validates and saves** — rule activates immediately\n• **Visual feedback**: rule card updates with new threshold/adjustment\n• **Trend indicator**: Dashboard RevPAR sparkline shows upward movement as bookings come in at new rates |
| **5. Observe Activation** | Watches system evaluate rule hourly | • "Let me see if it triggers this weekend"<br>• Hopes the rule works without manual intervention | • Rule might not trigger even at 70%<br>• Unclear when/why rule activates | **Rule activates immediately** — system evaluates every hour\n• **Automatic rate adjustment** when occupancy crosses 70% threshold\n• **Dashboard shows**: RevPAR trend sparkline moving upward as bookings come in at new rates |
| **6. Confirm Success** | Views final result | • "Pricing rule saved — will auto-adjust rates when occupancy > 70%."<br>• Confident the system is working for them | • Rule save might fail validation<br>• Unclear what error means | **Confirmation banner**: "Pricing rule saved — will auto-adjust rates when occupancy > 70%."<br>• **3-5 seconds then auto-dismisses**<br>• **Error message if save fails**: "Threshold must be 0-100%, adjustment -50% to +200%" |

### Key Emotional Arc

```
Open Tab → Awareness (current rules) → Empowerment (add new rule) → Confidence (rule activates) → Trust (system works automatically)
```

### Success Metrics for This Journey

- **Rule creation time**: < 2 minutes from "Add Rule" to saved and active
- **Threshold accuracy**: Rule triggers at exactly the occupancy percentage user specifies (±2%)
- **Rate adjustment precision**: Adjustment applied exactly as specified (no rounding errors)
- **User confidence**: 90%+ of users say they trust the system to adjust rates appropriately

### Design Principles Demonstrated

1. **Immediate activation** — Rule saves and activates instantly; no "publish" or "deploy" step
2. **Clear validation feedback** — Users know instantly if their values are valid or not
3. **Visible outcomes** — RevPAR trend sparkline shows business impact immediately
4. **Confirmation without clutter** — Brief banner that auto-dismisses, keeps focus on the task
5. **Transparency** — Users can see what thresholds and adjustments are active at a glance

### Pain Point Mitigations

- **Rule save failure**: Specific error message explaining exact required ranges
- **No bookings yet**: Empty state with "Add Pricing Rule" CTA guides user to first rule
- **Multiple rules**: Cards show last triggered date so users understand which rule fired when