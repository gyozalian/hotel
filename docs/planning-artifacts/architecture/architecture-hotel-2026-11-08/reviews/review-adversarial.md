# Adversarial Review — Architecture Spine

## Verdict

**Not implementation-ready.** The architecture establishes sound principles, but its ADs leave enough semantic freedom for independently built modules to satisfy every stated rule while disagreeing about ownership, data contracts, mutation sequencing, asynchronous behavior, tenancy, and operational truth. Those divergences can produce double-booking, lost updates, unauthorized work, misleading reports, and irreconcilable audit trails.

## Findings

### 1. Availability authority is not a single owner

- **Location:** AD-1, lines 36–40; Structural Seed, lines 119–120
- **Independently built pair:** `booking` treats reservation overlap and assignable room state as authoritative; `inventory` treats room blocks and room status as authoritative and exposes a derived availability projection.
- **Trigger condition:** Both modules route changes through an application boundary and never write another module's persistence, yet the document does not say whether booking or inventory owns the atomic decision when a room is blocked, out of service, or reassigned.
- **Guard snippet:** Name one authoritative command and transaction boundary for “can this stay be accepted and assigned?”, define the invariant across reservation, room assignment, and room status, and specify the required lock/version check.
- **Potential consequence:** Each implementation can independently approve a stay that the other rejects, allowing double assignment or divergent calendar views.

### 2. Entity ownership does not define aggregate boundaries

- **Location:** AD-2, lines 42–46; Capability Map, lines 149–151
- **Independently built pair:** `guest` owns a guest aggregate including contact channels; `communication` owns a guest-recipient record including normalized contact details and consent.
- **Trigger condition:** Both claim one owner per entity and use published contracts, but “guest,” “recipient,” “contact method,” and “consent” are not identified as entities, value objects, or projections.
- **Guard snippet:** Publish an ownership matrix for each business concept, including identity, contact methods, consent, merge/split, deletion, and projection fields; prohibit duplicated mutable fields.
- **Potential consequence:** A phone-number change or guest merge can update one module while the other sends messages to stale or wrong data.

### 3. Command contracts can diverge while remaining intent-shaped

- **Location:** AD-3, lines 48–52; Naming convention, lines 96–98
- **Independently built pair:** UI sends `ChangeReservationDates`; channel adapter sends `RescheduleBooking`; both are valid commands and both authorize, validate, transact, and emit events.
- **Trigger condition:** The spine requires commands to express intent but does not define canonical command names, payloads, preconditions, or whether equivalent intents must converge on one use case.
- **Guard snippet:** Define canonical commands with versioned schemas, required fields, preconditions, actor semantics, and a mapping rule for external intents.
- **Potential consequence:** Manual and channel changes can apply different pricing, room-reassignment, cancellation, or notification rules despite obeying AD-3.

### 4. “Publish the resulting domain event” leaves transaction ordering undefined

- **Location:** AD-3, lines 48–52; Dependency Direction, lines 80–89
- **Independently built pair:** Module A publishes an event inside the database transaction; Module B commits first and dispatches through an outbox after commit.
- **Trigger condition:** Both authorize, validate, transact, persist, and publish, but the document does not require atomic outbox behavior, event timing, or visibility semantics.
- **Guard snippet:** Require transactional outbox records in the same commit as the mutation, define dispatch-after-commit, delivery guarantees, and behavior when persistence succeeds but dispatch is unavailable.
- **Potential consequence:** Consumers can observe events for rolled-back changes, or miss successful mutations permanently, producing stale projections and incorrect automation.

### 5. Idempotency-key scope is unspecified

- **Location:** AD-5, lines 60–64; Data & formats, lines 96–99
- **Independently built pair:** `channel-sync` scopes keys to provider event ID; `messaging` scopes keys to property plus message template and recipient.
- **Trigger condition:** Both use stable keys, retries, terminal status, and operator visibility, but no namespace, canonical input, retention period, or collision rule is defined.
- **Guard snippet:** Define key composition and namespace per operation, uniqueness scope, persistence lifetime, payload mismatch behavior, and whether retries share the same key.
- **Potential consequence:** Legitimate operations can be suppressed as duplicates, or the same external event can create multiple bookings/messages across adapters.

### 6. Retry and terminal-state semantics are underspecified

