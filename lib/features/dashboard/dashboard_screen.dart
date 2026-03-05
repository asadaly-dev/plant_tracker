import 'package:flutter/material.dart';
import 'package:plant_tracker/core/constants.dart';
import 'package:plant_tracker/features/dashboard/models/plant_model.dart';
import 'package:plant_tracker/features/dashboard/providers/plant_provider.dart';
import 'package:provider/provider.dart';

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
          context.watch<PlantProvider>().plants.length.toString(),
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        final newPLant = Plant(id: DateTime.now().toString(), name: "Marigold", species: "Tagetes", waterIntervalDays: 2, lastWatered: DateTime.now());
        Provider.of<PlantProvider>(context,listen: false).addPlant(newPLant);
      },
      child: const Icon(Icons.add),
    ));
  }
}
