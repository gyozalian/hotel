---
name: hotel-crm-material
description: CRM application UX design with Material Design for guest houses and small hotels
---

# Design System — Hotel CRM (Material Design)

## 1. Color Palette — Material Design Green Theme

The design system uses a **Material Design** green theme, adapted for hospitality CRM use.

### Primary Palette (Green)

| Token | Hex | Usage |
|-------|-----|-------|
| `--primary` | `#4CAF50` | Primary actions, main buttons, active states |
| `--on-primary` | `#FFFFFF` | Text on primary elements |
| `--primary-container` | `#81D4FA` | Hover/active states, containers over primary |
| `--on-primary-container` | `#000000` | Text on primary-container |
| `--primary-fixed` | `#C8E6C9` | Disabled states, subtle backgrounds |
| `--primary-fixed-dim` | `#A5D6A7` | Disabled subtle backgrounds |
| `--on-primary-fixed` | `#000000` | Text on primary-fixed |
| `--on-primary-fixed-variant` | `#1B5E20` | Subtle text on primary-fixed |

### Secondary Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `--secondary` | `#FFC107` | Secondary actions, warning states, accent elements |
| `--on-secondary` | `#000000` | Text on secondary |
| `--secondary-container` | `#FFCC80` | Hover states over secondary |
| `--on-secondary-container` | `#000000` | Text on secondary-container |

### Surface Palette (Neutral — Material Design standard)

| Token | Hex | Usage |
|-------|-----|-------|
| `--surface` | `#FFFFFF` | Main background |
| `--surface-dim` | `#F5F5F5` | Disabled backgrounds, inactive states |
| `--surface-bright` | `#FFFFFF` | Primary canvas |
| `--surface-container-lowest` | `#FAFAFA` | Edge-to-edge sections |
| `--surface-container-low` | `#F0F0F0` | Section backgrounds |
| `--surface-container` | `#E0E0E0` | Card backgrounds, containers |
| `--surface-container-high` | `#BDBDBD` | Dividers, subtle separation |
| `--surface-container-highest` | `#9E9E9E` | Disabled borders, separated sections |
| `--on-surface` | `#212121` | Primary text color (near-black per MD) |
| `--on-surface-variant` | `#616161` | Secondary text, hints, disabled text |
| `--inverse-surface` | `#212121` | Dark mode surface (light mode uses `--on-surface`) |
| `--inverse-on-surface` | `#FFFFFF` | Light text on dark surface |
| `--outline` | `#757575` | Input borders, disabled elements |
| `--outline-variant` | `#B0B0B0` | Hover states on outlines |

### Error Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `--error` | `#E53935` | Error states, danger messages |
| `--on-error` | `#FFFFFF` | Text on error |
| `--error-container` | `#FDEDEC` | Error backgrounds |
| `--on-error-container` | `#B00000` | Text on error-container |

### Tint (for disabled/interactive elements)

| Token | Hex | Usage |
|-------|-----|-------|
| `--surface-tint` | `#E8F5E9` | Subtle tint for disabled/interactive elements |

---

## 2. Typography — Material Design Roboto

The system uses **Roboto**, the official Material Design font, with your existing **DM Sans** as a fallback for consistent branding.

### Font Family

```css
font-family: 'Roboto', 'DM Sans', sans-serif;
```

### Typography Scale (Material Design)

