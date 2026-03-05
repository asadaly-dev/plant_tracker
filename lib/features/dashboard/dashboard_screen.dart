import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plant_tracker/core/constants.dart';
import 'package:plant_tracker/features/dashboard/models/plant_model.dart';
import 'package:plant_tracker/features/dashboard/providers/plant_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context);
    final plants = plantProvider.plants;

    return Scaffold(

      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('My Plant Track'),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: plants.length,
          itemBuilder: (context, index) {
          final plant = plants[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.local_florist),
              title: Text(plant.name),
              subtitle: Text(plant.species),
              trailing: Row(mainAxisSize:MainAxisSize.min,
              children: [
                IconButton(onPressed: (){
                  plantProvider.waterPlant(plant.id);
                }, icon:Icon(Icons.opacity,color: Colors.blue,)),
                IconButton(onPressed: (){
                  plantProvider.deletePlant(plant.id);
                }, icon:Icon(Icons.delete,color: Colors.grey,))
              ],),
            ),
          );
        } ,),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        final newPLant = Plant(id: DateTime.now().toString(), name: "Marigold", species: "Tagetes", waterIntervalDays: 2, lastWatered: DateTime.now());
        Provider.of<PlantProvider>(context,listen: false).addPlant(newPLant);
      },
      child: const Icon(Icons.add),
    ));
  }
}
