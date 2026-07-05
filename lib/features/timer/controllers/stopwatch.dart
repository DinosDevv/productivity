import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchController extends ChangeNotifier { 
  int seconds = 0;
  bool isPaused = false;
  Timer? timer;

  // StopwatchController is an object that exists outside the UI and acts as a traditional stopwatch timer

  void start() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if(!isPaused) {
          seconds++;
          notifyListeners();
        }
      } 
    );
  }
}