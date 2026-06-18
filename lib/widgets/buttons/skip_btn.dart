import 'package:flutter/material.dart';

class SkipBtn extends StatefulWidget {
  const SkipBtn({super.key});

  @override
  State<SkipBtn> createState() => _SkipBtnState();
}

class _SkipBtnState extends State<SkipBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.red),
      ),
      onPressed: () { },
      child: Text('Skip & Add as Debt'),
    );
  }
}