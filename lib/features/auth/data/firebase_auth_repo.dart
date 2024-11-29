import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_demo/features/auth/domain/entities/app_user.dart';
import 'package:flutter_auth_demo/features/auth/domain/repo/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      AppUser appUser = AppUser(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
        photoUrl: userCredential.user!.photoURL!,
      );
      return appUser;
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  @override
  Future<AppUser?> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      AppUser appUser = AppUser(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: name,
        photoUrl: userCredential.user!.photoURL!,
      );
      return appUser;
    } catch (e) {
      throw Exception("Sign up failed: $e");
    }
  }

  @override
  Future<void> signOut() async => await firebaseAuth.signOut();

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;
    if (firebaseUser == null) return null;
    return AppUser(
      id: firebaseUser.uid,
      email: firebaseUser.email!,
      name: firebaseUser.displayName!,
      photoUrl: firebaseUser.photoURL!,
    );
  }
}
