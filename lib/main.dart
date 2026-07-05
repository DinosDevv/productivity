import 'package:flutter/material.dart';
import 'package:productivity/features/tasks/task_model.dart';
import 'shared/main_mat.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());


  await Hive.openBox<TaskModel>('tasks');

  runApp(const Main());
}
