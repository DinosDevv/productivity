import 'package:flutter/material.dart';
import 'UI/theme.dart';
import 'main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Main extends ConsumerWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Productivity',
      theme: AppTheme.dark,
      home: MainScreen(index: 0),
      debugShowCheckedModeBanner: false,
    );
  }
}