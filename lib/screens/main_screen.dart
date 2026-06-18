import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productivity App"),
      ),
      body: Center(
        child:
          Column(
            children: [
              Text("This is the main Screen"),
            ],
          ),
      ),
    );
  }
}