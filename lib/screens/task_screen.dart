import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:productivity/screens/main_screen.dart';
import '../widgets/task.dart';
import '../misc/hive_functions.dart';
import '../misc/task_model.dart';
import '../misc/helpers.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {


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
                final newTask = TaskModel(
                  taskName: titleController.text, 
                  startTime: Helpers.toMinutes(start!), 
                  endTime:Helpers.toMinutes(end!)
                );
                HiveFunctions.addTask(newTask);
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
      body: ValueListenableBuilder(
        valueListenable: Hive.box<TaskModel>('tasks').listenable(), 
        builder: (context, box, _) {
          final tasks = box.values.toList();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return Column(
                children: [
                  SizedBox(height: 12),
                  Task(
                    task: task, 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            index: 1, 
                            minutes: task.endTime - task.startTime,
                          )
                        )
                      );
                    },
                  ),
                ],
              );
            },
            
          );
        },
        
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