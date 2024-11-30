import 'package:flutter/material.dart';

class AppDrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onTap;

  const AppDrawerTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }
}
