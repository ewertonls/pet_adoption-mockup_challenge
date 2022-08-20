import 'package:flutter/material.dart';

import '../../../common_widgets/app_button_widget.dart';
import '../../../common_widgets/app_chip_widget.dart';
import '../../../pet/controllers/pet_list_filter_controller.dart';
import '../../../pet/pet_filter_item.dart';
import '../../../theme/app_icons.dart';
import '../../../theme/app_mediaquery_extension.dart';

class FilterOptionsListView extends StatefulWidget {
  const FilterOptionsListView({
    super.key,
    required this.filters,
    required this.controller,
  });

  final Set<PetFilterItem> filters;
  final PetListFilterController controller;

  @override
  State<FilterOptionsListView> createState() => _FilterOptionsListViewState();
}

class _FilterOptionsListViewState extends State<FilterOptionsListView> {
  late List<PetFilterItem> filterItemsList;
  @override
  void initState() {
    super.initState();
    filterItemsList = widget.filters.toList();
  }

  void _selectItem(PetFilterItem item) {
    widget.controller.selectedFilter = item.filter;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ListFilterSettingsButton(
          onTap: () {},
        ),
        SizedBox(width: context.spacing),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(right: context.horizontalSpacing),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: filterItemsList.length,
            itemBuilder: (_, index) {
              final item = filterItemsList[index];
              return _ListFilterItem(
                filterIcon: item.iconName,
                filterName: item.name,
                onSelect: () {
                  _selectItem(item);
                },
                value: widget.controller.selectedFilter == item.filter,
              );
            },
            separatorBuilder: (_, __) {
              return SizedBox.square(dimension: context.spacing);
            },
          ),
        ),
      ],
    );
  }
}

class _ListFilterItem extends StatelessWidget {
  const _ListFilterItem({
    required this.filterIcon,
    this.filterName,
    required this.onSelect,
    this.value = false,
  });

  final IconData filterIcon;
  final String? filterName;
  final void Function() onSelect;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return AppChip(
      icon: Icon(filterIcon),
      label: filterName,
      onTap: onSelect,
      selected: value,
    );
  }
}

class _ListFilterSettingsButton extends StatelessWidget {
  const _ListFilterSettingsButton({
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: AppButon(
        onTap: onTap,
        child: const Icon(
          AppIcons.slidersOutlined,
          size: 22,
        ),
      ),
    );
  }
}