| Token | Size | Line Height | Weight | Usage |
|-------|------|-------------|--------|-------|
| `--display-large` | 57px | 1.19 | 400 | Page headers, main titles |
| `--display-medium` | 45px | 1.24 | 400 | Section headers, card titles |
| `--display-small` | 36px | 1.24 | 400 | Module headers, section titles |
| `--headline-large` | 32px | 1.24 | 400 | H1 headings, major section titles |
| `--headline-medium` | 28px | 1.32 | 400 | H2 headings, important titles |
| `--headline-small` | 24px | 1.32 | 400 | H3 headings, sub-section titles |
| `--title-large` | 20px | 1.32 | 400 | Card titles, widget headers |
| `--title-medium` | 16px | 1.5 | 500 | Form labels, subtitles |
| `--title-small` | 14px | 1.5 | 500 | Form field labels, small headers |
| `--body-large` | 16px | 1.5 | 400 | Body text, paragraph text |
| `--body-medium` | 14px | 1.43 | 400 | Small body, meta text |
| `--body-small` | 12px | 1.43 | 400 | Captions, secondary text |
| `--label-large` | 13px | 1.43 | 500 | Form labels, button text |
| `--label-medium` | 11px | 1.43 | 500 | Compact labels, meta |
| `--label-small` | 10px | 1.43 | 500 | Tiny labels, helper text |
| `--label-small` | 10px | 1.43 | 500 | Helper text, inline text |
| `--display` | 24px | 1.33 | 600 | Display text in contexts |

### Font Weights

- `--font-weight-thin`: 100
- `--font-weight-light`: 300
- `--font-weight-regular`: 400
- `--font-medium`: 500
- `--font-semi-bold`: 600
- `--font-bold`: 700

### Letter Spacing

- `--letter-spacing-normal`: 0em
- `--letter-spacing-wide`: 0.02em (used for uppercase labels, captions)
- `--letter-spacing-wider`: 0.05em (used for large titles, H1)

---

## 3. Spacing — Material Design 8px Grid

All spacing follows the **Material Design 8px grid system**.

### Spacing Scale

| Token | Value | Usage |
|-------|-------|-------|
| `--spacing-0` | 0px | No spacing |
| `--spacing-1` | 4px | Tight spacing, icons |
| `--spacing-2` | 8px | Standard spacing, grid gutters |
| `--spacing-3` | 12px | Compact card padding |
| `--spacing-4` | 16px | Standard card padding, margins |
| `--spacing-5` | 20px | Form spacing, section margins |
| `--spacing-6` | 24px | Default spacing between major elements |
| `--spacing-7` | 28px | Expanded spacing |
| `--spacing-8` | 32px | Major sections, page margins |
| `--spacing-9` | 36px | Large gaps |
| `--spacing-10` | 40px | Page padding |
| `--spacing-12` | 48px | Major page sections |
| `--spacing-16` | 64px | Header/footer, major layouts |
| `--spacing-20` | 80px | Editorial gaps between major sections |

### Common Spacing Combinations

- `--spacing-mobile`: 16px (mobile margins)
- `--spacing-desktop`: 64px (desktop margins)
- `--spacing-gutter`: 24px (grid gutters, form controls)
- `--spacing-unit`: 8px (base unit for calculations)

---

## 4. Elevation & Shadows — Material Design

Material Design uses **elevation** to create depth through shadows. All shadows follow the MD elevation scale.

### Shadow Elevation Scale

| Token | Box Shadow CSS | Usage |
|-------|----------------|-------|
| `--shadow-level0` | `0px 0px 0px 0px` | No elevation (flat elements) |
| `--shadow-level1` | `0 1px 3px 0 rgba(0,0,0,0.12), 0 1px 2px 0 rgba(0,0,0,0.24)` | Minor elevation, hover states |
| `--shadow-level2` | `0 2px 4px -1px rgba(0,0,0,0.2), 0 4px 5px -1px rgba(0,0,0,0.14)` | Card elevation, default containers |
| `--shadow-level3` | `0 4px 6px -1px rgba(0,0,0,0.1), 0 1px 3px 0 rgba(0,0,0,0.08)` | Expanded cards, popovers |
| `--shadow-level4` | `0 10px 20px -1px rgba(0,0,0,0.04), 0 10px 20px -2px rgba(0,0,0,0.04)` | Dialogs, modal backgrounds |
| `--shadow-level5` | `0 14px 28px -2px rgba(0,0,0,0.1), 0 10px 10px -2px rgba(0,0,0,0.05)` | Premium elevation, menus |
| `--shadow-level6` | `0 19px 38px -2px rgba(0,0,0,0.1), 0 15px 12px -2px rgba(0,0,0,0.05)` | Rarely used, heavy elevation |

