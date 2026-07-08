import 'dart:async';

import 'package:flutter/material.dart';
import 'package:productivity/features/tasks/task_model.dart';
import '../../storage/hive_functions.dart';

class TimerController extends ChangeNotifier{
  TaskModel task;

  TimerController({required this.task});

  int remainingSeconds = 0, startingSeconds = 0;
  
  double percentage = 0;

  Timer? timer;
  bool isPaused = false;


  void getRemainingSeconds() {
    int taskTime = task.endTime - task.startTime;
    

    /* 
      Selecting the start/end time of a task is an absolute value of type: TimeOfDay, so if the user
      were to select a big enough duration for a task, the app would think the duration is negative.
      For this reason a check is done to format the time into the correct amount of seconds.
    */

    if(taskTime < 0) { 
      taskTime += 24 * 60;
    }

    remainingSeconds = taskTime * 60;
    startingSeconds = remainingSeconds;
    
    /*
      Percentage is 0 unless a task is passed onto the controller where the new percentage is calculated
      by remainingSeconds/startingSeconds. This prevents the today_screen from crashing because of the 
      Timer indicator
    */

    if(startingSeconds == 0) {
      percentage = 0;
    } else {
      percentage = remainingSeconds/startingSeconds;
    }
    print(percentage);
  }

  void start() {
    getRemainingSeconds();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if(remainingSeconds > 0 && !isPaused) {
          remainingSeconds--;
          notifyListeners();
        } else {
          task.isDone = true; 
          HiveFunctions.updateTask(task);
        }    
      } 
    );
  }
  void stop() {
    timer?.cancel();
  }
  void pause() {
    if(isPaused) isPaused = false;
    if(!isPaused) isPaused = true;
  }
}
