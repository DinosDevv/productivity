import 'package:flutter/material.dart';
import 'UI/colors.dart';
import 'main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Main extends ConsumerWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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