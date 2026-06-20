import 'package:flutter/material.dart';
import '../misc/colors.dart';

class TaskModel {
  final String taskName;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  TaskModel({
    required this.taskName,
    required this.startTime,
    required this.endTime,
  });

}

class Task extends StatelessWidget {
  final TaskModel task;

  const Task({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: taskColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.taskName),
              Text (
                "${task.startTime.format(context)} - ${task.endTime.format(context)}"
              ),
            ],
          ),   
          Icon(Icons.check),
        ],
      ),
      
    );
  }
}