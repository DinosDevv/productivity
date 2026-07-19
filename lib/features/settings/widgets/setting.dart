import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final String _settingName;

  // A private field-formal still exposes `settingName:` (no underscore) to callers.
  const Setting({super.key, required this._settingName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_settingName),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
