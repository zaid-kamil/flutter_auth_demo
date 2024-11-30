import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/presentation/pages/register/register_mobile.dart';
import 'package:flutter_auth_demo/features/auth/presentation/pages/register/register_web.dart';
import 'package:flutter_auth_demo/responsive_layout.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? togglePage;
  const RegisterPage({super.key, this.togglePage});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: RegisterMobile(
        togglePage: togglePage,
      ),
      tabletLayout: RegisterWeb(
        togglePage: togglePage,
      ),
      desktopLayout: RegisterWeb(
        togglePage: togglePage,
      ),
    );
  }
}