### Default Shadow (Card Components)

```css
box-shadow: var(--shadow-level2);
```

### Input Elevation

```css
box-shadow: var(--shadow-level1); /* On focus: var(--shadow-level3) */
```

---

## 5. Border Radius — Material Design

Material Design uses **consistent corner radii** for all interactive elements.

### Radius Scale

| Token | Value | Usage |
|-------|-------|-------|
| `--radius-none` | 0px | Borders only, no rounding |
| `--radius-tiny` | 2px | Small interactive elements |
| `--radius-small` | 4px | Input borders, tiny components |
| `--radius-medium` | 8px | Standard components, buttons |
| `--radius-large` | 12px | Cards, modals, larger containers |
| `--radius-full` | 9999px | Pill shapes, avatars, circular elements |
| `--radius-circle` | 50% | True circular elements |

### Default Corner Radius

```css
border-radius: var(--radius-medium); /* 8px - standard for most components */
```

### Component-Specific Radius

- **Buttons**: `var(--radius-small)` (4px) or `var(--radius-medium)` (8px)
- **Cards**: `var(--radius-medium)` (8px) to `var(--radius-large)` (12px)
- **Avatars**: `var(--radius-full)` or `50%`
- **Status pills/badges**: `var(--radius-tiny)` (2px) to `var(--radius-small)` (4px)
- **Text inputs**: `var(--radius-small)` (4px) or `var(--radius-medium)` (8px)

---

## 6. Component Specifications

### Buttons

| Variant | Background | Text Color | Border | Hover | Disabled |
|---------|-----------|-----------|--------|-------|----------|
| **Primary** | `#4CAF50` (--primary) | `#FFFFFF` (--on-primary) | None | `--primary` darkening 10% | `--on-primary-container` with 20% opacity |
| **Secondary** | `#FFC107` (--secondary) | `#000000` (--on-secondary) | None | `--secondary` darkening 10% | `--on-secondary-container` with 20% opacity |
| **Outlined** | Transparent | `--on-surface` | 1px solid `--outline` | Background `--surface-dim` on hover | `--on-surface-variant` with 50% opacity |
| **Text** | Transparent | `--primary` | None | Underline or background `--surface-dim` | `--on-surface-variant` with 50% opacity |
| **Icon** | Transparent | `--on-surface` | None | `--surface-dim` on hover | `--on-surface-variant` with 50% opacity |

**Button Padding**: Minimum 44px tap target height (MD requirement)
**Button Radius**: `--radius-small` (4px) or `--radius-medium` (8px)

### Text Inputs

| State | Background | Border | Text | Placeholder | Focus |
|-------|-----------|--------|------|-------------|-------|
| **Default** | `#FFFFFF` | 1px solid `--outline` (`#757575`) | `--on-surface` (`#212121`) | `--on-surface-variant` (`#616161`) | Border: `--primary` (`#4CAF50`), shadow: `--shadow-level3` |
| **Disabled** | `--surface-dim` (`#F5F5F5`) | 1px solid `--outline-variant` (`#B0B0B0`) | `--on-surface-variant` (`#616161`) | Same | Cursor: not-allowed, opacity: 0.5 |
| **Error** | `#FFFFFF` | 1px solid `#E53935` (`--error`) | `#E53935` (`--error`) | `#E53935` (`--error`) | Same as default with error message below |

**Input Padding**: Horizontal 12px, Vertical 12px (minimum 44px tap target)
**Border Radius**: `--radius-small` (4px) or `--radius-medium` (8px)

### Cards

