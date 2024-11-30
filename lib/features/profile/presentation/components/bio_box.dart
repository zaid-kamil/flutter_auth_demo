import 'package:flutter/material.dart';

class BioBox extends StatelessWidget {
  final String bio;

  const BioBox({super.key, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Text(
        bio.isNotEmpty? bio: 'No bio available',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
