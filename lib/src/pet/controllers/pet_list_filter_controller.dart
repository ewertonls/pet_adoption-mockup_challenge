import 'package:flutter/material.dart';

import '../../data/fake_data.dart';
import '../filters/empty_pet_filter.dart';
import '../filters/filter_interface.dart';
import '../models/pet_model.dart';

class PetListFilterController extends ChangeNotifier {
  final pets = FakeData().pets;
  final filters = FakeData().filters;

  IPetFilter _selectedFilter = EmptyPetFilter();

  IPetFilter get selectedFilter => _selectedFilter;

  set selectedFilter(IPetFilter newValue) {
    if (_selectedFilter == newValue) {
      _selectedFilter = EmptyPetFilter();
    } else {
      _selectedFilter = newValue;
    }
    notifyListeners();
  }

  void updatePetAt(int index, PetModel newValue) {
    pets[index] = newValue;
    notifyListeners();
  }

  int indexOfPet(PetModel pet) {
    return pets.indexOf(pet);
  }

  void toggleFavorite(PetModel pet) {
    final index = indexOfPet(pet);
    final bool isFavorite = pets.elementAt(index).isFavorite;
    updatePetAt(index, pets.elementAt(index).copyWith(isFavorite: !isFavorite));
  }
}
