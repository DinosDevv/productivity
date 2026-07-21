import 'package:flutter/material.dart';
import '../storage/hive_functions.dart';
import '../timer/controllers/timer_controller.dart';

class DebtController extends ChangeNotifier {
  DebtController._();
  static final DebtController instance = DebtController._();

  /*
    Reads the HiveBox at index 0 where all debts are stored, fetches and returns the value.
  */

  int loadDebt() => HiveFunctions.debtBox.get(0, defaultValue: 0)!;
  
  /*
    Adds 'seconds' to the already stored debt saved at index 0.
  */
  
  void addDebt(int seconds) {
    HiveFunctions.addToBox(HiveFunctions.debtBox, loadDebt() + seconds, 0);
    notifyListeners();
  }

  void triggerTime() {
    TimerController.instance.startingSeconds = loadDebt();
    TimerController.instance.start(onDone: () {
      /*
        This feels like very "spaghetti" code but it basically makes the Debt 0, I should probably change the function from addDebt to manageDebt or setDebt to fix this issue. Also, I should make it so the user can stop the timer and only subtract from the debt storage exactly the duration he worked off of the debt.
      */
      addDebt(-loadDebt()); 
    });
  }
}

