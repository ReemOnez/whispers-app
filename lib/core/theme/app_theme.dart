import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_radius.dart';

/// Central theme factory — feeds into MaterialApp.theme
abstract final class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
      ),
      scaffoldBackgroundColor: AppColors.theVoid,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.theVoid,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        titleTextStyle: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurface),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headlineXl,
        headlineMedium: AppTextStyles.headlineMd,
        bodyLarge: AppTextStyles.bodyLg,
        bodyMedium: AppTextStyles.bodyMd,
        labelSmall: AppTextStyles.labelSm,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.etherealLavender,
          foregroundColor: AppColors.onPrimaryContainer,
          textStyle: AppTextStyles.labelSm.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          minimumSize: const Size(double.infinity, 48),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.brFull),
          elevation: 0,
        ).copyWith(
          // Simulate the bloom/glow via shadow color and elevation when active
          shadowColor: WidgetStateProperty.all(AppColors.etherealLavender.withOpacity(0.5)),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return 8;
            return 4;
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryContainer, // Ethereal lavender text
          side: const BorderSide(color: AppColors.primaryContainer, width: 1), // Thin lavender border
          textStyle: AppTextStyles.labelSm.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          minimumSize: const Size(double.infinity, 48),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.brFull),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerLow, // Inner Sanctum feel
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        hintStyle: AppTextStyles.placeholder.copyWith(color: AppColors.ghostText.withOpacity(0.5)),
        labelStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.ghostText),
        border: const UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppRadius.brFull, // Fully pill-shaped minimalist input
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.outlineVariant, width: 1),
          borderRadius: AppRadius.brFull,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryContainer, width: 2), // Illuminates on focus
          borderRadius: AppRadius.brFull,
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 1),
          borderRadius: AppRadius.brFull,
        ),
      ),
      // cardTheme: CardTheme(
      //   color: AppColors.innerSanctum,
      //   elevation: 2,
      //   shadowColor: Colors.black45,
      //   shape: const RoundedRectangleBorder(borderRadius: AppRadius.brLg), // Smooth river stones
      //   margin: EdgeInsets.zero,
      // ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.theVoid,
        selectedItemColor: AppColors.etherealLavender,
        unselectedItemColor: AppColors.outlineVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
