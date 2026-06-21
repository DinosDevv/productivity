import 'package:flutter/material.dart';
import '../misc/colors.dart';
import '../widgets/task.dart';
import '../misc/hive_functions.dart';
import '../misc/task_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List tasks = HiveFunctions.getTasks();

  void addTask(TaskModel task) {
    setState(() {
      HiveFunctions.addTask(HiveFunctions.taskToMap(task));
    });
  }
  void showAddTaskDialog() async {
    final titleController = TextEditingController();
    TimeOfDay? start;
    TimeOfDay? end;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController),

            TextButton(
              onPressed: () async {
                start = await showTimePicker(
                  context: context, 
                  initialTime: TimeOfDay.now(),
                );
              }, 
              child: const Text("Pick Start time"),
            ),
            TextButton(
              onPressed: () async {
                end = await showTimePicker(
                  context: context, 
                  initialTime: TimeOfDay.now(),
                );
              }, 
              child: const Text("Pick End time"),
            ),

          ],
        ), 
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), 
            child: const Text("Cancel")
          ),
          TextButton(
            onPressed : () {
              if(start != null && end != null) {
                TaskModel newTask = TaskModel(taskName: titleController.text, startTime: start!, endTime: end!);
                addTask(newTask);
              }
              Navigator.pop(context);
            },
            child: const Text("Add"),  
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Productivity App"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Task(task: TaskModel(taskName: "Test Task", startTime: TimeOfDay(hour: 1, minute: 0), endTime: TimeOfDay(hour: 2, minute: 0)),),
          SizedBox(height: 12),
          for (var task in tasks) ...[
            Task(task: HiveFunctions.mapToTask(task)),
            SizedBox(height: 12),
          ],
        ],      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}