import 'package:flutter/material.dart';

class TaskModel {
  final String taskName;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isDone;

  TaskModel({
    required this.taskName,
    required this.startTime,
    required this.endTime,
    this.isDone = false,
  });

}
