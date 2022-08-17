import '../pet/models/pet_models.dart';
import '../pet/enums/gender_enum.dart';
import '../pet/filters/pet_filters.dart';
import '../pet/pet_filter_item.dart';
import '../theme/app_icons.dart';

class FakeData {
  Set<PetFilterItem> filters = {
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

  List<PetModel> pets = [
    DogModel(
      name: "Sparky",
      breed: "Golden Retriever",
      age: const Duration(days: 30 * 8),
      gender: Gender.female,
      distance: 2.5,
      photos: [
        "assets/images/pets/sparky/sparky-01.png",
        "assets/images/pets/sparky/sparky-02.png",
        "assets/images/pets/sparky/sparky-03.png",
        "assets/images/pets/sparky/sparky-04.png",
        "assets/images/pets/sparky/sparky-05.png",
        "assets/images/pets/sparky/sparky-06.png",
      ],
      about: "She is shy at first, but will warm up when she's comfortable. "
          "She is not a ranch dog that guards animals and property as she would "
          "rather be with her people; but she is comfortable around animals. "
          "She plays well with other dogs.",
      isFavorite: true,
    ),
    DogModel(
      name: "Charlie",
      breed: "Boston Terrier",
      age: const Duration(days: 365 + 365 ~/ 2, hours: 12),
      gender: Gender.male,
      distance: 2.6,
      photos: [
        "assets/images/pets/charlie/charlie-02.png",
        "assets/images/pets/charlie/charlie-01.png",
      ],
      about: "lorem charlie",
      isFavorite: false,
    ),
    DogModel(
      name: "Max",
      breed: "Siberian Husky",
      age: const Duration(days: 365),
      gender: Gender.male,
      distance: 2.9,
      photos: [
        "assets/images/pets/max/max-01.png",
        "assets/images/pets/max/max-02.png"
      ],
      about: "lorem max",
      isFavorite: false,
    ),
    DogModel(
      name: "Daisy",
      breed: "Maltese",
      age: const Duration(days: 30 * 7),
      gender: Gender.female,
      distance: 3.1,
      photos: [
        "assets/images/pets/daisy/daisy-01.png",
        "assets/images/pets/daisy/daisy-02.png",
      ],
      about: "lorem daisy",
      isFavorite: false,
    ),
    DogModel(
      name: "Zoe",
      breed: "Jack Russel Terrier",
      age: const Duration(days: 480),
      gender: Gender.female,
      distance: 5.6,
      photos: [
        "assets/images/pets/zoe/zoe-01.png",
        "assets/images/pets/zoe/zoe-02.png",
      ],
      about: "lorem zoe",
      isFavorite: false,
    ),
    CatModel(
      name: "Sakamoto",
      breed: "Burmese",
      age: const Duration(days: 365 * 3),
      gender: Gender.male,
      distance: 10789.6,
      photos: [
        "assets/images/pets/sakamoto/sakamoto-01.png",
        "assets/images/pets/sakamoto/sakamoto-02.png",
        "assets/images/pets/sakamoto/sakamoto-03.png",
        "assets/images/pets/sakamoto/sakamoto-04.png",
      ],
      about: "Sakamoto is a black cat that was found by Nano and Hakase. "
          "Sakamoto is able to speak while wearing a red scarf made by Hakase. "
          "He is older than both Nano and Hakase (20 years old in cat years), "
          "and prefers to be called \"Sakamoto-san\" to emphasize his authority.",
      isFavorite: false,
    )
  ];
}
