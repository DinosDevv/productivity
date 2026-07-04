import 'package:flutter/material.dart';

class Helpers {
  static TimeOfDay toTimeOfTheDay(int min) {
    return TimeOfDay(
      hour: min ~/ 60, 
      minute: min % 60,
    );
  }

  static int toMinutes(TimeOfDay tod) {
    return tod.hour * 60 + tod.minute;
  }
}