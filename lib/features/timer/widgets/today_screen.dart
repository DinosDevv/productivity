import 'package:flutter/material.dart';
import 'package:productivity/features/timer/controllers/task_timer.dart';
import 'package:productivity/shared/UI/buttons/skip_btn.dart';
import 'package:productivity/features/timer/widgets/plan_timer.dart';
import 'package:timer_widget/timer_widget.dart';

class TodayScreen extends StatelessWidget {

  final TimerController timerController; 
  const TodayScreen({super.key, required this.timerController});

  @override
  Widget build(BuildContext context) {
    TimerWidgetController.start('countdown');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlanTimer(timerController: timerController),
            SkipBtn(tc: timerController),
          ],
        )
      ),
    );
  }
}