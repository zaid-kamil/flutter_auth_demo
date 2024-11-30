import 'package:flutter_auth_demo/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
    Future<AppUser?> getCurrentUser();
    Future<AppUser?> signInWithEmailAndPassword(String email, String password);
    Future<AppUser?> signUpWithEmailAndPassword(String email, String password, String name);
    Future<void> signOut();
}
