import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }

  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscure;
  final IconData icon;

  AppTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.keyboardType,
    required this.controller,
    required this.obscure,
  });
}
