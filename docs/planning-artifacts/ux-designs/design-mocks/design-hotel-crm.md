---
name: hotel-crm
description: CRM application UX design for guest houses and small hotels
colors:
  surface: '#faf9f2'
  surface-dim: '#e8e4dc'
  surface-bright: '#faf9f2'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f5f3ee'
  surface-container: '#f0eee9'
  surface-container-high: '#eae8e3'
  surface-container-highest: '#e4e2dd'
  on-surface: '#1b1c19'
  on-surface-variant: '#4e453d'
  inverse-surface: '#30312e'
  inverse-on-surface: '#f2f1ec'
  outline: '#80756b'
  outline-variant: '#d1c4b9'
  surface-tint: '#715a3f'
  primary: '#59452b'
  on-primary: '#ffffff'
  primary-container: '#735c41'
  on-primary-container: '#f5d6b4'
  inverse-primary: '#e0c1a1'
  secondary: '#a43b2c'
  on-secondary: '#ffffff'
  secondary-container: '#fd7d69'
  on-secondary-container: '#71160b'
  tertiary: '#374a5f'
  on-tertiary: '#ffffff'
  tertiary-container: '#4f6278'
  on-tertiary-container: '#caddf8'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#fdddbb'
  primary-fixed-dim: '#e0c1a1'
  on-primary-fixed: '#281804'
  on-primary-fixed-variant: '#58432a'
  secondary-fixed: '#ffdad4'
  secondary-fixed-dim: '#ffb4a7'
  on-secondary-fixed: '#400200'
  on-secondary-fixed-variant: '#842417'
  tertiary-fixed: '#d0e4ff'
  tertiary-fixed-dim: '#b4c8e2'
  on-tertiary-fixed: '#071d30'
  on-tertiary-fixed-variant: '#35485d'
  background: '#faf9f4'
  on-background: '#1b1c19'
  surface-variant: '#e4e2dd'
  on-surface-variant: '#4e453d'
  surface-variant-lowest: '#f0eee9'
  surface-variant-low: '#e8e4dc'
  surface-variant-high: '#d8d5d0'
  surface-variant-highest: '#d0d0d0'
  on-surface-variant-on: '#4e453d'
typography:
  display-lg:
    fontFamily: 'Libre Caslon Text', serif
    fontSize: 48px
    fontWeight: '400'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: 'Libre Caslon Text', serif
    fontSize: 36px
    fontWeight: '400'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-md:
    fontFamily: 'Libre Caslon Text', serif
    fontSize: 32px
    fontWeight: '400'
    lineHeight: '1.2'
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: 'Libre Caslon Text', serif
    fontSize: 24px
    fontWeight: '400'
    lineHeight: '1.3'
    letterSpacing: 0em
  body-lg:
    fontFamily: 'DM Sans', sans-serif
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
    letterSpacing: 0.01em
  body-md:
    fontFamily: 'DM Sans', sans-serif
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
    letterSpacing: 0.01em
  label-caps:
    fontFamily: 'DM Sans', sans-serif
    fontSize: 12px
    fontWeight: '500'
    lineHeight: '1.4'
    letterSpacing: 0.1em
  caption:
    fontFamily: 'DM Sans', sans-serif
    fontSize: 13px
    fontWeight: '400'
    lineHeight: '1.4'
    letterSpacing: 0em
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  unit: 8px
  gutter: 24px
  margin-mobile: 20px
  margin-desktop: 64px
  editorial-gap: 80px
---
## Brand & Style

The design system is rooted in the philosophy of "Hospitality First"—practical elegance that helps hotel owners manage their businesses efficiently while feeling in control. The target audience values clarity over complexity, seeking a reliable and intuitive system that reduces daily friction and gives them visibility into their property's performance.

The style is **Practical Clarity** with **Organized Simplicity**. It prioritizes clean layouts, clear visual hierarchy, and functional workflows that hotel owners can trust and navigate quickly. Every interaction is designed to be decisive and "anti-friction," eschewing unnecessary complexity for straightforward task completion.

## Colors