- **Background**: `#FFFFFF` (`--surface`)
- **Border**: 1px solid `--outline` (`#757575`) or no border with `--shadow-level2`
- **Radius**: `--radius-medium` (`8px`)
- **Padding**: `--spacing-4` (`16px`) minimum, `--spacing-6` (`24px`) standard
- **Shadow**: `--shadow-level2` (default), `--shadow-level3` on hover

### App Bar / Top Navigation

- **Height**: 64px (desktop), 56px (mobile)
- **Background**: `#FFFFFF` (`--surface`)
- **Shadow**: `--shadow-level1` (`0 1px 3px 0 rgba(0,0,0,0.12)`)
- **Text Color**: `--on-surface` (`#212121`)
- **Secondary Text**: `--on-surface-variant` (`#616161`)
- **Icon Color**: `--on-surface` (`#212121`)

### Bottom Navigation (Mobile)

- **Height**: 56px
- **Background**: `#FFFFFF` (`--surface`)
- **Selected Item**: `--primary` (`#4CAF50`) with `--on-primary` (`#FFFFFF`) badge
- **Unselected Item**: `--on-surface-variant` (`#616161`)
- **Padding**: Even distribution across bottom

### Data Tables

- **Row Height**: 48px minimum (tap target)
- **Header Height**: 56px
- **Striped Rows**: Optional `--surface-dim` (`#F5F5F5`) alternate row background
- **Selection**: `--primary` with 15% opacity on selected rows
- **Hover**: `--surface-dim` on row hover

### Dialogs / Modals

- **Background**: `rgba(0,0,0,0.5)` backdrop with `--radius-medium` (`8px`)
- **Container**: `#FFFFFF` (`--surface`) with `--shadow-level4` (`0 10px 20px -1px rgba(0,0,0,0.04)`)
- **Padding**: `--spacing-6` (`24px`) minimum, `--spacing-8` (`32px`) standard
- **Max Width**: 90% of viewport, maximum 480px
- **Action Buttons**: At bottom, spaced with `--spacing-4` (`16px`)

### Chips / Tags

- **Background**: `--surface` (`#FFFFFF`) with 1px border `--outline` (`#757575`), or `--primary` (`#4CAF50`) with `--on-primary` (`#FFFFFF`)
- **Selected**: `--primary` background, `--on-primary` text
- **Unselected**: `--surface` with `--on-surface-variant` text, 1px border
- **Close Icon**: `--on-surface-variant` (`#616161`), 24x24px
- **Padding**: 6px horizontal, 4px vertical minimum

### Avatars

- **Size**: 32px (small), 48px (medium), 72px (large), 96px (extra large)
- **Background**: `--primary` (`#4CAF50`) with `--on-primary` (`#FFFFFF`) initials
- **Border**: 2px solid `--on-primary-container` (`#000000`) if initials in circle
- **Radius**: `--radius-full` (`50%`)

---

## 7. Responsive Breakpoints

Material Design standard breakpoints:

| Breakpoint | Width | Usage |
|-----------|-------|-------|
| **Mobile** | 320px | Phones, small tablets in portrait |
| **Tablet** | 600px | Tablets in portrait, large phones |
| **Desktop** | 960px | Small desktops, landscape tablets |
| **Large Desktop** | 1280px | Standard desktops, HD displays |
| **Extra Large** | 1440px+ | Large monitors, full-feature layout |

CSS Media Query Pattern:

```css
/* Mobile-first approach */
.element { /* mobile-first styles */ }

@media (min-width: 600px) { /* tablet */ }
@media (min-width: 960px) { /* desktop */ }
@media (min-width: 1280px) { /* large desktop */ }
@media (min-width: 1440px) { /* extra large */ }
```

---

## 8. Motion & Animation

### Transition Duration

| Token | Duration | Usage |
|-------|----------|-------|
| `--transition-fast` | 150ms | Button hover, ripple effects, quick state changes |
| `--transition-normal` | 250ms | Menu openings, panel transitions, tab changes |
| `--transition-slow` | 350ms | Complex animations, page transitions |

