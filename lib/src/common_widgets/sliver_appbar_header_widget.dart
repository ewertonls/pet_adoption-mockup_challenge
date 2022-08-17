import 'dart:math';

import 'package:flutter/material.dart';

class SliverAppbarHeader extends SliverPersistentHeaderDelegate {
  const SliverAppbarHeader({
    this.titleLabel,
    this.title,
    this.leading,
    this.trailing,
    this.minHeight = 90,
    this.maxHeight = 120,
  });

  final double minHeight;
  final double maxHeight;

  final String? titleLabel;
  final String? title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double topPadding = MediaQuery.of(context).padding.top;
    final ThemeData theme = Theme.of(context);

    return ClipPath(
      clipper: _SliverAppBarShape(radius: 16),
      child: Material(
        type: MaterialType.card,
        color: theme.colorScheme.background,
        child: IconTheme(
          data: theme.iconTheme.copyWith(
            color: theme.disabledColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: topPadding, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (leading != null) leading! else const Spacer(),
                Expanded(
                  flex: 2,
                  child: _buildTitle(theme),
                ),
                if (trailing != null) trailing! else const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (titleLabel != null)
          Text(
            titleLabel!,
            style: theme.textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        if (title != null)
          Text(
            title!,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _SliverAppBarShape extends CustomClipper<Path> {
  _SliverAppBarShape({required this.radius});
  final double radius;

  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    final path = Path();
    path.lineTo(0, height);
    path.arcTo(
      Rect.fromCircle(center: Offset(radius, height), radius: radius),
      pi,
      pi / 2,
      false,
    );
    path.lineTo(radius, height - radius);
    path.lineTo(width - radius, height - radius);
    path.arcTo(
      Rect.fromCircle(center: Offset(width - radius, height), radius: radius),
      pi * 3 / 2,
      pi / 2,
      false,
    );
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
