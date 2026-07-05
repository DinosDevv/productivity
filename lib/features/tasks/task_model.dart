import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{

  // Initializing the TaskModel to be used by Hive

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String taskName;
  @HiveField(2)
  final int startTime;
  @HiveField(3)
  final int endTime;
  @HiveField(4)
  bool isDone;

  TaskModel({
    required this.id,
    required this.taskName,
    required this.startTime,
    required this.endTime,
    this.isDone = false,
  });
}
