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
  late int seconds = widget.minutes*60;
  Timer? timer;


  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        setState(() {
          seconds--;
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
    int _hours, _minutes, _seconds;

    _hours = seconds ~/ 3600;
    _minutes = seconds ~/ 60;
    _seconds = seconds % 60;

    String _hoursTxt = _hours.toString(), _minutesTxt = _minutes.toString(), _secondsTxt = _seconds.toString();
    
    // Make the text on the timer so that it shows properly 00:00:00 instead of 1:1:1 if hours/minutes/seconds < 9

    if(_minutes < 9) {
      _minutesTxt = '0$_minutes';
    }
    if(_hours < 9) {
      _hoursTxt = '0$_hours';
    }
    if(_seconds < 9) {
      _secondsTxt = '0$_seconds';
    }    

    return Text(
      '$_hoursTxt:$_minutesTxt:$_secondsTxt',
      style: TextStyle(
        fontSize: 50,
      ),
    );    
  }
}