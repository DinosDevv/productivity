import 'package:flutter/material.dart';
import '../features/settings/widgets/setting.dart';
import '../features/storage/hive_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Setting(settingName: "Setting 1"),
            ElevatedButton(
              onPressed: () {
                HiveFunctions.taskBox.clear();
              }, 
              child: Text('Delete all tasks!'),
            ),
          ],
        ),
      ],
    );
  }
}