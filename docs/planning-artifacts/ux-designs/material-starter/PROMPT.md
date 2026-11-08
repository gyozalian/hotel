# How to get the remaining pages from your local model

The starter in this folder does the hard design work once, so the model only has to **compose** pages, not invent a design system:

| File | What it is | Model may edit? |
|---|---|---|
| `tokens.css` | Material 3 color roles (green seed), type scale, shape, elevation, motion, channel and room-status colors | **No** |
| `components.css` | App shell (drawer ≥1200px · rail 600–1199px · bottom bar <600px), buttons, cards, chips, tags, lists, table, text field, banner, segmented button | **No** (ask you first) |
| `dashboard.html` | Finished reference page. Every new page copies its structure. | **No** |

## Workflow (one page per session)

1. Start a **new** opencode session for each page. Don't do 12 pages in one session: the context fills up, gets compacted, and the design drifts.
2. Paste the **system brief** below, then **one page brief** from the list further down.
3. The model writes **one** file, `material-starter/<page>.html`. It's responsive, so there's no separate mobile/tablet/desktop copy.
4. Open it in a browser at 1440, 768 and 375 px wide and check it against the **review checklist**. Send corrections in the same session, then move on to the next page in a new session.

Don't load the BMAD UX-designer persona for this. It's built for specs and personas, not for building visual pages.

---

## System brief (paste this first, every session)

```
You are building one HTML mockup page for a hotel CRM, using an existing
Material 3 design system. You are composing pages, not designing a new style.

READ FIRST, in this order:
1. docs/planning-artifacts/ux-designs/material-starter/tokens.css
2. docs/planning-artifacts/ux-designs/material-starter/components.css
3. docs/planning-artifacts/ux-designs/material-starter/dashboard.html  (the reference page)

HARD RULES
- Create exactly ONE file: docs/planning-artifacts/ux-designs/material-starter/<name>.html
- It must be responsive (one file for all widths). Never create -mobile/-tablet/-desktop copies.
- Copy the <head> links and the whole <nav class="nav"> block from dashboard.html.
  Change only which nav item has aria-current="page".
- Link tokens.css and components.css. Do NOT copy their contents into the page.
- Do NOT define new CSS variables. Do NOT write hex colors, rgb() or font sizes in the page.
  Use only var(--md-*), var(--ch-*), var(--st-*), var(--sp-*), the .t-* type classes,
  and the components in components.css (.card, .btn--filled/.btn--tonal/.btn--outlined/.btn--text,
  .chip, .tag, .list, .table, .field, .banner, .segmented, .avatar, .icon).
- Icons: <span class="icon">icon_name</span> using Material Symbols names.
- A page-specific <style> block is allowed ONLY for layout (grid, flex, gap, widths) and must
  stay under about 60 lines.
- Use realistic data for a 6-room guest house called "Casa Verde" (rooms 1–6, euros,
  channels Booking.com / Airbnb / Expedia / Direct, staff Maria (owner), Ana and Luis
  (housekeeping)). No lorem ipsum, no "$0/night".
- Before writing, list the sections of the page and which component each one uses.
  Then write the file in one go.
- When done, say which parts you are unsure about. Do not write a validation report.
```

## Page briefs (paste one per session)

**Calendar** (`calendar.html`, nav: Calendar). The full version of the dashboard's 14-day timeline. Top: month switcher (icon buttons + "November 2026"), segmented "2 weeks / Month", channel filter chips, "New booking" filled button. Body: the same `.tl` grid as the dashboard, but 28 days and all 6 rooms, with bars colored by channel and the conflict on Room 3 marked. Right side at ≥1200px: a "Booking details" card for the selected bar (guest, dates, channel tag, gross / commission / net, pre-arrival status, buttons "Open guest" and "Move booking").

**Rooms** (`rooms.html`, nav: Rooms). Grid of room cards (2 columns on phone, 3 on tablet, 6 or 3 on desktop). Each card shows number + name, status tag (ready / clean / dirty / inspect / out of order), current guest or "Vacant", next arrival, and an outlined "Change status" button. Above the grid: status filter chips with counts. Housekeeping notification banner: "Room 2 marked ready by Ana · 10:42".

**Guests** (`guests.html`, nav: Guests). Desktop: list on the left (search field, list items with avatar, name, last stay, channel tag) and the selected guest's profile on the right. Phone: list only. Profile: header with avatar, name, contact chips (WhatsApp, email), then cards for Preferences (tags), Stay history (`.table`: dates, room, channel, net) and Notes (list + "Add note" text button).

