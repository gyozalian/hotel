# Architecture Spine Rubric Review

## Verdict

**Revise before handoff.** The spine has a sound initiative-level direction, passes the mechanical lint, and covers the major product areas, but it is not yet a sufficiently enforceable build substrate. The principal blockers are ambiguous availability ownership, an underspecified cross-module event/transaction contract, incomplete capability mapping, and an operational envelope that is effectively deferred rather than decided.

## Review basis

- Reviewed: `ARCHITECTURE-SPINE.md`
- Checklist: `.agents/skills/bmad-architecture/references/reviewer-gate.md`
- Driving inputs checked: PRD, PRD addendum, product brief, and experience spine
- Mechanical check: `lint_spine.py` passed with 0 findings
- Technology-currentness check: no concrete technologies are named, so there was nothing to verify; the deferred stack is still an implementation blocker

## Top findings

### Critical — Availability authority is not singular or enforceable

**Location:** AD-1, lines 36–40; Deferred, lines 160–161

“Booking and room inventory own” availability gives two modules authority over reservation overlap, room assignment, and availability. Two compliant implementations could therefore disagree about whether a room is bookable or how an external conflict is resolved. The exact channel reconciliation policy is also deferred even though channel conflict prevention is a core MVP outcome.

**Required disposition:** Tighten AD-1 to name one owner for each decision (for example, booking owns reservation/availability decisions; inventory owns room catalog and operational room state), define the single command path for external updates, and add conflict/reconciliation invariants before channel adapters.

### Critical — Cross-module mutation and event delivery are not buildable contracts

**Location:** AD-3, lines 48–52; AD-5, lines 60–64; dependency diagram, lines 80–90

The spine requires commands to “publish the resulting domain event” and requires asynchronous idempotency, but does not decide whether persistence and publication are atomic, how events are durably recorded, how consumers receive/version events, or what happens when publication fails. Two teams can obey every stated rule while choosing direct dispatch, an outbox, or best-effort publication, producing different reliability and retry behavior.

**Required disposition:** Decide or explicitly defer a durable event-delivery contract: transaction/outbox boundary, event envelope and versioning, delivery semantics, deduplication scope, retry/dead-letter behavior, and the authority for replay/reconciliation.

### High — Operational/environmental envelope is missing at initiative altitude

**Location:** Stack, lines 102–109; structural seed, lines 111–143; Deferred, line 164

The checklist specifically requires deployment and environments, infrastructure/provider strategy, and operations. The spine only shows abstract database/jobs/observability boxes and defers deployment environments, observability vendors, and CI/CD mechanics. It does not define production versus non-production environments, backup/restore and disaster recovery, availability or recovery targets, secret/configuration handling, health checks, alert ownership, data residency/retention, or cost guardrails.

**Required disposition:** Add an operational envelope section. It may keep vendors unselected, but must decide the environment topology, managed-versus-self-operated stance, backup/restore and RPO/RTO expectations, secrets, telemetry/alerting, migration/rollback policy, and operator-visible degraded modes.

### High — Capability map does not prove complete PRD coverage

**Location:** Capability map, lines 145–156

The map covers the headline feature names but does not explicitly account for several PRD commitments: direct booking and channel lead ingestion, channel conflict resolution, guest replies and follow-up actions, automation templates/triggers/timing plus execution history and retry, user lifecycle/login-session controls, room-status history, notification delivery, manual pricing overrides, and gross/commission/net reconciliation. Some may be implied by modules, but the checklist requires coverage rather than implication.

**Required disposition:** Expand the map so every in-scope PRD functional area has an owning module and governing ADs, or explicitly mark the item as a deliberate v1 exclusion/open question. Add the missing cross-module seams, especially booking↔channel sync, automation↔communication, housekeeping↔notifications, access↔identity, and reporting↔financial source data.

### High — AD-2 and AD-7 are principles, not sufficiently testable boundaries

**Location:** AD-2, lines 42–46; AD-7, lines 72–76

AD-2 says each entity has one owner but does not provide an ownership matrix for bookings, rooms, room status, rates, messages, guest replies, channel connections, audit events, automation runs, or reports. AD-7 limits shared code but does not define the allowed contract shape, event compatibility rules, or prohibition on shared database tables. Teams can therefore satisfy the prose while creating incompatible projections or persistence coupling.

