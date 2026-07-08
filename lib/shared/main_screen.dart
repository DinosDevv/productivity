import 'package:flutter/material.dart';
import '../features/tasks/widgets/task_screen.dart';
import '../features/debt/widgets/debt_screen.dart';
import '../features/settings/widgets/settings_screen.dart';
import '../features/stats/widgets/stats_screen.dart';
import '../features/timer/widgets/today_screen.dart';
import 'UI/colors.dart';

class MainScreen extends StatefulWidget {

  final int index; // Index of the current widget(screen)

  const MainScreen({super.key, required this.index});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentPageIndex = widget.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appBarColor,
          title: Text("Productivity App"),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: appBarColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Plan',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_month),
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Today',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.monetization_on),
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Debt',
          ),
          NavigationDestination(
            icon: Icon(Icons.query_stats),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body:<Widget>[        
        TaskScreen(),
        TodayScreen(),
        DebtScreen(),
        StatsScreen(),
        SettingsScreen(),
      ][currentPageIndex],
    );
  }
}