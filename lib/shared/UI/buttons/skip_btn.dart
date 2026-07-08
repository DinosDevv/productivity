import 'package:flutter/material.dart';
import 'package:productivity/features/timer/controllers/task_timer.dart';

class SkipBtn extends StatefulWidget {
  const SkipBtn({super.key, required this.tc});

  final TimerController tc;

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
      onPressed: () {
        print("Added debt of ${widget.tc.remainingSeconds}");
      },
      child: Text('Skip & Add as Debt'),
    );
  }
} 