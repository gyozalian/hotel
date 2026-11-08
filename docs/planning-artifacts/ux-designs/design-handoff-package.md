# Design Handoff Package — Hotel CRM

## Generated from `design-hotel-crm.md` tokens and `key-dashboard-desktop-1440.html` mockup

**Generated**: 2026-11-04
**Version**: v1.0
**Target**: Front-end development (CSS/HTML/React)

---

## 1. CSS Custom Properties (Design Tokens)

All tokens below are defined at the `:root` level in the application stylesheet. They are sourced directly from `design-hotel-crm.md` color, typography, spacing, and elevation tokens.

### 1.1 Color Tokens

```css
:root {
    /* Surfaces */
    --surface: #faf9f2;
    --surface-dim: #e8e4dc;
    --surface-bright: #faf9f2;
    --surface-container-lowest: #ffffff;
    --surface-container-low: #f5f3ee;
    --surface-container: #f0eee9;
    --surface-container-high: #eae8e3;
    --surface-container-highest: #e4e2dd;
    
    /* Text on surfaces */
    --on-surface: #1b1c19;
    --on-surface-variant: #4e453d;
    
    /* Inverse surfaces */
    --inverse-surface: #30312e;
    --inverse-on-surface: #f2f1ec;
    
    /* Outlines */
    --outline: #80756b;
    --outline-variant: #d1c4b9;
    
    /* Tint */
    --surface-tint: #715a3f;
    
    /* Primary palette (Tobacco Brown) */
    --primary: #59452b;
    --on-primary: #ffffff;
    --primary-container: #735c41;
    --on-primary-container: #f5d6b4;
    --inverse-primary: #e0c1a1;
    
    /* Secondary palette (Deep Burgundy) */
    --secondary: #a43b2c;
    --on-secondary: #ffffff;
    --secondary-container: #fd7d69;
    --on-secondary-container: #71160b;
    
    /* Tertiary palette (Midnight Navy) */
    --tertiary: #374a5f;
    --on-tertiary: #ffffff;
    --tertiary-container: #4f6278;
    --on-tertiary-container: #caddf8;
    
    /* Error palette */
    --error: #ba1a1a;
    --on-error: #ffffff;
    --error-container: #ffdad6;
    --on-error-container: #93000a;
    
    /* Fixed/adjusted shades */
    --primary-fixed: #fdddbb;
    --primary-fixed-dim: #e0c1a1;
    --on-primary-fixed: #281804;
    --on-primary-fixed-variant: #58432a;
    --secondary-fixed: #ffdad4;
    --secondary-fixed-dim: #ffb4a7;
    --on-secondary-fixed: #400200;
    --on-secondary-fixed-variant: #842417;
    --tertiary-fixed: #d0e4ff;
    --tertiary-fixed-dim: #b4c8e2;
    --on-tertiary-fixed: #071d30;
    --on-tertiary-fixed-variant: #35485d;
}
```

### 1.2 Typography Tokens

```css
/* Display headline font */
--font-display-lg-family: 'Libre Caslon Text', serif;
--font-display-lg-size: 48px;
--font-display-lg-weight: 400;
--font-display-lg-line-height: 1.1;
--font-display-lg-letter-spacing: -0.02em;

/* Body copy font */
--font-body-lg-family: 'DM Sans', sans-serif;
--font-body-lg-size: 16px;
--font-body-lg-weight: 400;
--font-body-lg-line-height: 1.6;
--font-body-lg-letter-spacing: 0.01em;
```

### 1.3 Spacing Tokens

```css
--spacing-unit: 8px;
--spacing-gutter: 24px;
--spacing-margin-mobile: 20px;
--spacing-margin-desktop: 64px;
--spacing-editorial-gap: 80px;
```

### 1.4 Corner Radius Tokens

```css
--rounded-sm: 0.125rem;    /* 2px */
--rounded-default: 0.25rem; /* 4px */
--rounded-md: 0.375rem;    /* 6px */
--rounded-full: 9999px;
```

### 1.5 Shadow Tokens

```css
--shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
--shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
```

### 1.6 Timing/Transition Tokens

```css
--transition-fast: 150ms cubic-bezier(0.4, 0, 0.2, 1);
--transition-normal: 250ms cubic-bezier(0.4, 0, 0.2, 1);
```

---

## 2. Component Specifications

### 2.1 Timeline Strip

