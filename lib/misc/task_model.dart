import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{

  @HiveField(0)
  final String taskName;
  @HiveField(1)
  final int startTime;
  @HiveField(2)
  final int endTime;
  @HiveField(3)
  final bool isDone;

  TaskModel({
    required this.taskName,
    required this.startTime,
    required this.endTime,
    this.isDone = false,
  });

}
