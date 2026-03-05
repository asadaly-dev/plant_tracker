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
}
