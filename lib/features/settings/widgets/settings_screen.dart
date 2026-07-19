import 'package:flutter/material.dart';
import 'setting.dart';
import '../../storage/hive_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Setting(settingName: "Setting 1"),
        const SizedBox(height: 24),
        // Destructive action: coloured with the theme's error role so it reads
        // as dangerous rather than looking like an ordinary button.
        FilledButton.tonalIcon(
          onPressed: () {
            HiveFunctions.taskBox.clear();
          },
          icon: const Icon(Icons.delete_outline),
          label: const Text('Delete all tasks'),
          style: FilledButton.styleFrom(
            backgroundColor: scheme.errorContainer,
            foregroundColor: scheme.onErrorContainer,
            minimumSize: const Size.fromHeight(48),
          ),
        ),
      ],
    );
  }
}