| Property | Value | CSS Variable |
|----------|-------|--------------|
| Container background | `var(--surface)` | `--surface` |
| Container border-radius | `var(--rounded-md)` | `--rounded-md` |
| Container padding-top | `calc(var(--spacing-unit) * 2)` | — |
| Container padding-bottom | `calc(var(--spacing-unit) * 2)` | — |
| Strip gap | `var(--spacing-unit)` | `--spacing-unit` |
| Strip min-width | `calc(30 * 32px)` = `960px` | — |
| Day cell width | `32px` | — |
| Day cell height | `32px` | — |
| Day cell cursor | `pointer` | — |
| Hover scale transform | `scale(1.08)` | — |
| Active scale transform | `scale(0.98)` | — |
| Today indicator line width | `2px` | — |
| Today indicator color | `var(--primary)` | `--primary` |
| Booking slot height | `24px` | — |
| Booking slot border-radius | `var(--rounded-sm)` | `--rounded-sm` |
| Booking slot font-size | `10px` | — |
| Booking slot line-height | `1.2` | — |
| Reduced-motion transition | `none` | — |

### 2.2 Today Button

| Property | Value | CSS Variable |
|----------|-------|--------------|
| Display | `inline-flex` | — |
| Align-items | `center` | — |
| Gap | `var(--spacing-unit)` | `--spacing-unit` |
| Padding | `var(--spacing-unit) var(--spacing-gutter)` | `--spacing-unit`, `--spacing-gutter` |
| Background | `var(--surface-container)` | — (use `#F5F3EE`) |
| Border | `1px solid var(--outline)` | `--outline` |
| Border-radius | `var(--rounded-md)` | `--rounded-md` |
| Font-size | `13px` | — |
| Font-weight | `500` | — |
| Color | `var(--on-surface)` | `--on-surface` |
| Hover border-color | `var(--primary)` | `--primary` |
| Focus outline | `2px solid var(--primary)` | `--primary` |
| Focus outline-offset | `2px` | — |
| Active transform | `scale(0.98)` | — |
| Minimum tap target | 48px × 48px (recommended) | — |

### 2.3 Channel Filter Button

| Property | Value | CSS Variable |
|----------|-------|--------------|
| Padding | `var(--spacing-unit) var(--spacing-gutter)` | `--spacing-unit`, `--spacing-gutter` |
| Background (default) | `var(--surface-container)` | — (use `#F5F3EE`) |
| Border | `1px solid var(--outline)` | `--outline` |
| Border-radius | `var(--rounded-md)` | `--rounded-md` |
| Font-size | `12px` | — |
| Font-weight | `500` | — |
| Color (default) | `var(--on-surface-variant)` | `--on-surface-variant` |
| Color (hover) | `var(--on-surface)` | `--on-surface` |
| Color (active) | `var(--on-primary)` | `--on-primary` |
| Background (active) | `var(--primary)` | `--primary` |
| Border (active) | `1px solid var(--primary)` | `--primary` |
| White-space | `nowrap` | — |
| Hover border-color | `var(--on-surface-variant)` | `--on-surface-variant` |
| Active transform | `scale(0.98)` | — |
| Minimum tap target | 48px × 48px (recommended) | — |

### 2.4 KPI Card

| Property | Value | CSS Variable |
|----------|-------|--------------|
| Background | `var(--surface-container)` | — (use `#F5F3EE`) |
| Border | `1px solid var(--outline)` | `--outline` |
| Border-radius | `var(--rounded-md)` | `--rounded-md` |
| Padding | `var(--spacing-unit) var(--spacing-gutter)` | `--spacing-unit`, `--spacing-gutter` |
| Text-align | `center` | — |
| Hover border-color | `var(--primary)` | `--primary` |
| Hover transform | `translateY(-2px)` | — |
| Hover box-shadow | `var(--shadow-sm)` | --shadow-sm |
| KPI value font-family | `var(--font-display-lg-family)` | --font-display-lg-family |
| KPI value font-size | `24px` (desktop), `20px` (tablet) | --font-display-lg-size |
| KPI value font-weight | `400` | --font-display-lg-weight |
| KPI value line-height | `1.1` | --font-display-lg-line-height |
| KPI value letter-spacing | `var(--font-display-lg-letter-spacing)` | --font-display-lg-letter-spacing |
| KPI value color | `var(--primary)` | --primary |
| KPI label font-size | `12px` (desktop), `11px` (tablet) | — |
| KPI label font-weight | `500` | — |
| KPI label color | `var(--on-surface-variant)` | --on-surface-variant |
| KPI label text-transform | `uppercase` | — |
| KPI label letter-spacing | `0.1em` | — |

### 2.5 Room Card

