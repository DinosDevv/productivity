import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class CircularTimer extends StatelessWidget {
  final double percent;
  final String label;
  final Color color;

  const CircularTimer({super.key, required this.percent, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircularPercentIndicator(
      percent: percent,
      radius: 110, lineWidth: 12,
      progressColor: color,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(label, style: theme.textTheme.displaySmall?.copyWith()),
    );
  }
}