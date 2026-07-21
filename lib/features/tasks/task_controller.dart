import 'package:productivity/features/storage/task_repository.dart';

import 'task_model.dart';
import '../timer/controllers/timer_controller.dart';

class TaskController {
  TaskModel? task;

  void setTask(TaskModel t) {
    task = t;
  }
  int getTaskDuration() {
    final t = task;
    if(t == null) return 0;

    int taskTime = t.endTime - t.startTime;

    if(taskTime < 0) taskTime += 24 * 60;

    return taskTime;
  }

  void triggerTime() {
    final t = task;
    if(t == null) return;

    TimerController.instance.startingSeconds = getTaskDuration() * 60;
    TimerController.instance.start(onDone: () {
      t.isDone = true;
      TaskRepository.instance.updateTask(t);
    });
  }

}