import '../models/dog_model.dart';
import '../entities/pet_interface.dart';
import 'filter_interface.dart';

class DogPetFilter implements IPetFilter {
  @override
  bool filter(IPet pet) => pet is DogModel;
}
