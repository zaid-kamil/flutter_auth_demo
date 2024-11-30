import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/presentation/components/app_button.dart';
import 'package:flutter_auth_demo/features/auth/presentation/components/app_text_field.dart';
import 'package:flutter_auth_demo/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterMobile extends StatefulWidget {
  final void Function()? togglePage;

  const RegisterMobile({super.key, this.togglePage});

  @override
  State<RegisterMobile> createState() => _RegisterMobile();
}

class _RegisterMobile extends State<RegisterMobile> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cnfPasswordController = TextEditingController();

  void register() {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final cnfPassword = cnfPasswordController.text;
    if (!email.contains("@") || !email.contains(".")) {
      showErrorSnackbar("Invalid email address");
    } else if (name.isEmpty) {
      showErrorSnackbar("Name cannot be empty");
    } else if (password.length < 6) {
      showErrorSnackbar("Password must be at least 6 characters long");
    } else if (password != cnfPassword) {
      showErrorSnackbar("Passwords do not match");
    } else {
      // Register user
      final authCubit = context.read<AuthCubit>();
      authCubit.register(name, email, password);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    cnfPasswordController.dispose();
    super.dispose();
  }

  void showErrorSnackbar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "S I G N   U P",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      icon: Icons.email,
                      label: "Email",
                      keyboardType: TextInputType.emailAddress,
                      obscure: false,
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      icon: Icons.person,
                      label: "Name",
                      keyboardType: TextInputType.text,
                      obscure: false,
                      controller: nameController,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      icon: Icons.lock,
                      label: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscure: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      icon: Icons.lock,
                      label: "Confirm Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscure: true,
                      controller: cnfPasswordController,
                    ),
                    const SizedBox(height: 16),
                    AppButton(text: "Register", onSubmit: register),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.togglePage,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
