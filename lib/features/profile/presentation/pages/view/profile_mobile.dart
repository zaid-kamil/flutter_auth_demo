import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/domain/entities/app_user.dart';
import 'package:flutter_auth_demo/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_auth_demo/features/profile/presentation/components/bio_box.dart';
import 'package:flutter_auth_demo/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:flutter_auth_demo/features/profile/presentation/pages/edit/edit_profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileMobile extends StatefulWidget {
  final String uid;

  const ProfileMobile({super.key, required this.uid});

  @override
  State<ProfileMobile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileMobile> {
  // cubits
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  // current user
  late AppUser? currentUser = authCubit.currentUser;

  @override
  void initState() {
    super.initState();
    profileCubit.fetchUserProfile(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        switch (state) {
          case ProfileLoaded():
            final user = state.profileUser;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  user.name.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed:
                        () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfilePage(user: user),
                            ),
                          ),
                        },
                    icon: Icon(Icons.settings),
                  ),
                ],
                foregroundColor: Theme.of(context).colorScheme.secondary,
              ),
              body: Center(
                child: Column(
                  children: [
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 65,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            "bio",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    BioBox(bio: user.bio!),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            "Posts",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          case ProfileLoading():
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case ProfileError():
            return Scaffold(body: Center(child: Text(state.message)));
          default:
            return Scaffold(body: Center(child: Text("Unknown error")));
        }
      },
    );
  }
}
