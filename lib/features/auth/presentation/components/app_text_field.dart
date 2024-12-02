import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/shared/constants.dart';

class AppTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
  }

  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscure;
  final IconData icon;
  final String hint;

  const AppTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.keyboardType,
    required this.controller,
    required this.obscure,
    this.hint = '',
  });
}
