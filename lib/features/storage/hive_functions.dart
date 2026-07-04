import 'package:hive_flutter/hive_flutter.dart';
import '../tasks/task_model.dart';


class HiveFunctions {
  static Box<TaskModel> get taskBox =>
    Hive.box<TaskModel>('tasks');

  static void addTask(TaskModel task) {
    
    taskBox.add(task);
    for(int i = 0; i < taskBox.values.toList().length; i++) {
      print(taskBox.values.toList()[i]);
    }
  }
}
