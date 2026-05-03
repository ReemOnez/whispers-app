import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../providers/auth_notifier.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _nicknameCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _visibleText = ValueNotifier(false);

  @override
  void dispose() {
    _nicknameCtrl.dispose();
    _passCtrl.dispose();
    _visibleText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    // Auto-redirect if authenticated
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.isAuthenticated) {
        context.go(AppRoutes.home);
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Enter the Void', style: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurface)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.onSurface),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Gentle Light Background Image
          Image.asset('assets/images/auth_bg.png', fit: BoxFit.cover),

          // Form Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.stackGap),
                child: ClipRRect(
                  borderRadius: AppRadius.brLg,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: AppRadius.brLg,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome back',
                            style: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.lg),

                          if (authState.error != null) ...[
                            Text(
                              authState.error!,
                              style: AppTextStyles.bodyMd.copyWith(color: AppColors.error),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSpacing.stackGap),
                          ],

                          // Email Field
                          Theme(
                            data: Theme.of(context).copyWith(
                              inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                                fillColor: Colors.black.withValues(alpha: 0.6),
                                labelStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurface.withValues(alpha: 0.6)),
                                hintStyle: AppTextStyles.placeholder.copyWith(color: AppColors.onSurface.withValues(alpha: 0.4)),
                              ),
                            ),
                            child: TextField(
                              controller: _nicknameCtrl,
                              style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                              decoration: const InputDecoration(labelText: 'Nickname', hintText: 'Ghost'),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.stackGap),

                          // Password Field
                          Theme(
                            data: Theme.of(context).copyWith(
                              inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                                fillColor: Colors.black.withValues(alpha: 0.6),
                                labelStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurface.withValues(alpha: 0.6)),
                                hintStyle: AppTextStyles.placeholder.copyWith(color: AppColors.onSurface.withValues(alpha: 0.4)),
                              ),
                            ),
                            child: TextField(
                              controller: _passCtrl,
                              style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: '••••••',
                                suffixIcon: IconButton(
                                  icon: Icon(_visibleText.value ? Icons.visibility : Icons.visibility_off, color: AppColors.primary),
                                  onPressed: () {
                                    setState(() {
                                      _visibleText.value = !_visibleText.value;
                                    });
                                  },
                                ),
                              ),
                              obscureText: !_visibleText.value,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xl),

                          if (authState.isLoading)
                            const Center(child: CircularProgressIndicator(color: AppColors.primaryContainer))
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sectionGap),
                              child: FilledButton(
                                onPressed: () => ref.read(authProvider.notifier).login(_nicknameCtrl.text, _passCtrl.text),
                                child: const Text('Unlock'),
                              ),
                            ),
                          SizedBox(height: AppSpacing.stackGap),
                          TextButton(
                            onPressed: () => context.push(AppRoutes.register),
                            child: Text(
                              'Create a new sanctuary',
                              style: AppTextStyles.bodyMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
