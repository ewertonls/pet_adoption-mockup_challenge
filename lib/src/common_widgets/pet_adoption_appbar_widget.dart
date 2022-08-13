import 'package:flutter/material.dart';

import 'appbar_header_widget.dart';

class PetAdoptionAppBar extends StatelessWidget with PreferredSizeWidget {
  const PetAdoptionAppBar({
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
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppbarHeader(
      title: title,
      titleLabel: titleLabel,
      leading: leading,
      trailing: trailing,
    );
  }
}
