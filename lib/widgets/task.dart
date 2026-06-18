import 'package:flutter/material.dart';
import '../misc/colors.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: taskColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text("Task Name"),
          Text("00:00 - 12:00"),
        ],
      ),   
    );
  }
}