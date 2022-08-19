import 'package:flutter/material.dart';
import 'package:pet_adoption/src/pages/pet_details/pet_details_page.dart';

import '../../../pet/controllers/pet_list_filter_controller.dart';
import '../../../pet/models/pet_models.dart';
import '../../../theme/app_colors.dart';
import 'home_page_sliver_appbar_widget.dart';
import 'pet_card_widget.dart';
import 'pet_filter_option_list_widget.dart';

class PetListViewWithFilterOption extends StatefulWidget {
  const PetListViewWithFilterOption({
    super.key,
    required this.title,
    required this.titleLabel,
  });

  final String title;
  final String titleLabel;

  @override
  State<PetListViewWithFilterOption> createState() =>
      _PetListViewWithFilterOptionState();
}

class _PetListViewWithFilterOptionState
    extends State<PetListViewWithFilterOption> {
  late List<PetModel> listItems;

  final PetListFilterController controller = PetListFilterController();

  @override
  void initState() {
    super.initState();
    listItems = controller.pets;
    controller.addListener(() {
      _applyFilter();
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _applyFilter() {
    listItems = controller.pets //
        .where(controller.selectedFilter.filter) //
        .toList();
    setState(() {});
  }

  Future<void> _navigateToPetDetailsAndUpdatePet(
    BuildContext context,
    PetModel pet,
    Color color,
  ) async {
    final petIndex = controller.indexOfPet(pet);
    final newPet = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PetDetailsPage(
        pet: pet,
        imagebackgroundColor: color,
      ),
    ));
    if (!mounted) {
      return;
    }
    controller.updatePetAt(petIndex, newPet);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 500;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        HomePageSliverAppbar(
          title: widget.title,
          titleLabel: widget.titleLabel,
          floating: true,
          minHeight: 72,
          maxHeight: 116,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: FilterOptionsListView(
                controller: controller,
                filters: controller.filters,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop ? 2 : 1,
              mainAxisSpacing: listItems.isNotEmpty ? 16 : 0,
              crossAxisSpacing: 16,
              mainAxisExtent: 120,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: listItems.length,
              (context, index) {
                final pet = listItems[index];
                final backgroundColor = AppColors.colorReelColor(index);
                return PetCard(
                  pet: pet,
                  imageBackgroundColor: backgroundColor,
                  onTap: () {
                    _navigateToPetDetailsAndUpdatePet(
                      context,
                      pet,
                      backgroundColor,
                    );
                  },
                  onFavorite: () {
                    controller.toggleFavorite(listItems[index]);
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
