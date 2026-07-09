import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import '../tasks/task_model.dart';

class HiveFunctions {
  static void addToBox<T>(Box<T> b, T item, int i) {
    b.put(i, item); // Obviously the 0 needs to be changed to a correct key/id
  }
  static void updateItem<T>(Box<T> b, T item, int i) {
    b.put(i, item);
  }
  static Future <void> deleteItem<T>(Box<T> b, T item, int i) async {
    await b.delete(i); 
  }
  static void printContent(Box b) {
    log("This is the content of the box $b");
  }

  static Box<TaskModel> get taskBox =>
    Hive.box<TaskModel>('tasks');
  // Adds a TaskModel to the HiveBox

  static int getId() {
    final ids = taskBox.keys.cast<int>().toSet();

    int id = 0;
    while (ids.contains(id)) {
      id++;
    }

    return id;
  }
}
