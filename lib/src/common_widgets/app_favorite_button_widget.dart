import 'package:flutter/material.dart';

import '../theme/app_icons.dart';

class AppFavoriteButton extends StatefulWidget {
  const AppFavoriteButton({
    super.key,
    this.value = false,
    required this.onTap,
    this.color = Colors.transparent,
    this.padding = const EdgeInsets.all(4),
  });

  final bool value;

  final void Function() onTap;

  final Color color;

  final EdgeInsets padding;

  factory AppFavoriteButton.filled({
    required void Function() onTap,
    bool value = false,
    required Color color,
  }) {
    return AppFavoriteButton(
      onTap: onTap,
      value: value,
      color: color,
      padding: const EdgeInsets.all(8),
    );
  }

  @override
  State<AppFavoriteButton> createState() => _AppFavoriteButtonState();
}

class _AppFavoriteButtonState extends State<AppFavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: widget.value ? widget.color : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: widget.padding,
          child: Icon(
            widget.value ? AppIcons.heart : AppIcons.heartOutlined,
            color: widget.value
                ? theme.colorScheme.primary
                : theme.iconTheme.color,
            size: 24,
          ),
        ),
      ),
    );
  }
}
