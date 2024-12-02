import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/data/firebase_auth_repo.dart';
import 'package:flutter_auth_demo/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_auth_demo/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter_auth_demo/features/home/presentation/pages/home_page.dart';
import 'package:flutter_auth_demo/features/profile/data/firebase_profile_repo.dart';
import 'package:flutter_auth_demo/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:flutter_auth_demo/features/storage/data/firebase_storage_repo.dart';
import 'package:flutter_auth_demo/shared/constants.dart';
import 'package:flutter_auth_demo/shared/theme.dart';
import 'package:flutter_auth_demo/shared/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/cubits/auth_state.dart';

// root level widget
class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();
  final profileRepo = FirebaseProfileRepo();
  final storageRepo = FirebaseStorageRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Lato", "Nunito");
    MaterialTheme theme = MaterialTheme(textTheme);
    ThemeData appTheme =
        brightness == Brightness.light ? theme.light() : theme.dark();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        ),
        BlocProvider<ProfileCubit>(
          create:
              (context) => ProfileCubit(
                profileRepo: profileRepo,
                storageRepo: storageRepo,
              ),
        ),
      ],
      child: MaterialApp(
        title: Constants.appName,
        theme: appTheme,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            debugPrint("authState: $authState");
            if (authState is Authenticated) {
              // show home page
              return HomePage();
            } else if (authState is Unauthenticated) {
              // show auth page
              return AuthPage();
            } else {
              // show loading
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          },
          listener: (context, authState) {
            if (authState is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(authState.message),
                  backgroundColor: appTheme.colorScheme.error,
                ),
              );
            }
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
