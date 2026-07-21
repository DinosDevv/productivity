import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:productivity/features/storage/task_repository.dart';
import 'package:productivity/features/tasks/task_controller.dart';
import 'package:productivity/shared/main_screen.dart';
import 'task.dart';
import '../task_model.dart';
import 'task_dialog.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<TaskModel>(TaskRepository.boxName).listenable(), // Maybe need to refer to the instance
        builder: (context, box, _) {
          final tasks = box.toMap().values.toList();

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
                    onPressed:  () async {
                      if(!task.isDone) {
                        TaskController taskController = TaskController();
                        taskController.setTask(task);
                        taskController.triggerTime();
                        
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                              index: 1, 
                            )
                          )
                        );
                      } else { 
                        await TaskRepository.instance.deleteTask(task);
                      }
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
          TaskDialog.showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}