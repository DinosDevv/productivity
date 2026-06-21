import 'package:flutter/material.dart';
import '../screens/task_screen.dart';
import '../misc/colors.dart';

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
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}