import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Glowing Image Graphic
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.innerSanctum,
              boxShadow: [
                BoxShadow(
                  color: AppColors.etherealLavender.withValues(alpha: 0.3),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 48),
          
          // Text Content
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.headlineMd.copyWith(
              fontSize: 22,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.stackGap),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMd.copyWith(
              color: AppColors.ghostText,
            ),
          ),
        ],
      ),
    );
  }
}
