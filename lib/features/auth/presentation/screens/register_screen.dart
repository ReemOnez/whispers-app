import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../providers/auth_notifier.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nicknameCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _visibleText = ValueNotifier(false);
  File? _selectedImage;

  @override
  void dispose() {
    _nicknameCtrl.dispose();
    _passCtrl.dispose();
    _visibleText.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _handleRegister() {
    final nickname = _nicknameCtrl.text.trim();
    final password = _passCtrl.text.trim();

    if (nickname.length < 3 || nickname.length > 15) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nickname must be 3-15 characters')));
      return;
    }

    if (password.length < 6 || password.length > 20) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password must be 6-20 characters')));
      return;
    }

    ref.read(authProvider.notifier).register(nickname, password, _selectedImage);
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
                            'Begin your journey',
                            style: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.lg),

                          // Handle error message
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
                                // Image Picker Section
                                Center(
                                  child: GestureDetector(
                                    onTap: _pickImage,
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                                          backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                                          child: _selectedImage == null
                                              ? const Icon(Icons.add_a_photo_outlined, color: AppColors.primary, size: 30)
                                              : null,
                                        ),
                                        if (_selectedImage != null)
                                          Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                                              child: const Icon(Icons.edit, size: 12, color: Colors.white),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.lg),
                                TextField(
                                  controller: _nicknameCtrl,
                                  style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurface),
                                  decoration: const InputDecoration(labelText: 'Nickname', hintText: 'Ghost', counterText: '3-15 characters'),
                                  maxLength: 15,
                                ),
                                const SizedBox(height: AppSpacing.stackGap),
                                TextField(
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
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xl),

                          if (authState.isLoading)
                            const Center(child: CircularProgressIndicator(color: AppColors.primaryContainer))
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sectionGap),
                              child: FilledButton(onPressed: _handleRegister, child: const Text('Begin')),
                            ),

                          const SizedBox(height: AppSpacing.stackGap),
                          TextButton(
                            onPressed: () => context.pop(),
                            child: Text(
                              'Return to the Void',
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
