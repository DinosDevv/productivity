import 'package:hive_flutter/hive_flutter.dart';
import '../misc/task_model.dart';


class HiveFunctions {
  static Box<TaskModel> get taskBox =>
    Hive.box<TaskModel>('tasks');

  static void addTask(TaskModel task) {
    taskBox.add(task);
  }
}
