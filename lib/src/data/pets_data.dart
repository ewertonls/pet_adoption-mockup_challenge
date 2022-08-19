import '../pet/enums/gender_enum.dart';
import '../pet/models/pet_models.dart';

final List<PetModel> pets = [
  ...dogs,
  ...cats,
];

const List<PetModel> dogs = [
  DogModel(
    name: "Sparky",
    breed: "Golden Retriever",
    age: Duration(days: 30 * 8),
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
    age: Duration(days: 365 + 365 ~/ 2, hours: 12),
    gender: Gender.male,
    distance: 2.6,
    photos: [
      "assets/images/pets/charlie/charlie-01.png",
      "assets/images/pets/charlie/charlie-02.png",
    ],
    about:
        "He's moderately smart and knows some basic commands. He is slightly "
        "clean and enjoys having his teeth cleaned. He loves to play and is always "
        "willing; he is very rough when playing. Cyclists and skateboarders are "
        "his nemesis during walks. He prefers to stay indoors. He snores loudly, "
        "steals socks and other soft objects, and loves to chase squirrels.",
    isFavorite: false,
  ),
  DogModel(
    name: "Max",
    breed: "Siberian Husky",
    age: Duration(days: 365),
    gender: Gender.male,
    distance: 2.9,
    photos: [
      "assets/images/pets/max/max-01.png",
      "assets/images/pets/max/max-02.png"
    ],
    about:
        "He is very friendly towards other people and will let anyone pet him, "
        "and gets along well with other animals. "
        "He's an extremely picky eater and will rarely even taste new foods. "
        "His favourite dog food brand is a cheap canned variety and he likes to eat "
        "notebooks as well. "
        "He will walk calmly and will not pull the lead during "
        "walks. He's used to being on the streets and likes to go outside.",
    isFavorite: false,
  ),
  DogModel(
    name: "Daisy",
    breed: "Maltese",
    age: Duration(days: 30 * 7),
    gender: Gender.female,
    distance: 3.1,
    photos: [
      "assets/images/pets/daisy/daisy-01.png",
      "assets/images/pets/daisy/daisy-02.png",
    ],
    about: "She always hides from strangers, and is afraid of other animals."
        "She's extremely intelligent and very crafty. She is generally not very clean. "
        "She is easily entertained and can entertain herself for hours on end.",
    isFavorite: false,
  ),
  DogModel(
    name: "Zoe",
    breed: "Jack Russel Terrier",
    age: Duration(days: 480),
    gender: Gender.female,
    distance: 5.6,
    photos: [
      "assets/images/pets/zoe/zoe-01.png",
      "assets/images/pets/zoe/zoe-02.png",
    ],
    about: "She is indifferent toward his owner, but will sometimes come when"
        " called. She is generally friendly towards other people but may bite "
        "without warning, and does not mind other animals."
        "She spends most of the day sunbathing, and prefers to stay outside.",
    isFavorite: false,
  ),
];

const List<PetModel> cats = [
  CatModel(
    name: "Sakamoto",
    breed: "Burmese",
    age: Duration(days: 365 * 3),
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
  ),
];
