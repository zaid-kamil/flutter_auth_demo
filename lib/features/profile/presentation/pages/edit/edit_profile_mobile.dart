import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/presentation/components/app_text_field.dart';
import 'package:flutter_auth_demo/features/profile/domain/entities/profile_user.dart';
import 'package:flutter_auth_demo/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileMobile extends StatefulWidget {
  final ProfileUser user;

  const EditProfileMobile({super.key, required this.user});

  @override
  State<EditProfileMobile> createState() => _EditProfileMobileState();
}

class _EditProfileMobileState extends State<EditProfileMobile> {
  final bioController = TextEditingController();

  // mobile picked Image
  PlatformFile? mobilePickedFile;

  // web picked Image
  Uint8List? webPickedFile;

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: kIsWeb,
    );
  }

  void updateProfile() async {
    final profileCubit = context.read<ProfileCubit>();
    if (bioController.text.isNotEmpty) {
      profileCubit.updateProfile(
        uid: widget.user.uid,
        newBio: bioController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        // profile loading
        if (state case ProfileLoading()) {
          return Scaffold(
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading Profile...'),
                ],
              ),
            ),
          );
        } else if (state case ProfileError()) {
          return const Center(child: Text('Error loading profile'));
        } else if (state case ProfileLoaded()) {
          bioController.text = state.profileUser.bio!;
        }

        return buildEditPage();
      },
      listener: (context, state) {
        if (state is ProfileLoaded) {
          Navigator.pop(context);
        }
      },
    );
  }

  Widget buildEditPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: updateProfile,
            icon: Icon(Icons.check_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppTextField(
              label: "Your Bio",
              controller: bioController,
              keyboardType: TextInputType.multiline,
              icon: Icons.abc_sharp,
              obscure: false,
            ),
          ],
        ),
      ),
    );
  }
}
