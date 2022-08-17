import 'package:flutter/material.dart';

import '../theme/app_icons.dart';
import 'app_icon_button_widget.dart';

class AppDrawerButton extends StatelessWidget {
  const AppDrawerButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: LimitedBox(
        maxWidth: 50,
        child: AppIconButton(
          icon: const Icon(AppIcons.bars),
          onTap: () {
            Scaffold.maybeOf(context)?.openDrawer();
          },
        ),
      ),
    );
  }
}
