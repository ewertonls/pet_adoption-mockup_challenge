import 'package:flutter/material.dart';

import 'widgets/pet_list_view_with_filter_option_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final containerColor = Theme.of(context).colorScheme.surfaceVariant;
    return Scaffold(
      drawer: const Drawer(),
      body: Container(
        color: containerColor,
        child: const PetListViewWithFilterOption(
          title: "Cameron St., Boston",
          titleLabel: "Location",
        ),
      ),
    );
  }
}
