import 'package:hive_flutter/hive_flutter.dart';
import '../tasks/task_model.dart';

class HiveFunctions {
  static Box<TaskModel> get taskBox =>
    Hive.box<TaskModel>('tasks');

  // Adds a TaskModel to the HiveBox
  static void addTask(TaskModel task) {
    
    taskBox.add(task);
    for(int i = 0; i < taskBox.values.toList().length; i++) {
      print(taskBox.values.toList()[i]);
    }
  }
  static int getId() {
    final ids = taskBox.values.map((e) => e.id).toSet();
    int id = 0;

    // Makes sure an original ID is being generated despite previous tasks being completed

    while (ids.contains(id)) {
      id++;
    }

    return id;
  }
  static void updateTask(int id, TaskModel task) {
    taskBox.put(id, task);
  }
  static void deleteTask(int id) {
    taskBox.delete(id);
  }
}
