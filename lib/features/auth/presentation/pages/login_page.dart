import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/components/AppTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 4),
                Text(
                  "L O G I N",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                  icon: Icons.lock,
                  label: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  obscure: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    print("Email: ${emailController.text}");
                    print("Password: ${passwordController.text}");
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text("Login"),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
