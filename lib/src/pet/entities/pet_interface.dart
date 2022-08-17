import '../enums/gender_enum.dart';

abstract class IPet {
  String get name;
  String get breed;
  Gender get gender;
  Duration get age;
  double get distance;
  List<String> get photos;
  String get about;
  bool get isFavorite;
}