| Property | Value | CSS Variable |
|----------|-------|--------------|
| Background | `var(--surface-container)` | — (use `#F5F3EE`) |
| Border | `1px solid var(--outline)` | `--outline` |
| Border-radius | `var(--rounded-md)` | --rounded-md |
| Padding | `var(--spacing-unit) var(--spacing-gutter)` | --spacing-unit, --spacing-gutter |
| Min-height | `120px` | — |
| Flex-direction | `column` | — |
| Justify-content | `space-between` | — |
| Hover border-color | `var(--on-surface-variant)` | --on-surface-variant |
| Room number font-family | `var(--font-display-lg-family)` | --font-display-lg-family |
| Room number font-size | `16px` | — |
| Room number color | `var(--primary)` | --primary |
| Room number margin-bottom | `var(--spacing-unit) / 2` | --spacing-unit |
| Channel badge padding | `2px 6px` | — |
| Channel badge background | `var(--surface-variant)` | --surface-variant |
| Channel badge border-radius | `var(--rounded-sm)` | --rounded-sm |
| Channel badge font-size | `10px` | — |
| Channel badge font-weight | `500` | — |
| Channel badge color | `var(--on-surface-variant)` | --on-surface-variant |
| Room status font-size | `11px` | — |
| Room status font-weight | `500` | — |
| Room status margin-top | `var(--spacing-unit) / 4` | --spacing-unit |
| Room rate font-size | `13px` | — |
| Room rate color | `var(--on-surface)` | --on-surface |

