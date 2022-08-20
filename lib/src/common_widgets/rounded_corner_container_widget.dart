import 'package:flutter/material.dart';

class RoundedCornerContainer extends StatelessWidget {
  const RoundedCornerContainer({
    super.key,
    required this.child,
    this.onlyTopCorners = true,
    this.padding,
    this.radius = 16,
  });

  final Widget child;
  final bool onlyTopCorners;
  final EdgeInsets? padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final containerColor = Theme.of(context).colorScheme.surfaceVariant;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: containerColor,
        ),
        child: child,
      ),
    );
  }
}
