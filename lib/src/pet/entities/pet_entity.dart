import '../enums/gender_enum.dart';
import 'pet_interface.dart';

class PetEntity implements IPet {
  const PetEntity({
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    required this.distance,
    required this.photos,
    required this.about,
    required this.isFavorite,
  });

  @override
  final String name;

  @override
  final String breed;

  @override
  final Duration age;

  @override
  final Gender gender;

  @override
  final double distance;

  @override
  final List<String> photos;

  @override
  final String about;

  @override
  final bool isFavorite;
}
