import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_auth_demo/features/home/presentation/components/app_drawer_tile.dart';
import 'package:flutter_auth_demo/features/profile/presentation/pages/view/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: Column(
          children: [
            SizedBox(height: 35),
            Icon(
              Icons.account_circle,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 35),
            Divider(
              color: Theme.of(context).colorScheme.primaryContainer,
              thickness: 1,
            ),
            AppDrawerTile(
              icon: Icons.home,
              text: "H O M E",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            AppDrawerTile(
              icon: Icons.account_circle,
              text: "P R O F I L E",
              onTap: () {
                // pop drawer
                Navigator.of(context).pop();

                // get id of current user
                final currentUser = context.read<AuthCubit>().currentUser;
                final String? uid = currentUser?.uid;

                // navigate to profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(uid: uid ?? ""),
                  ),
                );
              },
            ),
            AppDrawerTile(
              icon: Icons.search,
              text: "S E A R C H",
              onTap: () {},
            ),
            AppDrawerTile(
              icon: Icons.settings,
              text: "S E T T I N G S",
              onTap: () {},
            ),
            Spacer(),
            Divider(
              color: Theme.of(context).colorScheme.primaryContainer,
              thickness: 1,
            ),
            AppDrawerTile(
              icon: Icons.logout,
              text: "L O G O U T",
              onTap: () {
                context.read<AuthCubit>().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
