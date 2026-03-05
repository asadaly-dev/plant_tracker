import 'package:flutter/material.dart';
import 'package:plant_tracker/core/constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('My Plant Track'),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Plant List Will be shown here",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
