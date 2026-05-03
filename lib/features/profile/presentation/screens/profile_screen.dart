import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';
import '../../../auth/presentation/providers/auth_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Scaffold(
      backgroundColor: AppColors.theVoid,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.theVoid, AppColors.surfaceContainerLow],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        backgroundImage: user?.profileImageUrl != null
                            ? NetworkImage(user!.profileImageUrl!)
                            : const AssetImage('assets/images/anonymous_avatar.png') as ImageProvider,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Text(user?.nickname ?? 'Anonymous Whisperer', style: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurface)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                children: [
                  _ProfileOption(
                    icon: Icons.logout_rounded,
                    title: 'Depart the Void',
                    subtitle: 'Sign out of your account',
                    onTap: () => ref.read(authProvider.notifier).logout(),
                    isDestructive: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ProfileOption({required this.icon, required this.title, required this.subtitle, required this.onTap, this.isDestructive = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: isDestructive ? AppColors.error : AppColors.primary),
      title: Text(title, style: AppTextStyles.bodyLg.copyWith(color: isDestructive ? AppColors.error : AppColors.onSurface)),
      subtitle: Text(subtitle, style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurface.withValues(alpha: 0.6))),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.brMd),
      tileColor: AppColors.surfaceContainerLow,
    );
  }
}
