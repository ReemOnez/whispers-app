import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Whispers typography scale (Nocturne design system)
/// Fonts: Noto Serif (headings) · Inter (body & labels)
abstract final class AppTextStyles {
  // ── Font families ──
  static final _serif = GoogleFonts.notoSerif();
  static final _sans  = GoogleFonts.inter();

  // ── Text Styles ──
  static final TextStyle headlineXl = _serif.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: -0.02 * 40, // -0.02em
  );

  static final TextStyle headlineMd = _serif.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static final TextStyle bodyLg = _sans.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w300, // Delicate, airy feel
    height: 1.6,
  );

  static final TextStyle bodyMd = _sans.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final TextStyle labelSm = _sans.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0.05 * 12, // 0.05em
  );

  // ── Placeholders / Special ──
  static final TextStyle placeholder = _serif.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.6,
  );
}
