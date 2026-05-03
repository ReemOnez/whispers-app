import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../../../main.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return OnboardingRepositoryImpl(prefs);
});

class OnboardingNotifier extends StateNotifier<bool> {
  final OnboardingRepository _repository;

  OnboardingNotifier(this._repository) : super(_repository.hasSeenOnboarding());

  Future<void> completeOnboarding() async {
    await _repository.setOnboardingSeen();
    state = true;
  }
}

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, bool>((ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return OnboardingNotifier(repository);
});
