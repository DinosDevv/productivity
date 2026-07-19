import 'package:flutter/material.dart';
import 'package:productivity/features/storage/task_repository.dart';
import '../../../shared/functions/helpers.dart';
import '../../storage/hive_functions.dart';
import '../task_model.dart';


class TaskDialog extends StatelessWidget {
  const TaskDialog({super.key});

    static void showAddTaskDialog(BuildContext context) async {
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
              if(start != null && end != null) return;
              if(titleController.text == "") return;
              if((Helpers.toMinutes(start!) - Helpers.toMinutes(end!)) == 0) return;

              final newTask = TaskModel(
                id: HiveFunctions.getId(),
                taskName: titleController.text, 
                startTime: Helpers.toMinutes(start!), 
                endTime:Helpers.toMinutes(end!)
              );
              TaskRepository.instance.saveTask(newTask);
              
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
    return const Placeholder();
  }
}