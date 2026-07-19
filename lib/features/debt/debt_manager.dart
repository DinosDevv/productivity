import 'package:flutter/material.dart';
import '../storage/hive_functions.dart';

class DebtManager extends ChangeNotifier {
  DebtManager._();
  static final DebtManager instance = DebtManager._();

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
}

