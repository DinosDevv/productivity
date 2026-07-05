import 'package:hive_flutter/hive_flutter.dart';
import '../tasks/task_model.dart';

class HiveFunctions {
  static Box<TaskModel> get taskBox =>
    Hive.box<TaskModel>('tasks');

  // Adds a TaskModel to the HiveBox
  static void addTask(TaskModel task) {
    taskBox.put(task.id, task);
  }
  static int getId() {
    final ids = taskBox.keys.cast<int>().toSet();

    int id = 0;
    while (ids.contains(id)) {
      id++;
    }

    return id;
  }
  static void updateTask(TaskModel task) {
    taskBox.put(task.id, task);
  }
  static Future <void> deleteTask(TaskModel task) async {
    print(task.isDone);
    print(task.id);
    printBox(taskBox);
    await taskBox.delete(task.id);
    printBox(taskBox);
  }
  static void printBox(Box box) {
    print("Box content is: ");
    for(int i = 0; i < box.values.toList().length; i++) {
      print(box.values.toList()[i]);
    }
  }
}
