import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/home/presentation/components/app_drawer.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: AppDrawer(),
      body: const Center(
        child: Text("Home Mobile"),
      ),
    );
  }
}
