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
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
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
      appBar: AppBar(title: const Text('Enter the Void')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.containerPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Welcome back', style: AppTextStyles.headlineXl, textAlign: TextAlign.center),
              const SizedBox(height: AppSpacing.xxl),
              
              if (authState.error != null) ...[
                Text(authState.error!, style: AppTextStyles.bodyMd.copyWith(color: AppColors.error), textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.stackGap),
              ],

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
                  onPressed: () => ref.read(authProvider.notifier).login(_emailCtrl.text, _passCtrl.text),
                  child: const Text('Unlock'),
                ),
                
              const SizedBox(height: AppSpacing.stackGap),
              TextButton(
                onPressed: () => context.push(AppRoutes.register),
                child: Text('Create a new sanctuary', style: AppTextStyles.bodyMd.copyWith(color: AppColors.primaryContainer)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
