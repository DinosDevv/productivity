import 'package:flutter/material.dart';
import 'package:productivity/features/storage/task_repository.dart';
import 'package:productivity/features/tasks/task_model.dart';
import 'shared/main_mat.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());

  // Initialize all the Hive Boxes

  await Hive.openBox<TaskModel>(TaskRepository.boxName);

  runApp(Main());
}
