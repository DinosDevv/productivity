import 'package:flutter/material.dart';
import '../misc/colors.dart';
import '../screens/main_screen.dart';
import '../controllers/timer_controller.dart';
import '../misc/task_model.dart';

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productivity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: appBarColor,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MainScreen(
        index: 0, 
        timerController: TimerController(
          task: TaskModel(
            taskName: '0',
            startTime: 0,
            endTime: 0
          ),
        ),

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}