import 'package:flutter/material.dart';
import '../../debt/debt_manager.dart';
import 'circular_timer.dart';
import '../../../shared/functions/helpers.dart';

class DebtTimer extends StatelessWidget {
  const DebtTimer({super.key});
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: DebtManager.instance,                 // its own data source
    builder: (context, _) => CircularTimer(
      percent: /* see note below */,
      label: Helpers.formatTime(/* debt seconds */),
      color: Theme.of(context).colorScheme.error,     // red = "serious"
    ),
  );
}