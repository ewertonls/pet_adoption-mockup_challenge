import '../pet/filters/pet_filters.dart';
import '../pet/pet_filter_item.dart';
import '../theme/app_icons.dart';

const Set<PetFilterItem> filters = {
  PetFilterItem(
    name: "Dogs",
    iconName: AppIcons.dogOutlined,
    filter: DogPetFilter(),
  ),
  PetFilterItem(
    name: "Cats",
    iconName: AppIcons.catOutlined,
    filter: CatPetFilter(),
  ),
  PetFilterItem(
    name: "Birds",
    iconName: AppIcons.parrotOutlined,
    filter: BirdPetFilter(),
  ),
  PetFilterItem(
    name: "Snakes",
    iconName: AppIcons.snakeOutlined,
    filter: SnakePetFilter(),
  ),
};
