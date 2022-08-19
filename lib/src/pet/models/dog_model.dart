import '../enums/gender_enum.dart';
import 'pet_model.dart';

class DogModel extends PetModel {
  const DogModel({
    required super.name,
    required super.breed,
    required super.age,
    required super.gender,
    required super.distance,
    required super.photos,
    required super.about,
    required super.isFavorite,
  });

  @override
  DogModel copyWith({
    String? name,
    String? breed,
    Duration? age,
    Gender? gender,
    double? distance,
    List<String>? photos,
    String? about,
    bool? isFavorite,
  }) {
    return DogModel(
      name: name ?? this.name,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      distance: distance ?? this.distance,
      photos: photos ?? this.photos,
      about: about ?? this.about,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
