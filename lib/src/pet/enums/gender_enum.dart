enum Gender {
  male("Male"),
  female("Female");

  const Gender(this.name);
  final String name;

  @override
  String toString() => name;
}
