import 'package:flutter/material.dart';

import 'filters/filter_interface.dart';

class PetFilterItem {
  PetFilterItem({
    required this.filter,
    required this.name,
    required this.iconName,
  });

  final IPetFilter filter;
  final String name;
  final IconData iconName;
}
