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

  /*
    This is not really a deep method but kind of clears confusion (probably makes the code more complex
    than it needs to be)
  */

  static String formatTime(int s) {
    String hours = (s ~/ 3600).toString().padLeft(2, '0');
    String minutes = ((s % 3600) ~/ 60).toString().padLeft(2, '0');
    String seconds = (s % 60).toString().padLeft(2, '0');


    return '$hours:$minutes:$seconds';
  }

}