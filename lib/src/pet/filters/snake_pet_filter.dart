import '../models/snake_model.dart';
import '../entities/pet_interface.dart';
import 'filter_interface.dart';

class SnakePetFilter implements IPetFilter {
  const SnakePetFilter();
  @override
  bool filter(IPet pet) => pet is SnakeModel;
}
