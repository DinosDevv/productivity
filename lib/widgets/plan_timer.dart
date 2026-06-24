import 'dart:async';

import 'package:flutter/material.dart';


class PlanTimer extends StatefulWidget {
  final int minutes;

  const PlanTimer({
    super.key,
    required this.minutes,
  });
  

  @override
  State<PlanTimer> createState() => _PlanTimerState();
}

class _PlanTimerState extends State<PlanTimer> {
  late int timerSeconds = widget.minutes*60;
  Timer? timer;


  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        setState(() {
          timerSeconds--;
        });
      },
    );
  }

  @override
  void dispose() { 
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int hours, minutes, seconds;

    hours = timerSeconds ~/ 3600;
    minutes = (timerSeconds % 3600) ~/ 60;
    seconds = timerSeconds % 60;

    String hoursTxt = hours.toString(), minutesTxt = minutes.toString(), secondsTxt = seconds.toString();
    
    // Make the text on the timer so that it shows properly 00:00:00 instead of 1:1:1 if hours/minutes/seconds < 9

    if(minutes < 9) {
      minutesTxt = '0$minutes';
    }
    if(hours < 9) {
      hoursTxt = '0$hours';
    }
    if(seconds < 9) {
      secondsTxt = '0$seconds';
    }    

    return Text(
      '$hoursTxt:$minutesTxt:$secondsTxt',
      style: TextStyle(
        fontSize: 50,
      ),
    );    
  }
}