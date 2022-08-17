import 'package:flutter/material.dart';

import 'widgets/pet_list_view_with_filter_option_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: const PetListViewWithFilterOption(
            title: "Cameron St., Boston",
            titleLabel: "Location",
          ),
        ),
      ),
    );
  }
}
