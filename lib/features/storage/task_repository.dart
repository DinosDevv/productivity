import '../tasks/task_model.dart';
import 'hive_functions.dart';

/*
  This class shouldn't contain Hive Code, it should only communicate with the HiveFunctions class
  which is responsible for all of the actual Storage Logic. This class exists to ensure clarity for the
  storage of all the tasks before pushing them into the database.
*/

class TaskRepository {
  TaskRepository._(); // Makes it private
  static final TaskRepository instance = TaskRepository._();

  static const boxName = 'tasks';  
  
  List<TaskModel> loadTasks() => HiveFunctions.taskBox.values.toList();

  void updateTaskStorage() {

  }
  void saveTask(TaskModel t) {
    /*
      Adds a task to the HiveBox
    */
    HiveFunctions.addToBox(HiveFunctions.taskBox, t, t.id);
  }
  void updateTask(TaskModel t) {
    /*
      Updates the task in the HiveBox
    */
    HiveFunctions.updateItem(HiveFunctions.taskBox, t, t.id);
  }
  Future <void> deleteTask(TaskModel t) async {
    /*
      Deletes the task from the HiveBox
    */
    await HiveFunctions.deleteItem(HiveFunctions.taskBox, t, t.id);
  }

}