import '../entities/pet_interface.dart';

abstract class IPetFilter {
  bool filter(IPet pet);
}
