/* auth states*/

import 'package:flutter_auth_demo/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

// initial
class AuthInitial extends AuthState {}

// loading
class AuthLoading extends AuthState {}

// authenticated
class Authenticated extends AuthState {
  final AppUser user;
  Authenticated(this.user);
}

// unauthenticated
class Unauthenticated extends AuthState {}

// error
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
