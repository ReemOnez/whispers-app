import '../entities/auth_user.dart';
import 'dart:io';

abstract class AuthRepository {
  Stream<AuthUser?> get authStateChanges;
  
  Future<AuthUser?> login({
    required String nickname,
    required String password,
  });

  Future<AuthUser?> register({
    required String nickname,
    required String password,
    File? profileImage,
  });

  Future<void> logout();
  
  Future<AuthUser?> getCurrentUser();
}
