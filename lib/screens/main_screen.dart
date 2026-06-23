import 'package:flutter/material.dart';
import 'task_screen.dart';
import 'debt_screen.dart';
import 'settings_screen.dart';
import 'stats_screen.dart';
import 'today_screen.dart';
import '../misc/colors.dart';

class MainScreen extends StatefulWidget {

  final int index;
  
  // This is gonna be spaghetti code and I will probably need to fix it soon

  final int minutes;

  const MainScreen({super.key, required this.index, required this.minutes});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentPageIndex = widget.index;
  late int minutes = widget.minutes;

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
        TodayScreen(minutes: minutes),
        DebtScreen(),
        StatsScreen(),
        SettingsScreen(),
      ][currentPageIndex],
    );
  }
}