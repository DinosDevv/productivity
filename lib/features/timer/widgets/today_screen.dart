import 'package:flutter/material.dart';
import 'package:productivity/shared/UI/buttons/skip_btn.dart';
import 'package:productivity/features/timer/widgets/plan_timer.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              PlanTimer(),
              const SizedBox(height: 40),
              SkipBtn(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
