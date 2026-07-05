import 'package:flutter/material.dart';
import 'package:productivity/features/timer/controllers/task_timer.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class PlanTimer extends StatefulWidget {
  final TimerController timerController;

  const PlanTimer({
    super.key,
    required this.timerController,
  });
  
  @override
  State<PlanTimer> createState() => _PlanTimerState();
}

class _PlanTimerState extends State<PlanTimer> {

  @override
  Widget build(BuildContext context) {
    

    return ListenableBuilder(
      listenable: widget.timerController,
      builder: (context, child) {
        return CircularPercentIndicator(
          percent: widget.timerController.remainingSeconds / widget.timerController.startingSeconds,
          radius: 100,
          lineWidth: 10,
          progressColor: Colors.blue,
          backgroundColor: Colors.grey.shade300,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(

          // Motherfucker this is the most unreadable line in the whole world!!!!!11!
            '${(widget.timerController.remainingSeconds ~/ 3600).toString().padLeft(2, '0')}:${((widget.timerController.remainingSeconds % 3600) ~/ 60).toString().padLeft(2, '0')}:${(widget.timerController.remainingSeconds % 60).toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 30,
            )
          ),
        );        
      }
    );    
  }
}