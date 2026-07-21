import 'package:flutter/material.dart';
import 'package:productivity/features/timer/controllers/timer_controller.dart';
import '../../debt/debt_controller.dart';
import 'circular_timer.dart';
import '../../../shared/functions/helpers.dart';

class DebtTimer extends StatelessWidget {
  const DebtTimer({super.key});
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: DebtController.instance,                 // its own data source
    builder: (context, _) => CircularTimer(
      percent: TimerController.instance.getPercentage(),
      label: Helpers.formatTime(TimerController.instance.remainingSeconds),
      color: Theme.of(context).colorScheme.error,     // red = "serious"
    ),
  );
}