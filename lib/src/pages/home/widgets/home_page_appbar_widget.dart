import 'package:flutter/material.dart';

import '../../../common_widgets/app_icon_button_widget.dart';
import '../../../common_widgets/pet_adoption_appbar_widget.dart';
import '../../../common_widgets/user_avatar_button_widget.dart';
import '../../../theme/app_icons.dart';

class HomePageAppbar extends PetAdoptionAppBar {
  const HomePageAppbar({
    super.key,
    super.title,
    super.titleLabel,
  }) : super(
          leading: const AppDrawerMenuButton(),
          trailing: const _AvatarButton(),
        );
}

class AppDrawerMenuButton extends StatelessWidget {
  const AppDrawerMenuButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: AppIconButton(
        icon: const Icon(AppIcons.bars),
        onTap: () {
          Scaffold.maybeOf(context)?.openDrawer();
        },
      ),
    );
  }
}

class _AvatarButton extends StatelessWidget {
  const _AvatarButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 32),
        child: UserAvatarButton(onTap: () {}));
  }
}
