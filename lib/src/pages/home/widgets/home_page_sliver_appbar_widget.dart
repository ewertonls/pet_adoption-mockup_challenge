import 'package:flutter/material.dart';

import '../../../common_widgets/app_drawer_button.dart';
import '../../../common_widgets/pet_adoption_sliver_appbar_widget.dart';
import '../../../common_widgets/user_avatar_button_widget.dart';

class HomePageSliverAppbar extends PetAdoptionSliverAppBar {
  HomePageSliverAppbar({
    super.key,
    super.title,
    super.titleLabel,
    super.floating,
    super.pinned,
    super.minHeight = 128,
    super.maxHeight = 150,
  }) : super(
          leading: const AppDrawerButton(),
          trailing: const _AvatarButton(),
        );
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
