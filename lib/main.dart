import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/dashboard/dashboard_screen.dart';
import 'features/dashboard/providers/plant_provider.dart';

void main() {
  runApp( ChangeNotifierProvider
    (
      create: (context) => PlantProvider(),
      child: PlantTrackerApp()));
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
