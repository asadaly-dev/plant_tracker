class Plant {
  final String id;
  final String name;
  final String species;
  final int waterIntervalDays;
  final DateTime lastWatered;

  Plant({
    required this.id,
    required this.name,
    required this.species,
    required this.waterIntervalDays,
    required this.lastWatered,
});

  Plant copyWith({
    String? id,
    String? name,
    String? species,
    int? waterIntervalDays,
    DateTime? lastWatered,
  }){
    return Plant(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      waterIntervalDays: waterIntervalDays ?? this.waterIntervalDays,
      lastWatered: lastWatered ?? this.lastWatered,
    );
  }

}