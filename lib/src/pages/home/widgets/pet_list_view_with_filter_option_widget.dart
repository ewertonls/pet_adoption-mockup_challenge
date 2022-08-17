import 'package:flutter/material.dart';

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
    setState(() {});
    listItems =
        controller.pets.where(controller.selectedFilter.filter).toList();
    debugPrint(listItems.toString());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        HomePageSliverAppbar(
          title: widget.title,
          titleLabel: widget.titleLabel,
          floating: true,
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
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: listItems.length,
            (context, index) {
              const double padding = 16;
              return Padding(
                padding: EdgeInsets.only(
                  top: index == 0 ? 0 : padding,
                ),
                child: PetCard(
                  pet: listItems[index],
                  imageBackgroundColor: AppColors.colorReelColor(index),
                  onTap: () {},
                  onFavorite: () {
                    controller.toggleFavorite(listItems[index]);
                  },
                ),
              );
            },
          )),
        )
      ],
    );
  }
}
