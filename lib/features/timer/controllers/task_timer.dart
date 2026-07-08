import 'dart:async';

import 'package:flutter/material.dart';
import 'package:productivity/features/tasks/task_model.dart';
import '../../storage/hive_functions.dart';

class TimerController extends ChangeNotifier{

  /*
    Need to create getters and setters to be able to access the information of the timerController
    instead of passing it around!! The only time a TimerController object is created/accessed will have to be
    to be "tied" with a task. Other than that, interactions should be possible through getter/setter functions
  */



  TimerController();

  static int remainingSeconds = 0, startingSeconds = 0;
  static TaskModel task = TaskModel(
    id: 1500,
    taskName: "nullTask",
    startTime: 1,
    endTime: 1,
  );
  
  Timer? timer;
  bool isPaused = false;

  static double getPercentage () {
    /* 
      Assuming .start() has been called, remainingSeconds, startingSeconds are probably already set
      so I can probably just calculate the percentage here
    */

    double percentage;

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

    return percentage;
  }

  void setTask(TaskModel t) {
    task = t;
  }

  void getRemainingSeconds() { // This function acts as a setter
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
    
  }

  /*
    Functions that trigger the timer
  */

  void start() {
    getRemainingSeconds(); 

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if(remainingSeconds > 0 && !isPaused) {
          remainingSeconds--;
          notifyListeners(); // Doesn't notify I'm afraid, maybe add listenable TimerController.start()???
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
