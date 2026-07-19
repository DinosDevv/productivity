import 'package:flutter/material.dart';
import 'package:productivity/features/timer/controllers/task_timer.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import '../../../shared/functions/helpers.dart';

class PlanTimer extends StatelessWidget {
  const PlanTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return ListenableBuilder(
      listenable: TimerController.instance,
      builder: (context, child) {
        return CircularPercentIndicator(
          percent: TimerController.instance.getPercentage(),
          radius: 110,
          lineWidth: 12,
          progressColor: scheme.primary,
          backgroundColor: scheme.surfaceContainerHighest,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            Helpers.formatTime(TimerController.instance.remainingSeconds),
            style: theme.textTheme.displaySmall?.copyWith(
              color: scheme.onSurface,
              fontWeight: FontWeight.w600,
              // Tabular figures keep every digit the same width, so the timer
              // text doesn't jitter left/right as the numbers tick down.
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        );
      },
    );
  }
}
