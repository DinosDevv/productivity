import 'dart:async';

import 'package:flutter/material.dart';

class TimerController extends ChangeNotifier{

  TimerController._(); // Makes the TimerController private
  static final TimerController instance = TimerController._(); // Only object, files can access this, not the original

  int remainingSeconds = 0, startingSeconds = 0;
  
  /*
    TaskModel? task;
    Currently, TimerController is tied to a task. This class should be made "dumb" and callback function of it should be controller by another manager/controller.
  */
  
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


  void start({VoidCallback? onDone}) {

    if(isRunning) return;
    isRunning = true;
    remainingSeconds = startingSeconds; 
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if(isPaused) return;
      if(remainingSeconds > 0) { remainingSeconds--; notifyListeners(); }
      else { stop(); onDone?.call(); notifyListeners(); }
    });
  }
  void stop() {
    timer?.cancel();
    isRunning = false;
  }
  
  // Currently doesn't do much, needs a pause button

  void pause() {
    // Pause doesn't work! It needs tweaking.

    if(isPaused) isPaused = false;
    if(!isPaused) isPaused = true;
  }
}