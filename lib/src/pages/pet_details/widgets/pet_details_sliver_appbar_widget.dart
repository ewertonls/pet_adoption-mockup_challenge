import 'package:flutter/material.dart';

import '../../../common_widgets/pet_adoption_sliver_appbar_widget.dart';
import '../../../theme/app_mediaquery_extension.dart';

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
      minHeight: 110,
      maxHeight: 120,
      floating: true,
      title: title,
      titleLabel: titleLabel,
      leading: leading,
      trailing: Transform.translate(
        offset: const Offset(8, 0),
        child: trailing,
      ),
    );
  }
}
