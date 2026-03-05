import 'package:flutter/material.dart';

import 'features/dashboard/dashboard_screen.dart';

void main() {
  runApp(const PlantTrackerApp());
}

class PlantTrackerApp extends StatelessWidget {
  const PlantTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true
      ),
      home: const DashboardScreen(),
    );
  }
}
