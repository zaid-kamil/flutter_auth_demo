import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth_demo/constants.dart';
import 'package:flutter_auth_demo/features/profile/domain/entities/profile_user.dart';
import 'package:flutter_auth_demo/features/profile/domain/repos/profile_repo.dart';

class FirebaseProfileRepo implements ProfileRepo {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<ProfileUser?> fetchUserProfile(String uid) async {
    try {
      final userDoc =
          await firebaseFirestore
              .collection(Constants.collectionUser)
              .doc(uid)
              .get();
      if (!userDoc.exists) {
        return null;
      }
      final profileUser = ProfileUser.fromJson(userDoc.data()!);
      return profileUser;
    } catch (e) {
      throw Exception("Failed to fetch user profile: $e");
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updatedProfile) async {
    try {
      await firebaseFirestore
          .collection(Constants.collectionUser)
          .doc(updatedProfile.uid)
          .update({'bio': updatedProfile.bio});
    } catch (e) {
      throw Exception("Failed to update profile: $e");
    }
  }
}
