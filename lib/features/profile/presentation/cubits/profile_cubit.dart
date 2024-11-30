import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/profile/domain/entities/profile_user.dart';
import 'package:flutter_auth_demo/features/profile/domain/repos/profile_repo.dart';
import 'package:flutter_auth_demo/features/storage/domain/storage_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  final StorageRepo storageRepo;

  ProfileCubit({required this.profileRepo, required this.storageRepo})
    : super(ProfileInitial());

  // fetch user
  Future<void> fetchUserProfile(String uid) async {
    emit(ProfileLoading());
    try {
      final user = await profileRepo.fetchUserProfile(uid);
      if (user != null) {
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError("User not found"));
      }
    } catch (e) {
      emit(ProfileError("Failed to fetch user: $e"));
    }
  }

  // update profile
  Future<void> updateProfile({
    required String uid,
    String? newBio,
    String? imageMobilePath,
    Uint8List? imageWebBytes,
  }) async {
    emit(ProfileLoading());
    try {
      final currentUser = await profileRepo.fetchUserProfile(uid);
      if (currentUser == null) {
        emit(ProfileError("Failed to update profile: User not found"));
        return;
      }

      // upload image
      String? newProfileImageUrl;
      if (imageMobilePath != null || imageWebBytes != null) {
        if (imageMobilePath != null) {
          newProfileImageUrl = await storageRepo.uploadProfileImageMobile(
            imageMobilePath,
            "$uid.jpg",
          );
        } else if (imageWebBytes != null) {
          newProfileImageUrl = await storageRepo.uploadProfileImageWeb(
            imageWebBytes,
            "$uid.jpg",
          );
        }
      }
      if (newProfileImageUrl == null) {
        emit(ProfileError("Failed to update profile: Image upload failed"));
        return;
      }

      final updateProfile = currentUser.copyWith(
        newBio: newBio ?? currentUser.bio,
        newProfileImageUrl: newProfileImageUrl ?? currentUser.profileImageUrl,
      );
      await profileRepo.updateProfile(updateProfile);
      await fetchUserProfile(uid);
    } catch (e) {
      emit(ProfileError("Failed to update profile: $e"));
    }
  }
}
