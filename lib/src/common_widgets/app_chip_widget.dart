import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.icon,
    this.label,
    this.selected = false,
    this.onTap,
  });

  final Widget icon;
  final String? label;
  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      type: MaterialType.card,
      color: selected ? theme.colorScheme.primary : theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              IconTheme(
                  data: IconThemeData(
                    color: selected
                        ? theme.colorScheme.onPrimary
                        : theme.iconTheme.color,
                  ),
                  child: icon),
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    label!,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: selected
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