- **Location:** AD-5, lines 60–64
- **Independently built pair:** `automation` marks a job terminal after the final attempt; `reporting` marks it terminal when a retry is scheduled because no more work is currently available.
- **Trigger condition:** Both expose retryable and failed states, but terminal status, retry ownership, backoff, cancellation, dead-letter handling, and operator replay are not defined.
- **Guard snippet:** Specify a shared operation state machine, attempt numbering, retry schedule, cancellation rules, dead-letter/replay semantics, and the authority allowed to transition terminal states.
- **Potential consequence:** One module can stop retrying while another assumes eventual completion, causing missed messages, incomplete reports, or duplicate replays.

### 7. Audit event shape does not preserve before/after meaning

- **Location:** AD-4, lines 54–58; State & cross-cutting, lines 98–98
- **Independently built pair:** `pricing` records a compact “rate changed” event with the new amount; `housekeeping` records field-level patches with before and after values.
- **Trigger condition:** Both record actor/integration, property, timestamp, and a structured append-only audit event, but event type, subject identity, before/after representation, reason, and correlation are not standardized.
- **Guard snippet:** Define an audit schema with event type/version, subject and aggregate IDs, actor type, property, correlation/causation, reason, before/after or a documented omission policy, and immutable ordering.
- **Potential consequence:** Operators cannot reliably reconstruct why a rate, room status, or access decision changed, and audit comparisons across modules become impossible.

### 8. Actor identity is too weak for integrations and delegated work

- **Location:** AD-4, lines 54–58; Data & formats, lines 96–98
- **Independently built pair:** `access` records the service account as actor; `channel-sync` records the external channel as actor and the initiating user only in metadata.
- **Trigger condition:** Both attribute mutations to an actor or integration identity, but the distinction between initiator, executor, credential, impersonation, and external source is not defined.
- **Guard snippet:** Separate `initiated_by`, `executed_by`, `credential_or_integration`, and `source_event`; define delegation and impersonation rules for commands, jobs, and audit records.
- **Potential consequence:** Authorization reviews and incident investigations cannot determine which staff member caused an integration-driven mutation.

### 9. Property scope is not carried through all asynchronous descendants

- **Location:** AD-6, lines 66–70; Data & formats, lines 96–98; Deferred, lines 160–162
- **Independently built pair:** `automation` authorizes a scheduled job using the property captured at enqueue time; `reporting` resolves the property from the current user or a global report definition at execution time.
- **Trigger condition:** Both enforce property-scoped authorization in the application layer, but the required scope propagation and behavior when a role/property assignment changes after enqueue are unspecified.
- **Guard snippet:** Make property scope immutable in the command/job envelope, re-authorize at execution, define cross-property prohibition, and specify behavior for revoked users and deleted properties.
- **Potential consequence:** A queued job can mutate or expose data under the wrong property, especially after staff roles or configuration change.

### 10. The one-property operating context does not define tenancy keys

- **Location:** Deferred, lines 158–164; AD-6, lines 66–70
- **Independently built pair:** `booking` includes `property_id` in every aggregate and unique constraint; `reporting` stores property only on report definitions and derives it through joins.
- **Trigger condition:** Both can claim v1 is one property per operating context and still apply property-scoped authorization, but no mandatory tenancy key, database constraint, or cross-property boundary is specified.
- **Guard snippet:** Require property scope on every tenant-owned record, command, event, projection, unique key, cache key, and audit subject; define the boundary if a future portfolio context is introduced.
- **Potential consequence:** A future multi-property deployment can silently expose or combine bookings, guests, rates, and metrics across properties.

### 11. Projection freshness and read-your-writes behavior are undefined

- **Location:** AD-2, lines 42–46; AD-5, lines 60–64; External synchronization, lines 99–99
- **Independently built pair:** `reporting` consumes eventually consistent events; `booking` query handlers read the transactional store and promise immediate confirmation.
- **Trigger condition:** Both use permitted projections and asynchronous processing, but no freshness SLA, version marker, read-your-writes rule, or stale-data presentation contract is defined.
- **Guard snippet:** Specify per-query consistency expectations, projection lag metadata, aggregate/version tokens, stale-state behavior, and when a command response may be shown as authoritative.
- **Potential consequence:** Staff can see a booking confirmed in one screen while reports, automation, or another calendar still show availability.

### 12. Conflict resolution for simultaneous external updates is deferred without a safe default

- **Location:** External synchronization, lines 99–99; Deferred, lines 160–161
- **Independently built pair:** `channel-sync` uses last-write-wins by provider timestamp; `booking` rejects stale versions and creates a reconciliation task.
- **Trigger condition:** Both reconcile through the booking/inventory owner and preserve sync status, yet the core conflict policy is explicitly deferred.
- **Guard snippet:** Define a mandatory pre-adapter conflict policy: version/source precedence, duplicate detection, cancellation-versus-modification rules, human escalation, and safe availability behavior while unresolved.
- **Potential consequence:** Different adapters can resolve the same simultaneous update differently, creating phantom availability, lost cancellations, or duplicate reservations.

