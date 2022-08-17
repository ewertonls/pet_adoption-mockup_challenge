import 'package:flutter/material.dart';

import 'sliver_appbar_header_widget.dart';

class PetAdoptionSliverAppBar extends SliverPersistentHeader {
  PetAdoptionSliverAppBar({
    super.key,
    this.title,
    this.titleLabel,
    this.leading,
    this.trailing,
    this.minHeight = 140,
    this.maxHeight = 180,
    super.floating,
    super.pinned,
  }) : super(
          delegate: SliverAppbarHeader(
            leading: leading,
            trailing: trailing,
            title: title,
            titleLabel: titleLabel,
            minHeight: minHeight,
            maxHeight: maxHeight,
          ),
        );

  final String? title;
  final String? titleLabel;
  final Widget? leading;
  final Widget? trailing;
  final double minHeight;
  final double maxHeight;
}
