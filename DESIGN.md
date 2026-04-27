# WHISPERS — Design Specification
> **Design System:** Nocturne  
> **Source:** Stitch MCP · Project `11242591884318792549`  
> **Color Mode:** Dark  
> **Last Updated:** 2026-04-27

---

## 1. Brand & Philosophy

The design system is rooted in the concept of **"Digital Solitude."** It aims to create a sanctuary for the unspoken, evoking the stillness of a midnight journal entry. The personality is **poetic, vulnerable, and safe** — a quiet space where users can express thoughts they never intend to send.

The visual style blends **Minimalism** with **Glassmorphism**, emphasising soft luminescence over harsh edges. It avoids the clinical coldness of typical dark modes by using a warm, deep navy base and ethereal lavender highlights. The interface feels weightless, like ink floating on dark water.

---

## 2. Color Palette

### Named Colors (Full Token Set)

| Token | Hex | Role |
|-------|-----|------|
| `background` | `#12121f` | App background |
| `surface` | `#12121f` | Base surface layer |
| `surface-dim` | `#12121f` | Dimmed surface |
| `surface-bright` | `#383847` | Elevated / active surface |
| `surface-container-lowest` | `#0d0d1a` | **The Void** — deepest background |
| `surface-container-low` | `#1a1a28` | Low-elevation containers |
| `surface-container` | `#1e1e2c` | Standard container |
| `surface-container-high` | `#292937` | High-elevation container |
| `surface-container-highest` | `#343342` | Highest-elevation container |
| `surface-variant` | `#343342` | Variant surfaces |
| `surface-tint` | `#ddb8ff` | Surface tint (lavender glow) |
| `on-surface` | `#e3e0f4` | Primary text on surface |
| `on-surface-variant` | `#cdc3d0` | Secondary text on surface |
| `inverse-surface` | `#e3e0f4` | Inverse surface (light) |
| `inverse-on-surface` | `#2f2f3d` | Text on inverse surface |
| `outline` | `#968e9a` | Borders & dividers |
| `outline-variant` | `#4b444f` | Subtle dividers |

### Primary (Ethereal Lavender)

| Token | Hex | Role |
|-------|-----|------|
| `primary` | `#e1bfff` | Primary interactive elements |
| `on-primary` | `#421e65` | Text/icons on primary |
| `primary-container` | `#c9a0f0` | **Ethereal Lavender** — buttons, highlights |
| `on-primary-container` | `#56327a` | Text on primary container |
| `inverse-primary` | `#724e97` | Inverse primary accent |
| `primary-fixed` | `#f0dbff` | Fixed primary (always same) |
| `primary-fixed-dim` | `#ddb8ff` | Dimmed fixed primary |
| `on-primary-fixed` | `#2b024f` | Text on primary fixed |
| `on-primary-fixed-variant` | `#5a367d` | Variant text on primary fixed |

### Secondary

| Token | Hex | Role |
|-------|-----|------|
| `secondary` | `#d6bcf4` | Secondary interactive |
| `on-secondary` | `#3b2754` | Text on secondary |
| `secondary-container` | `#523d6c` | Secondary container |
| `on-secondary-container` | `#c4abe1` | Text on secondary container |
| `secondary-fixed` | `#eedcff` | Fixed secondary |
| `secondary-fixed-dim` | `#d6bcf4` | Dimmed fixed secondary |
| `on-secondary-fixed` | `#25113e` | Text on secondary fixed |
| `on-secondary-fixed-variant` | `#523d6c` | Variant text on secondary fixed |

### Tertiary

| Token | Hex | Role |
|-------|-----|------|
| `tertiary` | `#ddc1ff` | Tertiary accent |
| `on-tertiary` | `#3d235f` | Text on tertiary |
| `tertiary-container` | `#c2a4ea` | Tertiary container |
| `on-tertiary-container` | `#513774` | Text on tertiary container |
| `tertiary-fixed` | `#eddcff` | Fixed tertiary |
| `tertiary-fixed-dim` | `#d8b9ff` | Dimmed fixed tertiary |
| `on-tertiary-fixed` | `#270a49` | Text on tertiary fixed |
| `on-tertiary-fixed-variant` | `#543a77` | Variant text on tertiary fixed |

### Semantic / Error

| Token | Hex | Role |
|-------|-----|------|
| `error` | `#ffb4ab` | Error state |
| `on-error` | `#690005` | Text on error |
| `error-container` | `#93000a` | Error container background |
| `on-error-container` | `#ffdad6` | Text on error container |

### Key Brand Colors (Highlight)

