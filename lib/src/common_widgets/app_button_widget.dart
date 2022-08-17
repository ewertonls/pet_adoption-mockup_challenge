import 'package:flutter/material.dart';

class AppButon extends StatelessWidget {
  const AppButon({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      type: MaterialType.button,
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
