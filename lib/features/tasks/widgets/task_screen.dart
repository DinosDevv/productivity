import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:productivity/features/timer/controllers/task_timer.dart';
import 'package:productivity/shared/main_screen.dart';
import 'task.dart';
import '../../storage/hive_functions.dart';
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
        valueListenable: Hive.box<TaskModel>('tasks').listenable(), 
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
                        TimerController timerController = TimerController(task: task);
                        timerController.start();
                        
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                              index: 1, 
                              timerController: timerController,
                            )
                          )
                        );
                      } else { 
                        await HiveFunctions.deleteTask(task);
                        if (context.mounted) {
                          (context as Element).markNeedsBuild();
                        }
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