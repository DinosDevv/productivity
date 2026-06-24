import 'dart:async';

import 'package:flutter/material.dart';
import 'package:productivity/misc/task_model.dart';

class TimerController extends ChangeNotifier{
  TaskModel task;

  TimerController({required this.task});

  int remainingSeconds = 0;
  Timer? timer;
  bool isPaused = false;

  void getRemainingSeconds() {
    if((task.endTime - task.startTime) < 0) {
      remainingSeconds = (task.startTime - task.endTime)*60 + 12 * 3600;
    } else {
      remainingSeconds = (task.endTime - task.startTime)*60;
    }
  }


  void start() {
    
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if(remainingSeconds > 0 && !isPaused) {
          print(remainingSeconds);
          remainingSeconds--;
          notifyListeners();
        }
      } 
    );
  }
  void pause() {
    if(isPaused) isPaused = false;
    if(!isPaused) isPaused = true;
  }

}
