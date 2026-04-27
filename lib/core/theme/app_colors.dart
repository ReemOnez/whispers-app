import 'package:flutter/material.dart';

/// Whispers — Nocturne Design System
/// All tokens extracted from DESIGN.md
abstract final class AppColors {
  // ── Surfaces ──────────────────────────────────────────────────
  static const background              = Color(0xFF12121F);
  static const surface                 = Color(0xFF12121F);
  static const surfaceDim              = Color(0xFF12121F);
  static const surfaceBright           = Color(0xFF383847);
  static const surfaceContainerLowest  = Color(0xFF0D0D1A); // The Void
  static const surfaceContainerLow     = Color(0xFF1A1A28); // Inner Sanctum
  static const surfaceContainer        = Color(0xFF1E1E2C);
  static const surfaceContainerHigh    = Color(0xFF292937);
  static const surfaceContainerHighest = Color(0xFF343342);
  static const surfaceVariant          = Color(0xFF343342);
  static const surfaceTint             = Color(0xFFDDB8FF);
  
  static const onSurface               = Color(0xFFE3E0F4);
  static const onSurfaceVariant        = Color(0xFFCDC3D0); // Ghost Text
  static const inverseSurface          = Color(0xFFE3E0F4);
  static const inverseOnSurface        = Color(0xFF2F2F3D);

  // ── Primary ───────────────────────────────────────────────────
  static const primary                 = Color(0xFFE1BFFF);
  static const onPrimary               = Color(0xFF421E65);
  static const primaryContainer        = Color(0xFFC9A0F0); // Ethereal Lavender
  static const onPrimaryContainer      = Color(0xFF56327A);
  static const inversePrimary          = Color(0xFF724E97);
  static const primaryFixed            = Color(0xFFF0DBFF);
  static const primaryFixedDim         = Color(0xFFDDB8FF);
  static const onPrimaryFixed          = Color(0xFF2B024F);
  static const onPrimaryFixedVariant   = Color(0xFF5A367D);

  // ── Secondary ─────────────────────────────────────────────────
  static const secondary               = Color(0xFFD6BCF4);
  static const onSecondary             = Color(0xFF3B2754);
  static const secondaryContainer      = Color(0xFF523D6C);
  static const onSecondaryContainer    = Color(0xFFC4ABE1);
  static const secondaryFixed          = Color(0xFFEEDCFF);
  static const secondaryFixedDim       = Color(0xFFD6BCF4);
  static const onSecondaryFixed        = Color(0xFF25113E);
  static const onSecondaryFixedVariant = Color(0xFF523D6C);

  // ── Tertiary ──────────────────────────────────────────────────
  static const tertiary                = Color(0xFFDDC1FF);
  static const onTertiary              = Color(0xFF3D235F);
  static const tertiaryContainer       = Color(0xFFC2A4EA);
  static const onTertiaryContainer     = Color(0xFF513774);
  static const tertiaryFixed           = Color(0xFFEDDCFF);
  static const tertiaryFixedDim        = Color(0xFFD8B9FF);
  static const onTertiaryFixed         = Color(0xFF270A49);
  static const onTertiaryFixedVariant  = Color(0xFF543A77);

  // ── Semantic ──────────────────────────────────────────────────
  static const error                   = Color(0xFFFFB4AB);
  static const onError                 = Color(0xFF690005);
  static const errorContainer          = Color(0xFF93000A);
  static const onErrorContainer        = Color(0xFFFFDAD6);

  // ── Borders ───────────────────────────────────────────────────
  static const outline                 = Color(0xFF968E9A);
  static const outlineVariant          = Color(0xFF4B444F);

  // ── Brand Aliases ─────────────────────────────────────────────
  static const theVoid          = surfaceContainerLowest;
  static const innerSanctum     = Color(0xFF1A0533); // Subtle purple inner tint
  static const etherealLavender = primaryContainer;
  static const ghostText        = Color(0xFFA0A0B8); // Muted slate text
}
