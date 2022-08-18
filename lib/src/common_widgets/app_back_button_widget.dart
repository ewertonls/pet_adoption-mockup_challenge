import 'package:flutter/material.dart';

import '../theme/app_icons.dart';
import 'app_icon_button_widget.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      onTap: onTap,
      icon: const Icon(AppIcons.arrowBackRounded),
    );
  }
}
