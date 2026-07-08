import 'package:flutter/material.dart';
import 'package:productivity/shared/UI/buttons/skip_btn.dart';
import 'package:productivity/features/timer/widgets/plan_timer.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlanTimer(),
            SkipBtn(),
          ],
        )
      ),
    );
  }
}