**Required disposition:** Add an ownership/contract table and enforceable boundary rules: no cross-module table writes, published contract shapes, event versioning, projection ownership, and an explicit owner for audit/event records.

## Detailed rubric assessment

### Initiative-altitude coverage

**Partial.** The paradigm, dependency direction, major modules, shared-kernel intent, mutation path, authorization principle, and asynchronous work are appropriate for a whole-product spine. However, the initiative-level dimensions that coordinate all future slices are incomplete:

- no explicit transaction and event-delivery boundary;
- no identity/authentication and integration-credential boundary;
- no data lifecycle/privacy/retention boundary for guest and audit data;
- no operational/environmental envelope;
- no explicit degraded-mode and recovery model;
- no ownership matrix for cross-cutting records and projections.

These are not implementation details when omitted entirely; they are divergence points for independent feature teams.

### AD enforceability

| AD | Assessment |
| --- | --- |
| AD-1 | **Insufficient:** two owners are named and reconciliation is deferred. |
| AD-2 | **Partial:** good intent, but no entity ownership matrix or persistence boundary. |
| AD-3 | **Partial:** command/query separation is clear, but transaction/event atomicity is not. |
| AD-4 | **Insufficient:** inventory is omitted from `Binds`; audit schema, retention, access, and redaction are unspecified. |
| AD-5 | **Partial:** idempotency is required, but key scope, deduplication store, retry/dead-letter semantics, and replay are not. |
| AD-6 | **Partial:** application enforcement is right, but authentication, integration identities, policy source, and sensitive-data scope are absent. |
| AD-7 | **Partial:** shared-kernel contents are bounded, but cross-module contract and schema rules are not. |

### Deferred gaps

The deferrals are not all equally safe. Stack/provider selection can remain deferred if a first implementation slice has an explicit entry gate. Multi-property, portal, forecasting, ERP, and multilingual scope are reasonable post-v1 deferrals. In contrast, the following cannot remain broad deferrals while implementation slices begin:

1. channel conflict/reconciliation authority;
2. durable transaction-to-event delivery;
3. identity and integration credential model;
4. production/non-production and recovery envelope;
5. guest/audit data retention and protection;
6. automation and messaging failure/retry semantics.

Each should have a named owner, a revisit condition, and a “before” milestone in `Deferred` or be fixed as an AD.

### Capability coverage

The architecture map covers the seven product themes, but the PRD has 18 functional requirements and the map is too coarse to demonstrate that all are owned. In particular, automation execution/fallback, channel status/reconciliation, user account/session governance, guest reply handling, room status history, notification delivery, and financial reconciliation need explicit architectural placement. The map should also distinguish booking availability ownership from inventory room-state ownership.

### Operational envelope

**Fail.** The current operational diagram is a useful shape sketch, not an operational decision. For this product, visible stale/offline states, mobile use during shifts, asynchronous messaging, and booking integrity make recovery and operator observability part of the architecture’s core promise. The spine needs explicit production behavior when channels, jobs, messaging providers, or the primary store are unavailable.

## Positive evidence to retain

- The modular-monolith/hexagonal paradigm is appropriate for the greenfield repository and the product’s small-property scope.
- AD-3, AD-5, and AD-6 correctly establish application-boundary mutation, asynchronous safety, and non-UI authorization.
- UTC storage, property-local rendering, money-with-currency, and propagation of correlation/idempotency metadata are useful shared conventions.
- The spine explicitly avoids pretending that an implementation stack already exists.
- The structural seed is intentionally small and does not over-specify schemas or framework details.

## Recommended revision order

1. Split availability ownership and settle channel conflict/reconciliation.
2. Define the transaction, outbox/event, versioning, retry, and replay contract.
3. Add the initiative operational envelope and degraded-mode behavior.
4. Add an entity ownership and capability coverage matrix against the PRD.
5. Tighten audit, identity, data protection, and shared-contract rules.
6. Re-run `lint_spine.py` and this rubric before implementation handoff.
