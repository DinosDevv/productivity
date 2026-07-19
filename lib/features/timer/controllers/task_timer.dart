import 'dart:async';

import 'package:flutter/material.dart';
import 'package:productivity/features/storage/task_repository.dart';
import 'package:productivity/features/tasks/task_model.dart';

class TimerController extends ChangeNotifier{

  TimerController._(); // Makes the TimerController private
  static final TimerController instance = TimerController._(); // Only object, files can access this, not the original

  int remainingSeconds = 0, startingSeconds = 0;
  TaskModel? task;
  
  Timer? timer;
  bool isPaused = false;
  bool isRunning = false; // To Check whether the instance is already running

  double getPercentage () {
    /* 
      Assuming .start() has been called, remainingSeconds, startingSeconds are probably already set
      so I can probably just calculate the percentage here
      Im doing this to does it work? we will find out, I have to type into claude
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
    
    /*
      Basically Checks whether task is null before 'promoting' it
    */

    final t = task; // final here ensures that because t is set to a task, it cannot be changed later and therefore is able to be promoted
    if(t == null) return;
    int taskTime = t.endTime - t.startTime;
    
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

    /*
      Again the same null check
    */

    final t = task;
    if(t == null) return;
    if(isRunning) return;
    isRunning = true;

    getRemainingSeconds(); 

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if(isPaused) return;
        if(remainingSeconds > 0) {
          remainingSeconds--;
          notifyListeners();
        } else {
          t.isDone = true; 
          stop();
          TaskRepository.instance.updateTask(t);
          notifyListeners();
        }    
      } 
    );
  }
  void stop() {
    timer?.cancel();
    isRunning = false;
  }
  
  // Currently doesn't do much, needs a pause button

  void pause() {
    if(isPaused) isPaused = false;
    if(!isPaused) isPaused = true;
  }
}