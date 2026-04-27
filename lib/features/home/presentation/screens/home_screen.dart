import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../confession/presentation/providers/confessions_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confessions = ref.watch(confessionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanctuary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go(AppRoutes.write),
          )
        ],
      ),
      body: confessions.isEmpty
          ? Center(
              child: Text(
                'The void is empty...\nWrite a thought.',
                style: AppTextStyles.placeholder,
                textAlign: TextAlign.center,
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.containerPadding),
              itemCount: confessions.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sectionGap),
              itemBuilder: (context, index) {
                final confession = confessions[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (confession.mood != null) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.primaryContainer.withOpacity(0.2),
                              borderRadius: AppRadius.brFull,
                            ),
                            child: Text(
                              confession.mood!,
                              style: AppTextStyles.labelSm.copyWith(color: AppColors.etherealLavender),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.stackGap),
                        ],
                        Text(
                          confession.body,
                          style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                        ),
                        const SizedBox(height: AppSpacing.stackGap),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.archive_outlined, color: AppColors.ghostText),
                            onPressed: () => ref.read(confessionsProvider.notifier).archiveConfession(confession.id),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