### 13. Money representation does not define arithmetic or rounding ownership

- **Location:** Data & formats, lines 96–98; Capability Map, lines 152–154
- **Independently built pair:** `pricing` stores decimal minor units and rounds per line item; `reporting` stores amount plus currency and rounds only at report totals.
- **Trigger condition:** Both represent money as amount plus currency and use module-owned persistence, but scale, numeric type, tax inclusion, allocation, conversion, and rounding mode are unspecified.
- **Guard snippet:** Define money precision, rounding mode and stage, tax/fee inclusion, allocation rules, currency conversion authority, and canonical serialized shape.
- **Potential consequence:** Booking totals, channel commissions, invoices, and reports disagree by small amounts that accumulate into financial reconciliation failures.

### 14. Time semantics do not cover business dates and DST

- **Location:** Data & formats, lines 96–98; Ports, lines 29–30
- **Independently built pair:** `automation` schedules by UTC instant; `housekeeping` schedules by property-local date and local wall-clock time.
- **Trigger condition:** Both store UTC and render in property locale and can use a clock port, but check-in dates, quiet hours, cutoff dates, DST gaps/folds, and recurrence zones are not specified.
- **Guard snippet:** Distinguish instants from property-local dates/times, require an IANA timezone for schedules, define DST resolution, and assign ownership of business-date calculations.
- **Potential consequence:** Messages, room turns, price changes, and no-show actions run an hour early/late or on the wrong calendar day.

### 15. Configuration ownership and adapter configuration can split

- **Location:** Capability Map, lines 155–156; AD-2, lines 42–46; AD-6, lines 66–70
- **Independently built pair:** `property` owns channel credentials and mapping configuration; infrastructure adapters own provider settings and cache a local copy.
- **Trigger condition:** Both keep business entities module-owned and authorize property-scoped commands, but the map explicitly places property and channel configuration in two locations without defining the source of truth.
- **Guard snippet:** Define which configuration fields are business-owned versus infrastructure-owned, version and publish changes, prohibit adapter-side mutation, and specify secret storage/rotation and cache invalidation.
- **Potential consequence:** A disconnected adapter can continue using revoked credentials or stale room/rate mappings, causing unauthorized syncs and incorrect bookings.

### 16. Operational truth is split between audit, telemetry, and job status

- **Location:** AD-4, lines 54–58; AD-5, lines 60–64; Structural flow, lines 135–143
- **Independently built pair:** `communication` treats provider delivery receipts as the operation's terminal status; `automation` treats job completion as success and stores provider outcomes only in telemetry.
- **Trigger condition:** Both expose failures and stale integrations and send audit/telemetry, but no authority is defined for business operation status versus infrastructure delivery status.
- **Guard snippet:** Define a common operation record linking command, job, provider attempt, audit event, and outcome; distinguish accepted, sent, delivered, rejected, and unknown states.
- **Potential consequence:** Operators and reports can claim a message or channel update succeeded when the provider rejected it, or retry an already delivered action.

### 17. Event ordering and causation are not contractually constrained

- **Location:** Data & formats, lines 96–98; Dependency Direction, lines 80–89
- **Independently built pair:** `booking` emits `ReservationChanged` then `RoomAssigned`; `reporting` emits one combined `ReservationUpdated` event.
- **Trigger condition:** Both use past-tense domain events and carry correlation/idempotency metadata, but event granularity, ordering, causation links, and consumer expectations are unspecified.
- **Guard snippet:** Define event versioning, aggregate sequence numbers, causation IDs, ordering scope, batching rules, and whether consumers must tolerate missing/interleaved events.
- **Potential consequence:** Automation or projections can observe an impossible intermediate state or apply updates out of order.

### 18. Read-only queries can still produce divergent side effects

- **Location:** AD-3, lines 48–52; State & cross-cutting, lines 98–98
- **Independently built pair:** `reporting` query lazily materializes a projection/cache; `booking` query records “last viewed” and updates an availability snapshot.
- **Trigger condition:** Both describe their paths as queries and do not mutate business state directly, but “read-only” is not defined for caches, projection checkpoints, access logs, or operational counters.
- **Guard snippet:** Define query side-effect boundaries: no business mutation, no authorization bypass, allowed non-business telemetry, and whether lazy materialization must use a separate projection worker.
- **Potential consequence:** A query can alter data relied on by another module, create timing-dependent behavior, or be used to bypass command audit requirements.
