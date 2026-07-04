import 'package:flutter/material.dart';
import 'package:productivity/shared/UI/colors.dart';

class Setting extends StatelessWidget {
  final String _settingName;

  const Setting({super.key, required this._settingName});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: taskColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Text(_settingName),
    );
  }
}