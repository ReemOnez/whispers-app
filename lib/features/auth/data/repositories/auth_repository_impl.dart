import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  AuthRepositoryImpl({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance;

  String _nicknameToEmail(String nickname) => '${nickname.toLowerCase()}@whispers.app';

  @override
  Stream<AuthUser?> get authStateChanges {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      return await _getUserFromFirestore(user.uid);
    });
  }

  @override
  Future<AuthUser?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) return null;
    return await _getUserFromFirestore(user.uid);
  }

  Future<AuthUser?> _getUserFromFirestore(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return AuthUser.fromMap(doc.data()!, uid);
    }
    return null;
  }

  @override
  Future<AuthUser?> login({
    required String nickname,
    required String password,
  }) async {
    try {
      final email = _nicknameToEmail(nickname);
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await _getUserFromFirestore(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  @override
  Future<AuthUser?> register({
    required String nickname,
    required String password,
    File? profileImage,
  }) async {
    try {
      // 1. Check if nickname exists in Firestore (since Auth doesn't know about nicknames)
      final nicknameQuery = await _firestore
          .collection('users')
          .where('nickname', isEqualTo: nickname)
          .get();

      if (nicknameQuery.docs.isNotEmpty) {
        throw 'Nickname already taken';
      }

      // 2. Create Auth User
      final email = _nicknameToEmail(nickname);
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;
      String? imageUrl;

      // 3. Upload Image if provided
      if (profileImage != null) {
        final ref = _storage.ref().child('profile_images').child('$uid.jpg');
        await ref.putFile(profileImage);
        imageUrl = await ref.getDownloadURL();
      }

      // 4. Create Firestore Document
      final authUser = AuthUser(
        id: uid,
        nickname: nickname,
        profileImageUrl: imageUrl,
      );

      await _firestore.collection('users').doc(uid).set(authUser.toMap());

      return authUser;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this nickname.';
      case 'wrong-password':
        return 'Wrong password.';
      case 'email-already-in-use':
        return 'Nickname already exists.';
      case 'invalid-email':
        return 'Invalid nickname format.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return e.message ?? 'Authentication failed.';
    }
  }
}
