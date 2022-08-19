import '../pet/models/pet_models.dart';
import '../pet/pet_filter_item.dart';
import 'pets_data.dart' as data;
import 'pets_filters.dart' as filter_set;

class FakeData {
  FakeData();
  final Set<PetFilterItem> filters = filter_set.filters;

  final List<PetModel> pets = data.pets;
}
