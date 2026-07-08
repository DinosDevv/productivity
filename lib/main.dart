import 'package:flutter/material.dart';
import 'package:productivity/features/tasks/task_model.dart';
import 'shared/main_mat.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());


  await Hive.openBox<TaskModel>('tasks');

  runApp(
    ProviderScope(
      child: Main(),
    )
  );
}
