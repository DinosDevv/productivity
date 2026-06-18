import 'package:flutter/material.dart';
import '../misc/colors.dart';
import '../widgets/task.dart';
import '../widgets/buttons/skip_btn.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Productivity App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("This is the main Screen"),
          Task(),
          SkipBtn(),
        ],
      ),
    );
  }
}