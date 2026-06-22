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
    return Text(
      '${seconds ~/ 3600}:${seconds ~/ 60}:${seconds%60}',
      style: TextStyle(
        fontSize: 50,
      ),
      
    );
  }
}