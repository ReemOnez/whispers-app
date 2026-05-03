import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingRepository {
  bool hasSeenOnboarding();
  Future<void> setOnboardingSeen();
}

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPreferences _prefs;
  static const String _key = 'has_seen_onboarding';

  OnboardingRepositoryImpl(this._prefs);

  @override
  bool hasSeenOnboarding() {
    return _prefs.getBool(_key) ?? false;
  }

  @override
  Future<void> setOnboardingSeen() async {
    await _prefs.setBool(_key, true);
  }
}