**Status border colors** (Left border only):
- Clean: `3px solid #4caf50` (#4CAF50)
- Dirty: `3px solid #ff9800` (#FF9800)
- Inspect: `3px solid #2196f3` (#2196F3)
- Ready: `3px solid #8bc34a` (#8BC34A)
- Out of Order: `3px solid #f44336` (#F44336)

---

## 3. Responsive Breakpoints

### 3.1 Media Query Structure

```css
/* Tablet (768px – 1439px) */
@media (min-width: 768px) and (max-width: 1439px) {
    :root {
        --spacing-unit: 8px;
        --spacing-gutter: 24px;
        --spacing-margin-mobile: 20px;
        --spacing-margin-desktop: 64px;
        --spacing-editorial-gap: 80px;
        --font-body-lg-size: 16px;
    }
    /* ... component-specific overrides ... */
}

/* Desktop (1440px+) */
@media (min-width: 1440px) {
    :root {
        --spacing-unit: 8px;
        --spacing-gutter: 24px;
        --spacing-margin-desktop: 64px;
        --spacing-editorial-gap: 80px;
    }
    /* ... full desktop component specs ... */
}
```

### 3.2 Breakpoint-Specific Values

| Token | Mobile (default) | Tablet (768px) | Desktop (1440px) |
|-------|-----------------|----------------|------------------|
| spacing-unit | 8px | 8px | 8px |
| spacing-gutter | 24px | 24px | 24px |
| spacing-margin-desktop | 64px | 64px | 64px |
| spacing-editorial-gap | 80px | 80px | 80px |
| font-body-lg-size | 16px | 16px | 16px |
| timeline-min-width | 21 days (672px) | 21 days (672px) | 30 days (960px) |
| kpi-value-size | 18px (mobile) | 20px (tablet) | 24px (desktop) |
| Today button width | auto | auto | auto |
| filter-button count | 5 visible | 5 visible (scrollable if needed) | 5 visible (scrollable if needed) |
| booking-grid columns | 1 (mobile) | 2+ (minmax) | auto-fit auto-fill |

---

## 4. Interaction Specifications

### 4.1 Timeline Drag-to-Adjust

| Step | Action | Visual State | ARIA | Accessibility |
|------|--------|--------------|------|---------------|
| 1 | User presses on `.timeline-booking` | `.timeline-booking.dragging`<br>`opacity: 0.8`<br>`box-shadow: 0 0 0 2px var(--primary-fixed)`<br>`cursor: grabbing` | `aria-grabbed="true"` on slot | Keyboard: Space/Enter activates drag start |
| 2 | User drags horizontally | Slot follows cursor/gesture<br>`.timeline-day.hover-under-cursor` highlights | Live region: `aria-live="polite"` announces "Adjusting booking duration" | Escape cancels, returns slot to original position |
| 3 | User drops | Snap to nearest day cell<br>`.timeline-booking.dropped`<br>Subtle checkmark confirmation for 1.2s | `aria-live="polite"` announces "Booking duration updated" | If invalid: `.timeline-booking.invalid-drop`<br>Shake animation + `var(--error)` border glow |
| 4 | User presses Escape during drag | `.timeline-booking` returns to original position<br>`aria-grabbed="false"` | Focus returns to originating element | No state change persisted |

### 4.2 Filter Toggle

| Action | State Change | Visual Update | ARIA Update |
|--------|-------------|---------------|-------------|
| Click inactive filter | `.filter-button.active` removed from previous, added to clicked | BG: `var(--primary)`, text: `var(--on-primary)`, border: `1px solid var(--primary)` | `aria-selected="true"` on clicked, `false` on others |
| Click "All" | All `.filter-button` get `aria-selected="false"`; one gets `aria-selected="true"` | Only "All" retains active state (or none active) | `role="tab"` keyboard navigation functional |
| ArrowLeft/ArrowRight | Focus moves left/right through filter buttons | Keyboard-focus `:focus-visible` outline applied | No visual change unless Space/Enter pressed |

### 4.3 Today Button

| Action | Result | Visual Cue | ARIA |
|--------|--------|------------|------|
| Click | Timeline strip scrolls to center `.timeline-day.today` | Smooth `margin-left` animation (150ms, `cubic-bezier(0.4, 0, 0.2, 1)`) | `aria-live="polite"` announces "Scrolling to today" |
| Hover | Border color changes to `var(--primary)` | Subtle transition (`var(--transition-fast)`) | N/A |
| Focus | `outline: 2px solid var(--primary)`, `outline-offset: 2px` | High-visibility focus ring | Meets WCAG 2.1 AA |

### 4.4 Hover States (General)

| Element | Hover Visual Change | Duration | Reduced-Motion |
|---------|--------------------|----------|----------------|
| `.timeline-day` | `transform: scale(1.08)` | `var(--transition-fast)` = 150ms | Disabled (`none`) |
| `.kpi-card` | `border-color: var(--primary)`, `transform: translateY(-2px)`, `box-shadow: var(--shadow-sm)` | `var(--transition-fast)` = 150ms | Disabled (`none`) |
| `.filter-button:not(.active)` | `border-color: var(--on-surface-variant)`, `color: var(--on-surface)` | `var(--transition-fast)` = 150ms | Disabled (`none`) |
| `.room-card` | `border-color: var(--on-surface-variant)` | No transition (instant) for clarity | N/A |

---

## 5. Measurement Reference Table

| Measurement | Value | Unit | Source |
|------------|-------|------|--------|
| Day cell width/height | 32 | px | Timeline spec (30 days × 32px = 960px) |
| Timeline strip min-width | 960 | px | 30 days × 32px |
| Gutter (horizontal) | 24 | px | `--spacing-gutter` |
| Margins (desktop) | 64 | px | `--spacing-margin-desktop` |
| KPI card margin (desktop) | 64 | px | `--spacing-margin-desktop` |
| Editorial gap | 80 | px | `--spacing-editorial-gap` |
| Corner radius (default) | 4 | px (`0.25rem`) | `--rounded-default` |
| Corner radius (sm) | 2 | px (`0.125rem`) | `--rounded-sm` |
| Shadow (md) | 4-6 | px | `--shadow-md` |
| Shadow (lg) | 10-15 | px | `--shadow-lg` |
| Transition (fast) | 150 | ms | `--transition-fast` |
| Transition (normal) | 250 | ms | `--transition-normal` |
| Body text size | 16 | px | `--font-body-lg-size` |
| Display headline size | 48 | px | `--font-display-lg-size` |
| KPI value (desktop) | 24 | px | — |
| KPI value (tablet) | 20 | px | — |
| KPI value (mobile) | 18 | px | — |
| Today button padding | 8 | 24 | `var(--spacing-unit) var(--spacing-gutter)` |
| Filter button padding | 8 | 24 | `var(--spacing-unit) var(--spacing-gutter)` |
| Channel badge padding | 2 | 6 | Hardcoded in mockup |
| Room card padding | 16 | 24 | `var(--spacing-unit) var(--spacing-gutter)` |
| Room card min-height | 120 | px | Mockup specification |
| Room status font-size | 11 | px | Mockup specification |
| Room rate font-size | 13 | px | Mockup specification |
| Outline border width | 1 | px | `--outline` |
| Status border (room card) | 3 | px | Mockup specification |
| Timeline booking slot height | 24 | px | Mockup specification |
| Timeline booking slot font-size | 10 | px | Mockup specification |
| Timeline today indicator line | 2 | px | Mockup specification |

---

## 6. Asset Generation Notes

### 6.1 SVG Icons (used in buttons)
- **Today button SVG**: Circle + polyline for "date" icon, 16×16 viewBox, `stroke-width: 2`, `fill: none`
- **All icons** use `currentColor` for text color inheritance, so they adopt `--on-surface`, `--primary`, etc. based on context

### 6.2 Image Assets
- No raster image assets required for v1 — all visuals are CSS/HTML rendered using design tokens
- If illustrations needed post-v1, asset spec will reference `design-hotel-crm.md` illustration style guidelines

### 6.3 Font Files
- **Libre Caslon Text**: Google Font or self-hosted serif font for headlines (`<h1>`, KPI values)
- **DM Sans**: Google Font or self-hosted sans-serif font for body copy and all UI text

Both fonts should be loaded via `<link rel="preconnect">` + `<link href="https://fonts.googleapis.com/css2?family=Libre+Caslon+Text:wght@400;500;600&display=swap" rel="stylesheet">` and similarly for DM Sans.

---