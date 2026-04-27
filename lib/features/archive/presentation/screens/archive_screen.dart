import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';

class ArchiveScreen extends ConsumerWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For a real app we'd filter by an `isArchived` flag.
    // Here we'll just show a placeholder since the mock delete removes them entirely.
    
    return Scaffold(
      appBar: AppBar(title: const Text('Archive')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.archive, size: 64, color: AppColors.surfaceBright),
            const SizedBox(height: AppSpacing.lg),
            Text('Dust gathers here.', style: AppTextStyles.bodyLg.copyWith(color: AppColors.ghostText)),
          ],
        ),
      ),
    );
  }
}
