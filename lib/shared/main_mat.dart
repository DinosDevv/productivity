import 'package:flutter/material.dart';
import 'UI/colors.dart';
import 'main_screen.dart';
import '../features/timer/controllers/task_timer.dart';
import '../features/tasks/task_model.dart';
import '../features/storage/hive_functions.dart';

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
            id: 1563242,
            taskName: '0',
            startTime: 0,
            endTime: 10,
          ),
        ),

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}