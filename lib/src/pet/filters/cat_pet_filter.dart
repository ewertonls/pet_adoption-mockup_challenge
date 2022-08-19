import '../models/cat_model.dart';
import '../entities/pet_interface.dart';
import 'filter_interface.dart';

class CatPetFilter implements IPetFilter {
  const CatPetFilter();
  @override
  bool filter(IPet pet) => pet is CatModel;
}
