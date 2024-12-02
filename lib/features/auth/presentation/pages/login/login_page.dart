import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/presentation/pages/login/login_mobile.dart';
import 'package:flutter_auth_demo/features/auth/presentation/pages/login/login_web.dart';
import 'package:flutter_auth_demo/shared/widgets/responsive_layout.dart';

class LoginPage extends StatelessWidget {
  final void Function()? togglePage;

  const LoginPage({super.key, this.togglePage});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: LoginMobile(togglePage: togglePage),
      tabletLayout: LoginWeb(togglePage: togglePage),
      desktopLayout: LoginWeb(togglePage: togglePage),
    );
  }
}
