# Hotel CRM Architecture Overview

**Audience:** product, design, engineering, and operations stakeholders  
**Purpose:** align implementation planning around the architecture spine without turning the spine into a technology-specific solution design.

## What we are building

The Hotel CRM is a responsive, browser-based system of record for daily operations at small guest houses and boutique hotels. It centralizes bookings, room readiness, guest history, pricing rules, communication, automation, and operational reporting while keeping staff in control when an external channel is stale or unavailable.

The architecture is deliberately a **modular monolith with hexagonal boundaries**. This gives a small team one deployable application and one coherent transaction model while keeping feature areas independently understandable and ready for later extraction only if scale proves it necessary.

## The most important boundary

Booking is the authority for sellable availability. Channel adapters, calendar screens, pricing jobs, and manual booking flows must not invent their own overlap logic or write availability directly. They submit commands to booking, which validates the property scope, authorization, room assignment, and overlap rules before committing a change. Housekeeping submits inventory commands; only inventory persists readiness transitions. `out_of_order` removes a room from sellable availability, while `dirty`, `inspect`, and `clean` are operational states. Operational readiness and sellable availability are separate decisions: a clean room can still be reserved.

Inventory describes rooms and operational readiness. Housekeeping owns room-turnover tasks but does not persist readiness or decide sellable availability.

## How a change flows

1. A user, integration, or scheduled job submits an application command.
2. The application boundary authenticates the actor, checks property-scoped permissions, validates the command, and opens the transaction.
3. The owning module applies its business rule and persists its state.
4. The same transaction appends an audit record and versioned event intent to the transactional outbox.
5. After commit, workers dispatch events and run projections, channel sync, messaging, or automation.
6. Every consumer is idempotent and reports freshness, retries, terminal failure, or operator action.

Queries follow a separate read-only path. Reporting and other projections may be stale, but the UI must label freshness and never present stale external data as confirmed current availability.

## Module ownership

| Module | Owns | Does not own |
| --- | --- | --- |
| Booking | Reservations, assignments, overlap decisions, sellable availability | Room definitions or housekeeping readiness |
| Inventory | Room definitions and operational readiness state | Reservations or channel availability |
| Guest | Identity, preferences, and booking-event-derived stay history | Message delivery attempts |
| Pricing | Rules, revisions, pricing decisions | Booking creation or channel transport |
| Communication | Messages, delivery attempts, replies, generic follow-up tasks, internal notes | Guest identity and room-turnover tasks |
| Automation | Definitions, triggers, runs, fallbacks | Provider-specific delivery implementation |
| Housekeeping | Tasks, acknowledgements, turnover workflow | Commercial availability |
| Reporting | KPI and commission projections | Source-of-truth business mutations |
| Access | Users, roles, authentication state | Business authorization decisions outside application policies |
| Property | Property settings and channel configuration | Provider transport mechanics |

Cross-module collaboration uses versioned commands, queries, events, or projections. No module writes another module's tables.

## Operational behavior

External channels and messaging are asynchronous. The system must show:

- connected, stale, offline, retrying, failed, and resolved states;
- the last successful synchronization time;
- which property, source, room, and date range are affected;
- an operator task for unresolved availability conflicts;
- a safe retry or explicit manual resolution path.

Availability conflicts fail closed. A provider outage must not silently release inventory or claim that a message was delivered. Production requires separate environments, externalized secrets, health checks, structured logs, metrics, backups, restore procedures, and operator-visible degraded states.

## Interface contract

The browser UI is one interface over the same application contracts at every viewport. The Material starter is the visual seed:

- drawer navigation on large screens;
- rail navigation on medium screens;
- bottom navigation on compact screens;
- shared tokens and components rather than page-local primitives;
- text labels alongside color for room and synchronization states;
- visible keyboard focus, screen-reader labels, reduced-motion behavior, and accessible touch targets.

The required operational surfaces are dashboard, booking grid, room detail, guest profile, pricing rules, automation center, housekeeping coordination, reports, settings, and user access management. Loading, empty, stale, failed, retryable, and success states are part of each surface's contract.

## What is intentionally not fixed yet

The repository has no implementation runtime, so framework, database, job provider, hosting, identity, channel APIs, messaging, and observability choices remain deferred. See `ARCHITECTURE-SPINE.md §Deferred`; those choices must be verified before implementation while preserving its ownership, command, event, tenancy, time, money, and failure rules.

The detailed schema, API payloads, reconciliation policy, provider rate-limit strategy, migration mechanics, and CI/CD runbooks belong to the selected implementation stack and first delivery slices.