| Name | Hex | Usage |
|------|-----|-------|
| **The Void** | `#0d0d1a` | Primary background — deep, infinite canvas |
| **The Inner Sanctum** | `#1a0533` | Cards and containers — privacy & containment |
| **Ethereal Lavender** | `#c9a0f0` | Primary actions, focus states, meaningful highlights — use sparingly |
| **Ghost Text** | `#a0a0b8` | Secondary information — recedes into the background |

---

## 3. Typography

### Type Scale

| Token | Font Family | Size | Weight | Line Height | Letter Spacing |
|-------|-------------|------|--------|-------------|----------------|
| `headline-xl` | **Noto Serif** | 40px | 400 | 1.2 | -0.02em |
| `headline-md` | **Noto Serif** | 24px | 400 | 1.4 | — |
| `body-lg` | **Inter** | 18px | 300 | 1.6 | — |
| `body-md` | **Inter** | 16px | 400 | 1.5 | — |
| `label-sm` | **Inter** | 12px | 500 | 1.0 | 0.05em |

### Font Roles

| Role | Font | Notes |
|------|------|-------|
| **Headline / Display** | Noto Serif | Literary, timeless feel. Use for titles & expressive moments. |
| **Body** | Inter (300–400) | Clarity & modern efficiency. Lighter weights for a delicate, airy feel. |
| **Labels** | Inter (500) | Small-caps or increased letter-spacing for quiet, organised appearance. |

> **Rule:** Headings use Noto Serif for a literary feel. Body & interface text uses Inter at lighter weights (300/400) to maintain a delicate, airy atmosphere. Labels use increased letter-spacing for understated clarity.

---

## 4. Spacing & Layout

| Token | Value | Usage |
|-------|-------|-------|
| `unit` | 8px | Base grid unit |
| `stack-gap` | 16px | Inline / grouped element gap |
| `container-padding` | 24px | Horizontal page margins |
| `section-gap` | 40px | Between distinct content sections |

### Layout Philosophy: "No Grid"
- Content is **centered and floats** within the deep navy void — evoking a personal journal.
- Use **24px horizontal margins** for breathability.
- **40px+ vertical spacing** between entries to allow mental pauses.
- Related interactive elements: **8px or 16px gap**.

---

## 5. Elevation & Depth

Depth is conveyed through **Tonal Layers** and **Luminescence**, NOT physical shadows.

| Level | Token / Color | Description |
|-------|--------------|-------------|
| 0 — Background | `#0d0d1a` | The infinite void canvas |
| 1 — Cards | `#1a0533` + 1px inner stroke (Lavender @ 10% opacity) | Sense of containment and privacy |
| Glows | Primary Lavender @ 30% opacity, `0px 4px 20px` blur | Active states & primary buttons |
| Ghosting | Text color @ 20% opacity | Inactive / placeholder elements |

---

## 6. Shape & Roundness

The system uses **pill-shaped geometry** for all interactive components. Sharp corners are strictly avoided to maintain a "safe" and "soft" emotional profile.

| Scale | Value | Usage |
|-------|-------|-------|
| `sm` | 0.5rem (8px) | Minimal rounding |
| `DEFAULT` | 1rem (16px) | Standard elements |
| `md` | 1.5rem (24px) | Cards |
| `lg` | 2rem (32px) | Large cards |
| `xl` | 3rem (48px) | Prominent containers |
| `full` | 9999px | **Buttons, inputs** (pill shape) |

> **Rule:** Buttons and inputs are fully rounded (pill). Cards use `md`–`lg` (24px–32px) radius. No sharp corners anywhere.

---

## 7. Components

### Buttons
- **Primary:** Lavender background (`primary-container`) with dark text (`on-primary`). Features a subtle bloom (glow effect: `0px 4px 20px` Lavender @ 30%). Fully pill-shaped.
- **Secondary:** Ghost style — thin lavender border, no fill, lavender text.

### Cards
- Background: `#1a0533` (Inner Sanctum / `surface-container-low` variant)
- Corner radius: 24px–32px (`md` to `lg`)
- Inner glow: Top-aligned inner shadow in light purple (suggests depth)
- Soft drop shadow to lift from navy background
- **No explicit border lines** — use background color shifts for separation

### Inputs
- Minimalist pill-shaped fields (fully rounded)
- Only a bottom border that **illuminates** on focus (`primary-container` color)
- Cursor: Soft-pulsing lavender bar
- Placeholder text: Italic serif font, poetic fragments (e.g., *"Write into the dark..."*) at low opacity

### Chips / Tags
- Small pill-shaped elements
- Semi-transparent purple fill
- Lavender text

### The "Ink" Component *(Specialty)*
- Specialized text entry area
- Text **slowly fades** from bright white → muted lavender as the user types
- Symbolizes the passage of time and thought

### Placeholders
- Italicized serif font (Noto Serif), low opacity (~20–30%)
- Use poetic fragments instead of generic placeholder text
- Examples: *"Write into the dark..."*, *"A thought for no one..."*

