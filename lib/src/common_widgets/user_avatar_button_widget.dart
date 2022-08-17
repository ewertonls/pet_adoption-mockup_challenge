import 'package:flutter/material.dart';

class UserAvatarButton extends StatelessWidget {
  const UserAvatarButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 40),
      child: Material(
        type: MaterialType.button,
        color: theme.colorScheme.primary,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: Tooltip(
          message: "User Profile",
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              'assets/images/avatar/avatar_400x400.jpg',
              filterQuality: FilterQuality.medium,
            ),
          ),
        ),
      ),
    );
  }
}
