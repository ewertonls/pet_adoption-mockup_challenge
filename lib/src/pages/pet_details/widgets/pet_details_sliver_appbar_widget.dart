import 'package:flutter/material.dart';

import '../../../common_widgets/pet_adoption_sliver_appbar_widget.dart';

class PetDetailsSliverAppBar extends StatelessWidget {
  const PetDetailsSliverAppBar({
    super.key,
    this.title,
    this.titleLabel,
    this.leading,
    this.trailing,
  });

  final String? title;
  final String? titleLabel;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return PetAdoptionSliverAppBar(
      minHeight: 140,
      maxHeight: 140,
      floating: true,
      title: title,
      titleLabel: titleLabel,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: leading,
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 32),
        child: trailing,
      ),
    );
  }
}