---

## 8. Effects & Motion

### Glassmorphism Recipe
Apply to floating elements (modals, FABs, overlays):
- **Background:** `surface-variant` at 60% opacity
- **Backdrop Filter:** `blur(20px–40px)`

### Glow Effects
- **Primary glow:** `box-shadow: 0px 4px 20px rgba(201, 160, 240, 0.30)`
- **Active button bloom:** Diffused outer glow using `primary-container` at 30% opacity

### Motion / Animation
- Smooth transitions with a **Quintessential Out** cubic-bezier: `cubic-bezier(0.22, 1, 0.36, 1)`
- All transitions should feel liquid and unhurried

---

## 9. Do's and Don'ts

### ✅ Do
- Use **tonal layers** for depth instead of box shadows
- Use **generous vertical spacing** (40px+) between journal entries
- Use **Noto Serif** for titles and emotionally expressive moments
- Use **Inter** at lighter weights (300) for body copy — delicate and airy
- Add a **soft lavender glow** to primary CTAs and active states
- Use **pill shapes** for all interactive elements

### ❌ Don't
- Don't use `#000000` pure black — use `#0d0d1a` (The Void) instead
- Don't use sharp corners — everything should feel soft and approachable
- Don't use 1px solid borders for separation — use background color shifts
- Don't use `#ffffff` white — use `on-surface` (`#e3e0f4`) for text
- Don't overuse Ethereal Lavender (`#c9a0f0`) — it should feel like a "spark of thought," rare and meaningful

---

## 10. Flutter Implementation Notes

### Color Constants
```dart
// lib/core/theme/app_colors.dart

class AppColors {
  // Backgrounds
  static const background           = Color(0xFF12121F);
  static const surfaceContainerLowest = Color(0xFF0D0D1A); // The Void
  static const surfaceContainerLow  = Color(0xFF1A1A28);
  static const surfaceContainer     = Color(0xFF1E1E2C);
  static const surfaceContainerHigh = Color(0xFF292937);
  static const surfaceContainerHighest = Color(0xFF343342);
  static const surfaceBright        = Color(0xFF383847);

  // Primary (Ethereal Lavender)
  static const primary              = Color(0xFFE1BFFF);
  static const onPrimary            = Color(0xFF421E65);
  static const primaryContainer     = Color(0xFFC9A0F0);
  static const onPrimaryContainer   = Color(0xFF56327A);
  static const inversePrimary       = Color(0xFF724E97);

  // Secondary
  static const secondary            = Color(0xFFD6BCF4);
  static const onSecondary          = Color(0xFF3B2754);
  static const secondaryContainer   = Color(0xFF523D6C);
  static const onSecondaryContainer = Color(0xFFC4ABE1);

  // Tertiary
  static const tertiary             = Color(0xFFDDC1FF);
  static const onTertiary           = Color(0xFF3D235F);
  static const tertiaryContainer    = Color(0xFFC2A4EA);
  static const onTertiaryContainer  = Color(0xFF513774);

  // On-Surface
  static const onSurface            = Color(0xFFE3E0F4);
  static const onSurfaceVariant     = Color(0xFFCDC3D0);

  // Error
  static const error                = Color(0xFFFFB4AB);
  static const onError              = Color(0xFF690005);
  static const errorContainer       = Color(0xFF93000A);
  static const onErrorContainer     = Color(0xFFFFDAD6);

  // Outline
  static const outline              = Color(0xFF968E9A);
  static const outlineVariant       = Color(0xFF4B444F);

  // Brand Aliases
  static const theVoid              = Color(0xFF0D0D1A);
  static const innerSanctum         = Color(0xFF1A0533);
  static const etherealLavender     = Color(0xFFC9A0F0);
  static const ghostText            = Color(0xFFA0A0B8);
}
```

### Typography
```dart
// Uses Google Fonts: 'Noto Serif' & 'Inter'

// Headline XL — Noto Serif, 40px, w400, lh1.2, ls-0.02em
// Headline MD — Noto Serif, 24px, w400, lh1.4
// Body LG     — Inter, 18px, w300, lh1.6
// Body MD     — Inter, 16px, w400, lh1.5
// Label SM    — Inter, 12px, w500, lh1.0, ls0.05em
```

### Border Radius
```dart
class AppRadius {
  static const sm      = Radius.circular(8);
  static const md      = Radius.circular(24);
  static const lg      = Radius.circular(32);
  static const xl      = Radius.circular(48);
  static const full    = Radius.circular(9999);
}
```

### Spacing
```dart
class AppSpacing {
  static const unit             = 8.0;
  static const stackGap         = 16.0;
  static const containerPadding = 24.0;
  static const sectionGap       = 40.0;
}
```
