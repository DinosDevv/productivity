import 'package:flutter/material.dart';
import '../../../shared/UI/colors.dart';
import '../task_model.dart';
import '../../../shared/functions/helpers.dart';

class Task extends StatefulWidget {
  final TaskModel task;
  final VoidCallback? onPressed;

  const Task({super.key, required this.task, this.onPressed});


  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  late TaskModel task = widget.task;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container( 
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: taskColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.taskName),
                Text (
                  "${Helpers.toTimeOfTheDay(task.startTime).format(context)} - ${Helpers.toTimeOfTheDay(task.endTime).format(context)}"
                ),
              ],
            ),   
            if(task.isDone) Icon(Icons.check_box_outlined) else Icon(Icons.check_box_outline_blank),
          ],
        ),
      ),
    );
  }
}
