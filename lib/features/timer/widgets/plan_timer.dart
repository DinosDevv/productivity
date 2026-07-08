import 'package:flutter/material.dart';
import 'package:productivity/features/timer/controllers/task_timer.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class PlanTimer extends StatefulWidget {
  const PlanTimer({super.key });
  
  @override
  State<PlanTimer> createState() => _PlanTimerState();
}

class _PlanTimerState extends State<PlanTimer> {

  @override
  Widget build(BuildContext context) {
    
    return ListenableBuilder(
      listenable: TimerController(), // Oh shit
      builder: (context, child) {
        return CircularPercentIndicator(
          percent: TimerController.getPercentage(),
          radius: 100,
          lineWidth: 10,
          progressColor: Colors.blue,
          backgroundColor: Colors.grey.shade300,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(

          // Motherfucker this is the most unreadable line in the whole world!!!!!11!
            '${(TimerController.remainingSeconds ~/ 3600).toString().padLeft(2, '0')}:${((TimerController.remainingSeconds % 3600) ~/ 60).toString().padLeft(2, '0')}:${(TimerController.remainingSeconds % 60).toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 30,
            )
          ),
        );        
      }
    );    
  }
}