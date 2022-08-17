import '../enums/gender_enum.dart';
import 'pet_model.dart';

class CatModel extends PetModel {
  CatModel({
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
  CatModel copyWith({
    String? name,
    String? breed,
    Duration? age,
    Gender? gender,
    double? distance,
    List<String>? photos,
    String? about,
    bool? isFavorite,
  }) {
    return CatModel(
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
