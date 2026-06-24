import 'package:flutter/material.dart';
import 'package:productivity/controllers/timer_controller.dart';


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
        return Text(
          // Motherfucker this is the most unreadable line in the whole world!!!!!11!
          '${(widget.timerController.remainingSeconds ~/ 3600).toString().padLeft(2, '0')}:${((widget.timerController.remainingSeconds % 3600) ~/ 60).toString().padLeft(2, '0')}:${(widget.timerController.remainingSeconds % 60).toString().padLeft(2, '0')}',
          style: TextStyle(
            fontSize: 50,
          )
        );
      }
    );    
  }
}