import 'package:flutter_auth_demo/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String? bio;
  final String? profileImageUrl;

  ProfileUser({
    required super.uid,
    required super.email,
    required super.name,
    required this.bio,
    required this.profileImageUrl,
  });

  // update user
  ProfileUser copyWith({String? newBio, required String? newProfileImageUrl}) {
    return ProfileUser(
      uid: uid,
      email: email,
      name: name,
      bio: newBio ?? bio,
      profileImageUrl: newProfileImageUrl?? profileImageUrl,
    );
  }

  // convert to JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'email': email,
      'name': name,
      'bio': bio?? '',
      'profileImageUrl': profileImageUrl?? '',
    };
  }

  // convert from JSON
  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      uid: json['id'],
      email: json['email'],
      name: json['name'],
      bio: json['bio'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
    );
  }
}