### Easing Functions

```css
--transition-timing: cubic-bezier(0.4, 0, 0.2, 1); /* Standard MD */
```

### Ripple Effect (MD Button)

```css
/* Material Design ripple */
button::after {
    content: '';
    position: absolute;
    border-radius: 50%;
    background: currentColor with 15% opacity;
    transform: scale(0);
    animation: ripple 600ms cubic-bezier(0.4, 0, 0.2, 1) forwards;
}

@keyframes ripple {
    to { transform: scale(2); opacity: 0; }
}
```

### Focus Ring

```css
/* Material Design focus ring */
element:focus-visible {
    outline: 2px solid var(--primary);
    outline-offset: 2px;
}
```

### Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
        animation-duration: 0s !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0s !important;
    }
}
```

---

## 9. Accessibility (WCAG AA)

### Color Contrast

- **Normal text**: Minimum 4.5:1 contrast ratio against background
- **Large text (18px+ or 14px bold)**: Minimum 3:1 contrast ratio
- **UI components & graphics**: Minimum 3:1 contrast ratio

### Focus Management

- All interactive elements must be focusable (`tabindex` or natural focus)
- Focus visible state: 2px solid primary color with 2px outline-offset
- Focus order: Logical, keyboard-navitable order
- Skip navigation link at top of page

### Touch Targets

- Minimum 48px × 48px for touch targets (MD requirement)
- Minimum 44px × 44px is acceptable but 48px preferred
- Spacing between touch targets: minimum 8px

### ARIA Labels

- All interactive elements must have descriptive `aria-label` or `aria-labelledby`
- Landmarks: `<header>`, `<nav>`, `<main>`, `<section>`, `<footer>` elements
- Error messages: Associated with form inputs via `aria-describedby`

### Typography Scaling

- Base font size: 16px (body)
- Text can be zoomed up to 200% without loss of content or functionality
- Line height: Minimum 1.2 for body text, 1.4 for small text

---

## 10. Iconography

### Material Icons Set

Use the **Material Icons** library (`@material/icons`) with the following weights:

- **Outlined** (`wght@400`): Navigation, secondary elements
- **Regular** (`wght@400`): Body text, general purpose
- **Sharp** (`wght@400`): Decorative elements (if needed)
- **Fill** (`wght@400`): Primary actions, emphasized icons
- **Round** (`wght@400`): Buttons, chips, interactive icons

### Common Icons for Hotel CRM

| Icon | Material Icon Name | Usage |
|------|-------------------|-------|
| ` hotel` | `hotel` | Property branding, page headers |
| ` room` | `room` | Room management, room details |
| ` guest` | `person` | Guest profiles, contacts |
| ` calendar_today` | `date_range` | Timeline, dates, bookings |
| ` schedule` | `schedule` | Pre-arrival automation, schedules |
| ` show_chart` | `bar_chart` | Reports, dashboards, KPIs |
| ` payments` | `monetization_on` | Commission tracking, payments |
| ` security` | `lock` | Login, security, access levels |
| ` people` | `people` | User management, team members |
| ` settings` | `settings` | Configuration, system settings |
| ` info` | `info` | Info modals, help, tooltips |
| ` error` | `error` | Errors, warnings, alerts |
| ` check_circle` | `check_circle` | Success states, completed actions |
| ` cancel` | `cancel` | Cancel actions, modals, closures |

### Icon Size

- **Inline with text**: 16px × 16px
- **Button/icon buttons**: 24px × 24px minimum, 32px × 32px preferred
- **Large icons**: 48px × 48px (hero sections, section headers)

---

## 11. Global CSS Variables (Ready for Implementation)

All tokens above are available as CSS custom properties. Here's the complete variable set for implementation:

```css
:root {
    /* Colors */
    --primary: #4CAF50;
    --on-primary: #FFFFFF;
    --primary-container: #81D4FA;
    --on-primary-container: #000000;
    --primary-fixed: #C8E6C9;
    --primary-fixed-dim: #A5D6A7;
    --on-primary-fixed: #000000;
    --on-primary-fixed-variant: #1B5E20;
    
    --secondary: #FFC107;
    --on-secondary: #000000;
    --secondary-container: #FFCC80;
    --on-secondary-container: #000000;
    
    --surface: #FFFFFF;
    --surface-dim: #F5F5F5;
    --surface-bright: #FFFFFF;
    --surface-container-lowest: #FAFAFA;
    --surface-container-low: #F0F0F0;
    --surface-container: #E0E0E0;
    --surface-container-high: #BDBDBD;
    --surface-container-highest: #9E9E9E;
    --on-surface: #212121;
    --on-surface-variant: #616161;
    --inverse-surface: #212121;
    --inverse-on-surface: #FFFFFF;
    --outline: #757575;
    --outline-variant: #B0B0B0;
    --error: #E53935;
    --on-error: #FFFFFF;
    --error-container: #FDEDEC;
    --on-error-container: #B00000;
    
    --background: #FAFAFA;
    --on-background: #212121;
    --surface-variant: #EEEEEE;
    --on-surface-variant-on: #616161;
    --surface-variant-lowest: #F5F5F5;
    --surface-variant-low: #F0F0F0;
    --surface-variant-high: #E0E0E0;
    --surface-variant-highest: #E0E0E0;
    
    /* Typography */
    --font-family: 'Roboto', 'DM Sans', sans-serif;
    
    /* Font sizes (clamp for responsive) */
    --font-display-large: clamp(44px, 5vw, 57px);
    --font-display-medium: clamp(36px, 4vw, 45px);
    --font-display-small: clamp(28px, 3vw, 36px);
    --font-headline-large: clamp(24px, 3vw, 32px);
    --font-headline-medium: clamp(20px, 2.5vw, 28px);
    --font-headline-small: clamp(18px, 2vw, 24px);
    --font-title-large: clamp(16px, 2vw, 20px);
    --font-title-medium: 16px;
    --font-title-small: 14px;
    --font-body-large: 16px;
    --font-body-medium: 14px;
    --font-body-small: 12px;
    --font-label-large: 13px;
    --font-label-medium: 11px;
    --font-label-small: 10px;
    
    /* Spacing */
    --spacing-unit: 8px;
    --spacing-gutter: 24px;
    --spacing-mobile: 16px;
    --spacing-desktop: 64px;
    
    /* Elevation */
    --shadow-level1: 0 1px 3px 0 rgba(0,0,0,0.12), 0 1px 2px 0 rgba(0,0,0,0.24);
    --shadow-level2: 0 2px 4px -1px rgba(0,0,0,0.2), 0 4px 5px -1px rgba(0,0,0,0.14);
    --shadow-level3: 0 4px 6px -1px rgba(0,0,0,0.1), 0 1px 3px 0 rgba(0,0,0,0.08);
    --shadow-level4: 0 10px 20px -1px rgba(0,0,0,0.04), 0 10px 20px -2px rgba(0,0,0,0.04);
    
    /* Border radius */
    --radius-tiny: 2px;
    --radius-small: 4px;
    --radius-medium: 8px;
    --radius-large: 12px;
    --radius-full: 9999px;
    
    /* Transitions */
    --transition-fast: 150ms cubic-bezier(0.4, 0, 0.2, 1);
    --transition-normal: 250ms cubic-bezier(0.4, 0, 0.2, 1);
}
```

This design system is now ready for implementation across all 12 pages of your hotel CRM. Would you like me to proceed with creating the HTML mockups for each page using these Material Design tokens?</think>
<tool_call>
<function=write>
<parameter=path>
C:\Projects\hotel\docs\planning-artifacts\ux-designs\design-mocks\design-hotel-crm-material.md