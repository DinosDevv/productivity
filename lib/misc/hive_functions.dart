import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/task.dart';
import 'package:flutter/material.dart';

class HiveFunctions {
  static final taskBox = Hive.box('tasks');

  static void addTask(Map task) {
    taskBox.add(task);
  }

  static List getTasks() {
    final data = taskBox.keys.map((key)  {
      final value = taskBox.get(key);
      return {
        "key": key, 
        "taskName": value["taskName"], 
        "startHour": value["startHour"], 
        "startMin": value["startMin"],
        "endHour": value["endHour"],
        "endMin": value["endMin"],
        "isDone": value["isDone"],
      };
    }).toList();
    
    return data.reversed.toList();
  }
  
  static Map taskToMap(TaskModel t) {
    Map m = {
      "taskName": t.taskName, 
      "startHour": t.startTime.hour.toString(), 
      "startMin": t.startTime.minute.toString(),
      "endHour": t.endTime.hour.toString(),
      "endMin": t.endTime.minute.toString(),
      "isDone": t.isDone,
    };
    return m;
  }

  static TaskModel mapToTask(Map m) {
    TaskModel t = TaskModel(
      taskName: m["taskName"], 
      startTime: TimeOfDay(hour:int.parse(m["startHour"]), minute:int.parse(m["startMin"])),
      endTime: TimeOfDay(hour: int.parse(m["endHour"]), minute: int.parse(m["endMin"])),
      isDone: m["isDone"],
    );

    //TimeOfDay _startTime = TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));


    return t;
  }

}
