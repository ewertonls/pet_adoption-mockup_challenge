import '../entities/pet_interface.dart';
import 'filter_interface.dart';

class EmptyPetFilter extends IPetFilter {
  @override
  bool filter(IPet pet) => true;
}
