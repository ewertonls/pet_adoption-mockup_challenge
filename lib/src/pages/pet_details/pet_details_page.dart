import 'package:flutter/material.dart';
import 'package:pet_adoption/src/common_widgets/app_back_button_widget.dart';
import 'package:pet_adoption/src/pet/models/pet_model.dart';

import '../../common_widgets/app_favorite_button_widget.dart';
import '../../theme/app_colors.dart';
import 'widgets/pet_details_about_widget.dart';
import 'widgets/pet_details_adopt_button.dart';
import 'widgets/pet_details_header_widget.dart';
import 'widgets/pet_details_sliver_appbar_widget.dart';
import 'widgets/pet_image_gallery_widget.dart';

class PetDetailsPage extends StatefulWidget {
  const PetDetailsPage({
    super.key,
    required this.pet,
    required this.imagebackgroundColor,
  });

  final PetModel pet;
  final Color imagebackgroundColor;

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  final padding = const EdgeInsets.symmetric(horizontal: 32);
  late final Color imagebackgroundColor;

  late PetModel pet;

  @override
  void initState() {
    super.initState();
    pet = widget.pet;
    imagebackgroundColor = widget.imagebackgroundColor;
  }

  void _popWithCurrentPet() {
    Navigator.of(context).pop(pet);
  }

  void _tooglePetFavorite() {
    pet = pet.copyWith(isFavorite: !pet.isFavorite);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          PetDetailsSliverAppBar(
            leading: AppBackButton(onTap: _popWithCurrentPet),
            trailing: AppFavoriteButton.filled(
              onTap: _tooglePetFavorite,
              color: AppColors.lightRed,
              value: pet.isFavorite,
            ),
          ),
          _DetailsHeaderWidget(
            pet: pet,
            padding: padding,
          ),
          _ImageGallerySliver(
            pet: pet,
            imagebackgroundColor: imagebackgroundColor,
            padding: padding,
          ),
          _AboutSectionSliver(
            pet: pet,
            padding: padding,
          ),
        ],
      ),
      bottomNavigationBar: PetDetailsAdoptButton(onTap: () {}),
    );
  }
}

class _DetailsHeaderWidget extends StatelessWidget {
  const _DetailsHeaderWidget({
    Key? key,
    required this.pet,
    required this.padding,
  }) : super(key: key);

  final EdgeInsets padding;
  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(const Size.fromWidth(768)),
            child: PetDetailsHeader(pet: pet),
          ),
        ),
      ),
    );
  }
}

class _ImageGallerySliver extends StatelessWidget {
  const _ImageGallerySliver({
    Key? key,
    required this.pet,
    required this.imagebackgroundColor,
    required this.padding,
  }) : super(key: key);

  final EdgeInsets padding;
  final PetModel pet;
  final Color imagebackgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: Center(
          child: PetImageGallery(
            pet: pet,
            imagebackgroundColor: imagebackgroundColor,
          ),
        ),
      ),
    );
  }
}

class _AboutSectionSliver extends StatelessWidget {
  const _AboutSectionSliver({
    Key? key,
    required this.pet,
    required this.padding,
  }) : super(key: key);

  final PetModel pet;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding.copyWith(bottom: 100),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: PetDetailsAbout(content: pet.about),
        ),
      ),
    );
  }
}
