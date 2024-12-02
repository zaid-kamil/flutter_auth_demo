import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/profile/domain/entities/profile_user.dart';
import 'package:flutter_auth_demo/shared/widgets/responsive_layout.dart';

import 'edit_profile_mobile.dart';

class EditProfilePage extends StatelessWidget {
  final ProfileUser user;

  const EditProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: EditProfileMobile(user: user),
      tabletLayout: const Placeholder(),
      desktopLayout: const Placeholder(),
    );
  }
}
