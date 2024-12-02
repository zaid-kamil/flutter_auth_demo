import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/shared/constants.dart';

class AppButton extends StatelessWidget {
  // callback
  final void Function()? onSubmit;
  final String text;

  const AppButton({super.key, required this.text, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, Constants.minButtonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: Constants.buttonTextSize,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
