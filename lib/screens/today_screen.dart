import 'package:flutter/material.dart';
import 'package:productivity/widgets/plan_timer.dart';
import 'package:timer_widget/timer_widget.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TimerWidgetController.start('countdown');
    return Scaffold(
      body: Center(
        child: PlanTimer(minutes: 50),
      ),
    );
  }
}