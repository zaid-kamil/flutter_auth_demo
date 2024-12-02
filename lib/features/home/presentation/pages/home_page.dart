import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/home/presentation/pages/home_mobile.dart';
import 'package:flutter_auth_demo/shared/widgets/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: HomeMobile(),
      tabletLayout: Placeholder(),
      desktopLayout: Placeholder(),
    );
  }
}
