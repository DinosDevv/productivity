import 'package:flutter/material.dart';
import 'package:productivity/features/timer/controllers/timer_controller.dart';
import 'circular_timer.dart';
import '../../../shared/functions/helpers.dart';

class PlanTimer extends StatelessWidget {
  const PlanTimer({super.key});
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: TimerController.instance,
    builder: (context, _) => CircularTimer(
      percent: TimerController.instance.getPercentage(),
      label: Helpers.formatTime(TimerController.instance.remainingSeconds),
      color: Theme.of(context).colorScheme.primary,   // calm purple
    ),
  );
}