import 'package:flutter/material.dart';

import '../../../theme/app_icons.dart';

class PetDetailsAdoptButton extends StatelessWidget {
  const PetDetailsAdoptButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          color: colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              width: 220,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    AppIcons.paw,
                    color: colorScheme.onPrimary,
                    size: 20,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Adopt".toUpperCase(),
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
