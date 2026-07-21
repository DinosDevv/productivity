import 'package:flutter/material.dart';
import 'package:productivity/features/debt/debt_controller.dart';
import '../../timer/widgets/debt_timer.dart';

class DebtScreen extends StatelessWidget {
  const DebtScreen({super.key});

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
              DebtTimer(),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  DebtController.instance.triggerTime();
                }, 
                child: Text('Start Timer')
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}