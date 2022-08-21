import 'dart:math';

import 'package:flutter/material.dart';
import '../theme/app_mediaquery_extension.dart';

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
    final theme = Theme.of(context);
    final appWidth = context.appSize.width;
    final topPadding = context.statusbarSize;
    final spacing = context.spacing;
    final horizontalSpacing = context.horizontalSpacing;
    final radius = context.radius;

    return ClipPath(
      clipper: _SliverAppBarShape(radius: radius),
      child: Material(
        type: MaterialType.card,
        color: theme.colorScheme.background,
        child: IconTheme(
          data: theme.iconTheme.copyWith(
            color: theme.disabledColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: topPadding,
              bottom: spacing,
              left: horizontalSpacing,
              right: horizontalSpacing,
            ),
            child: Stack(
              children: [
                if (leading != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform.translate(
                      offset: const Offset(-24, 0),
                      child: leading!,
                    ),
                  ),
                Center(
                  child: SizedBox(
                    width: appWidth - (horizontalSpacing * 2) - 84,
                    child: _AppBarTitle(
                      title: title,
                      titleLabel: titleLabel,
                    ),
                  ),
                ),
                if (trailing != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: trailing!,
                  ),
              ],
            ),
          ),
        ),
      ),
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

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    this.title,
    this.titleLabel,
  });

  final String? title;
  final String? titleLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (titleLabel != null)
          Text(
            titleLabel!,
            style: textTheme.labelSmall,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        if (title != null)
          Text(
            title!,
            style: textTheme.titleSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
      ],
    );
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
    path..lineTo(0, height)
   ..arcTo(
      Rect.fromCircle(center: Offset(radius, height), radius: radius),
      pi,
      pi / 2,
      false,
    )
    ..lineTo(radius, height - radius)
    ..lineTo(width - radius, height - radius)
    ..arcTo(
      Rect.fromCircle(center: Offset(width - radius, height), radius: radius),
      pi * 3 / 2,
      pi / 2,
      false,
    )
    ..lineTo(width, height)
    ..lineTo(width, 0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
