import '../models/bird_model.dart';
import '../entities/pet_interface.dart';
import 'filter_interface.dart';

class BirdPetFilter implements IPetFilter {
  @override
  bool filter(IPet pet) => pet is BirdModel;
}