The palette is inspired by hospitality and property management environments:
- **Warm White (#FAF9F4)** serves as the primary canvas, providing a clean, non-clinical background that reduces eye strain during long property management sessions.
- **Soft Stone (#E8E4DC)** and **Light Gray (#F0EEE9)** are used for structural depth, subtle dividers, and secondary surfaces.
- **Tobacco Brown (#59452B)** is the primary accent color, used for essential UI elements, action buttons, and high-contrast typography that demands attention when needed.
- **Deep burgundy (#A43B2C)** is used sparingly for warnings, important notifications, and call-to-action elements that require immediate user focus.
- **Midnight Navy (#374A5F)** provides depth for interactive states, hover conditions, and disabled elements.
- **Error Red (#BA1A1A)** provides clear visual feedback for system errors and warnings.

## Typography

Typography is the primary vehicle for the brand's practical voice.
- **Libre Caslon Text** is the voice of the property owner. Its classic proportions and elegant serifs provide the readability required for reviewing bookings, rates, and reports during long hours of property management.
- **DM Sans** provides a quiet, functional counterpoint. It is used for body copy, navigational elements, and form inputs, ensuring clarity without competing with the headlines.

Large display titles should often use "optical sizing" logic—tighter leading and slightly negative letter spacing to create a cohesive visual block. Labels are always tracked out (0.1em) to maintain a sense of airy premiumness and legibility at smaller sizes.

## Layout & Spacing

This design system employs a **Functional Grid** structure. While it follows a 12-column structure on desktop, it prioritizes single-column vertical flows on mobile to match the way hotel owners typically interact with property management on their phones during breaks between guest interactions.

Spacing is purposeful. The `editorial-gap` (80px+) should be used between major content sections (like between a booking list and its details panel) to allow the user to mentally pause and refocus. Mobile layouts should maintain a minimum of 20px side margins to ensure the content feels framed like a page, rather than bleeding to the edges of the device. Vertical stacking is preferred for forms and lists to mimic the natural scroll pattern of phone-first property managers.

## Elevation & Depth

Depth is communicated through **Subtle Layering** and **Gentle Shadows** rather than sharp borders.
- **Surfaces:** Use the "Soft Stone" color to define containers against the "Warm White" base, creating clear separation between different functional areas (booking grid, guest panel, dashboard charts).
- **Shadows:** Shadows are mildly diffused and provide gentle lift without aggression. They simulate a soft touch of light hitting surfaces, with moderate blur radii (8-12px) and very low opacity, helping important elements stand out without visual noise.
- **Borders:** When borders are necessary, they are 1px thick and rendered in "Light Gray," creating a clean separation that feels professional and intentional.

## Shapes

The shape language is **Soft Moderate (0.375rem corner radius)**. While a sharp edge feels too aggressive and a pill-shape feels too digital/tech-heavy, a moderate rounding of corners mimics professional, considered design—warm but not informal. 

Larger containers (Room cards, Guest profile cards, Dashboard panels) may use `rounded-md` (0.375rem) to emphasize their functional, object-like quality. Input fields and interactive elements follow these corner radii to maintain a cohesive, professional appearance across all screens.

## Components

- **Buttons:** Primary buttons use a solid "Tobacco Brown" fill with "White" text for immediate action. Secondary buttons are "Soft Stone" with "Tobacco Brown" text or simply "Tobacco Brown" text with a 1px "Light Gray" border. Buttons are generously padded horizontally to create an touch-friendly silhouette that works well on both desktop and mobile tap targets.
- **Room Cards (Booking Grid):** Each room card shows room number, current status (clean/dirty/inspect/ready/out of order), channel badges (Booking.com, Airbnb, etc.), and net rate. Hover/focus reveals action buttons (mark ready, view details). Cards use the soft moderate radius and subtle shadows.
- **Channel Badges:** Small pill-shaped tags displaying the distribution platform name with its brand color or a neutral icon. Used alongside room numbers in the booking grid.
- **Status Pill:** Colored badges showing room status: Clean (soft green), Dirty (soft orange), Inspect (medium blue), Ready (bright green), Out of Order (soft red). Uses the soft moderate corner radius.
- **Dashboard Cards:** KPI cards showing occupancy, ADR, RevPAR with sparklines, trend arrows, and channel breakdown. Hover reveals detailed view or drill-down.
- **Input Fields:** Minimalist underlines in "Light Gray" that transition to "Tobacco Brown" on focus. Label text remains above the field or inside it as placeholder. Error states show red underline and error message below.
- **Navigation:** A persistent top app bar on desktop or bottom tab bar on mobile with: Today/Calendar, Bookings, Guests, Reports, Settings. Mobile first—tab bar with 3-5 primary destinations.
- **Filters and Controls:** Collapsible sidebar on desktop with booking filters (date range, channel, status), search, and quick actions. On mobile, these appear as bottom sheets or top accordion.
