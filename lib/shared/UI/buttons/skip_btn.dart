import 'package:flutter/material.dart';
import '../../../features/timer/controllers/task_timer.dart';
import '../../../features/debt/debt_manager.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: scheme.error,
      ),
      onPressed: () {
        int debtSeconds = TimerController.instance.remainingSeconds;
        if(debtSeconds <= 0) return;

        DebtManager.instance.addDebt(debtSeconds); 

        /*
        
          DON'T FORGET THAT THIS BUTTON SHOULD STOP THE TIMER WHEN ADDING NEW DEBT.

        */
      },
      icon: const Icon(Icons.skip_next),
      label: const Text('Skip & Add as Debt'),
    );
  }
}
