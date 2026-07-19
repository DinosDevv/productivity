import 'package:flutter/material.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: scheme.error,
      ),
      onPressed: () {
        // Need to navigate to /debt
      },
      icon: const Icon(Icons.skip_next),
      label: const Text('Skip & Add as Debt'),
    );
  }
}