**Automation** (`automation.html`, nav: Automation). Three cards in order: Booking confirmation, Pre-arrival instructions (3 days before), Upsell offer (2 days before). Each card has an on/off switch (build it from a `.segmented` On/Off if no switch exists), channel order ("WhatsApp, then email"), a message preview in a `card--filled`, and "Edit template". Below: an "Activity" list of the last 6 sent messages with status tags.

**Reports** (`reports.html`, nav: Reports). Date-range segmented button (This month / Last month / Year), KPI row (reuse the dashboard's `.kpis`), a revenue trend chart as inline SVG (12 bars, `fill: var(--md-primary)`, axis labels with `.t-label-medium`), an occupancy-by-channel `.table`, and an "Export CSV" outlined button.

**Channels & commission** (`channels.html`, nav: Channels). One card per channel: logo initial in an `.avatar`, connection status tag, commission % (`.field`), last sync time. Below: a monthly reconciliation `.table` (channel, bookings, gross, commission, net, owed to you) with a totals row.

**Users** (`users.html`, nav: Users). `.table` of staff: avatar + name, email, role tag, last active, icon button menu. "Invite user" filled button. On phones the table becomes a `.list`. Also show an "Invite user" dialog (shape `--md-shape-xl`, `--md-surface-container-high`, `--md-elev-3`) with name, email and role `.field`s, rendered open over a scrim.

**Access levels** (`access.html`, nav: Users). Rows = permissions grouped by area (Bookings, Rooms, Guests, Pricing, Reports, Users, Settings), columns = roles (Owner, Manager, Reception, Housekeeping). Each cell holds a checkbox, at least 48px tap target. Sticky header row. "Save changes" filled button + "Discard" text button in a bottom bar.

**Settings** (`settings.html`, nav: Settings). Section list on the left at ≥840px (Property, Rooms & rates, Pricing rules, Notifications, Billing), with the form on the right. Show "Pricing rules": rule cards like "If occupancy > 70% then +10%" built from `.field`s, plus "Add rule".

**Login** (`login.html`, no app shell). Centered card (max 400px) on `--md-surface-container-low`: logo, "Sign in to Casa Verde CRM", email + password `.field`s, "Forgot password?" text button, full-width filled "Sign in". Show one error state on the password field (`--md-error`).

**Landing** (`landing.html`, no app shell, marketing). Top bar with logo + "Sign in" text button + "Start free trial" filled button. Hero: headline (`.t-display-small`, display-medium on desktop), one-line value ("No more double bookings across Booking.com, Airbnb and Expedia"), CTA buttons, and a screenshot made by putting `dashboard.html` in an `<iframe>` inside a rounded card. Then 3 feature cards, a 3-tier pricing section (Starter €19 / Pro €39 / Multi-property €79, with the middle one highlighted using `--md-primary-container`), FAQ, footer.

---

## Review checklist (you, in a browser, about 2 minutes per page)

- [ ] Looks the same family as `dashboard.html`: same nav, same top bar, same card style.
- [ ] Check 1440 / 768 / 375: drawer → rail → bottom bar; no sideways scroll on the page.
- [ ] No giant headings: page title is the top bar (22px), section titles are 16px.
- [ ] Nothing looks empty or broken (a broken var() shows up as missing color or spacing).
- [ ] Search the file for `#` colors or `px` font sizes in the page `<style>`. There should be none.

## Fix the model setup too

The earlier session showed `</think>` and raw `<tool_call>` text leaking into a file, and the server crashed (ECONNRESET, then ECONNREFUSED):

- Start `llama-server` with `--jinja` and the model's own chat template, and set `--reasoning-format` to match the model (e.g. `deepseek` for `<think>` models). Then reasoning lands in `reasoning_content`, not in your files.
- Keep context at 64K or lower for these runs if 128K is crashing the server (memory). One page per session doesn't need more.
- If your model can read images, tell it to screenshot the page (e.g. Playwright) and compare it to `dashboard.html` before finishing. If it can't, you are the visual reviewer. That's what the checklist is for.

## Preview locally

Opening the HTML directly from disk works in a normal browser. To serve the folder:

```bash
npx serve docs/planning-artifacts/ux-designs/material-starter
```
