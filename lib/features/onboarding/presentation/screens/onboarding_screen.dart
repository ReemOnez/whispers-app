import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    } else {
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.theVoid,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                physics: const BouncingScrollPhysics(),
                children: const [
                  OnboardingPage(
                    title: 'Digital Solitude',
                    subtitle: 'A quiet space for your unspoken words. No noise, no judgments, just you and the night.',
                    imagePath: 'assets/images/moon.png',
                  ),
                  OnboardingPage(
                    title: 'Completely Unseen',
                    subtitle: 'Your thoughts are encrypted and anonymous. Once shared, they live here in safety before dissolving into the digital mist.',
                    imagePath: 'assets/images/mist.png',
                  ),
                  OnboardingPage(
                    title: 'Begin Your Release',
                    subtitle: 'The slate is clean. Your first whisper is waiting to be heard by the wind.',
                    imagePath: 'assets/images/wind.png',
                  ),
                ],
              ),
            ),
            
            // Bottom Controls
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index 
                              ? AppColors.etherealLavender 
                              : AppColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  
                  // Next / Enter Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.etherealLavender,
                        foregroundColor: AppColors.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.brFull,
                        ),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ).copyWith(
                        overlayColor: MaterialStateProperty.all(AppColors.primaryFixed),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            if (_currentPage == 2)
                              BoxShadow(
                                color: AppColors.etherealLavender.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                          ],
                        ),
                        child: Text(
                          _currentPage == 2 ? 'Enter Quietly' : 'Next',
                          style: AppTextStyles.bodyLg.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        
        // Skip Button
        Positioned(
              top: AppSpacing.sm,
              right: AppSpacing.stackGap,
              child: TextButton(
                onPressed: () => context.go(AppRoutes.login),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.ghostText,
                ),
                child: Text(
                  'Skip',
                  style: AppTextStyles.bodyMd.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
