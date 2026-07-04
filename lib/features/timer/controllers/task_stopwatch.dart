import 'package:flutter/material.dart';
import 'dart:async';


class StopwatchController extends ChangeNotifier {
  int seconds = 0;
  bool isPaused = false;
  Timer? timer;

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