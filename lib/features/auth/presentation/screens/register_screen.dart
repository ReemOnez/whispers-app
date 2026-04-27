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
      // Serene Morning Sky Background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF86A8E7), // Morning sky blue
              Color(0xFFD1B2FF), // Soft lavender horizon
              AppColors.theVoid, // Fading into Nocturne theme at bottom
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.containerPadding),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.containerPadding),
                decoration: BoxDecoration(
                  color: AppColors.innerSanctum.withOpacity(0.85),
                  borderRadius: AppRadius.brLg,
                  border: Border.all(color: AppColors.etherealLavender.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.theVoid.withOpacity(0.5),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'A New Dawn',
                      style: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurface),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    
                    if (authState.error != null) ...[
                      Text(authState.error!, style: AppTextStyles.bodyMd.copyWith(color: AppColors.error), textAlign: TextAlign.center),
                      const SizedBox(height: AppSpacing.stackGap),
                    ],

                    TextField(
                      controller: _userCtrl,
                      decoration: const InputDecoration(labelText: 'Alias', hintText: 'Ghost'),
                    ),
                    const SizedBox(height: AppSpacing.stackGap),
                    TextField(
                      controller: _emailCtrl,
                      decoration: const InputDecoration(labelText: 'Email', hintText: 'ghost@void.com'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: AppSpacing.stackGap),
                    TextField(
                      controller: _passCtrl,
                      decoration: const InputDecoration(labelText: 'Password', hintText: '••••••'),
                      obscureText: true,
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    if (authState.isLoading)
                      const Center(child: CircularProgressIndicator(color: AppColors.primaryContainer))
                    else
                      FilledButton(
                        onPressed: () => ref.read(authProvider.notifier).register(_emailCtrl.text, _userCtrl.text, _passCtrl.text),
                        child: const Text('Begin'),
                      ),
                      
                    const SizedBox(height: AppSpacing.stackGap),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text('Return to the Void', style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
