import 'package:flutter/material.dart';
import 'widgets/main_mat.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('tasks');

  runApp(const Main());
}
