import 'package:flutter/material.dart';
import '../widgets/setting.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Setting(settingName: "Setting 1"),
          ],
        ),
      ],
    );
  }
}