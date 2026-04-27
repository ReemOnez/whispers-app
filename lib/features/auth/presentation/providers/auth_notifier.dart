import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/auth_user.dart';
import '../../../../core/constants/app_constants.dart';

class AuthState {
  const AuthState({this.user, this.isLoading = false, this.error});
  final AuthUser? user;
  final bool isLoading;
  final String? error;
  
  bool get isAuthenticated => user != null;

  AuthState copyWith({AuthUser? user, bool? isLoading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    await Future.delayed(const Duration(seconds: 2)); // Mock delay
    
    if (email.isNotEmpty && password.length >= 6) {
      state = AuthState(
        user: const AuthUser(
          id: AppConstants.dummyUserId,
          email: AppConstants.dummyEmail,
          username: AppConstants.dummyUsername,
        ),
      );
    } else {
      state = state.copyWith(isLoading: false, error: 'Invalid credentials. Use any email and a 6+ char password.');
    }
  }

  Future<void> register(String email, String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    await Future.delayed(const Duration(seconds: 2)); // Mock delay
    
    if (email.isNotEmpty && username.isNotEmpty && password.length >= 6) {
      state = AuthState(
        user: AuthUser(
          id: AppConstants.dummyUserId,
          email: email,
          username: username,
        ),
      );
    } else {
      state = state.copyWith(isLoading: false, error: 'All fields required. Password 6+ chars.');
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 1));
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
