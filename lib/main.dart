import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: StopWatch()));

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('00:00:00', style: TextStyle(fontSize: 32)),
            FloatingActionButton(onPressed: () {
              
            }),
          ],
        ),
      ),
    );
  }
}