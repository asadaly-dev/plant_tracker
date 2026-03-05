import 'package:flutter/cupertino.dart';

import '../models/plant_model.dart';

class PlantProvider extends ChangeNotifier {
  final List _plants = [];
  List get plants => _plants;

  void addPlant(Plant newPlant) {
    _plants.add(newPlant);
    notifyListeners();
  }

  void waterPlant(String plantId){
    final index = _plants.indexWhere((p) => p.id == plantId);
    if (index != -1) {
      _plants[index] = _plants[index].copyWith(lastWatered: DateTime.now());
      notifyListeners();
    }
  }

  void deletePlant(String plantId){
    for (var i =0; i<_plants.length;i++)
      {
        if (_plants[i].id == plantId){
          _plants.remove(i);
          break;
        }
      }
    notifyListeners();
  }

  List <Plant> getPlantsNeedingWater(List <Plant> plants){
    // 1️⃣ Ek empty list banayenge thirsty plants ke liye
    List<Plant> thirstyPlants = [];

    // 2️⃣ Aaj ki date le lo
    DateTime today = DateTime.now();

    // 3️⃣ Har plant ko check karo
    for (var plant in plants) {

      // 4️⃣ Agar lastWatered null nahi hai
      if(plant.lastWatered != null){

        // 5️⃣ Next watering date calculate karo
        DateTime nextWaterDate = plant.lastWatered!.add(Duration(days: plant.waterIntervalDays));

        // 6️⃣ Agar aaj ki date nextWaterDate ke barabar ya baad me hai
        if(!nextWaterDate.isAfter(today)){

          // 7️⃣ Is plant ko thirsty list me add kar do
          thirstyPlants.add(plant);
        }
      }

    }
    return thirstyPlants;
  }
}
