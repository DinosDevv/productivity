import 'package:flutter/material.dart';
import 'UI/colors.dart';
import 'main_screen.dart';

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
      home: MainScreen(index: 0),
      debugShowCheckedModeBanner: false,
    );
  }
}