import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/profile/presentation/pages/view/profile_mobile.dart';
import 'package:flutter_auth_demo/shared/widgets/responsive_layout.dart';

class ProfilePage extends StatelessWidget {
  final String uid;

  const ProfilePage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: ProfileMobile(uid: uid),
      tabletLayout: const Placeholder(),
      desktopLayout: const Placeholder(),
    );
  }
}
