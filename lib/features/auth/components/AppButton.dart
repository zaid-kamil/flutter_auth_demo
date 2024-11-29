import 'package:flutter/material.dart';

class Appbutton extends StatelessWidget {
  // callback
  final void Function()? onSubmit;
  final String text;

  const Appbutton({super.key, required this.text, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
