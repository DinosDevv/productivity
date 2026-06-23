import 'package:flutter/material.dart';
import 'package:productivity/widgets/buttons/skip_btn.dart';
import 'package:productivity/widgets/plan_timer.dart';
import 'package:timer_widget/timer_widget.dart';

class TodayScreen extends StatelessWidget {

  final int minutes; 
  const TodayScreen({super.key, required this.minutes});

  @override
  Widget build(BuildContext context) {
    TimerWidgetController.start('countdown');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlanTimer(minutes: minutes),
            SkipBtn(),
          ],
        )
      ),
    );
  }
}