import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../providers/auth_notifier.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailCtrl = TextEditingController();
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.isAuthenticated) {
        context.go(AppRoutes.home);
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('A New Dawn', style: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurface)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.onSurface),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Gentle Light Background Image
          Image.asset(
            'assets/images/auth_bg.png',
            fit: BoxFit.cover,
          ),
          
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Begin your journey', 
                            style: AppTextStyles.headlineMd.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w600,
                            ), 
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

                          // Fields Wrapper for Theme override
                          Theme(
                            data: Theme.of(context).copyWith(
                              inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                                fillColor: Colors.black.withValues(alpha: 0.6),
                                labelStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurface.withValues(alpha: 0.6)),
                                hintStyle: AppTextStyles.placeholder.copyWith(color: AppColors.onSurface.withValues(alpha: 0.4)),
                              ),
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _userCtrl,
                                  style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                                  decoration: const InputDecoration(labelText: 'Alias', hintText: 'Ghost'),
                                ),
                                const SizedBox(height: AppSpacing.stackGap),
                                TextField(
                                  controller: _emailCtrl,
                                  style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                                  decoration: const InputDecoration(labelText: 'Email', hintText: 'ghost@void.com'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: AppSpacing.stackGap),
                                TextField(
                                  controller: _passCtrl,
                                  style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                                  decoration: const InputDecoration(labelText: 'Password', hintText: '••••••'),
                                  obscureText: true,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xl),

                          if (authState.isLoading)
                            const Center(child: CircularProgressIndicator(color: AppColors.primaryContainer))
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sectionGap),
                              child: FilledButton(
                                onPressed: () => ref.read(authProvider.notifier).register(_emailCtrl.text, _userCtrl.text, _passCtrl.text),
                                child: const Text('Begin'),
                              ),
                            ),
                            
                          const SizedBox(height: AppSpacing.stackGap),
                          TextButton(
                            onPressed: () => context.pop(),
                            child: Text(
                              'Return to the Void', 
                              style: AppTextStyles.bodyMd.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
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
