import 'package:flutter/material.dart';

import '../../../common_widgets/app_favorite_button_widget.dart';
import '../../../pet/models/pet_model.dart';
import '../../../theme/app_icons.dart';
import '../../../utils/calendar_duration.dart';

class PetCard extends StatefulWidget {
  const PetCard({
    super.key,
    required this.pet,
    required this.onTap,
    required this.onFavorite,
    this.imageBackgroundColor = Colors.amber,
  });

  final PetModel pet;
  final void Function() onTap;
  final void Function() onFavorite;
  final Color imageBackgroundColor;

  @override
  State<PetCard> createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {
  final BorderRadius borderRadius = BorderRadius.circular(16);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      type: MaterialType.card,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 130,
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: widget.imageBackgroundColor,
                    borderRadius: borderRadius,
                  ),
                  child: Transform.scale(
                    scale: 1.2,
                    alignment: Alignment.center,
                    child: Image.asset(
                      widget.pet.photos[0],
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8, height: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _PetCardHeader(
                            theme: theme,
                            pet: widget.pet,
                          ),
                        ),
                        AppFavoriteButton(
                          onTap: widget.onFavorite,
                          value: widget.pet.isFavorite,
                        ),
                      ],
                    ),
                    _buildGenderAndAgeInfo(theme),
                    const Spacer(),
                    _buildDistanceMarker(theme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildGenderAndAgeInfo(ThemeData theme) {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.labelSmall,
      TextSpan(
        children: [
          TextSpan(text: "${widget.pet.gender}, "),
          TextSpan(
            text: _buildAgeString(widget.pet),
          ),
        ],
      ),
    );
  }

  Row _buildDistanceMarker(ThemeData theme) {
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(-1, 0),
          child: Icon(
            AppIcons.mapMarker,
            color: theme.colorScheme.primary,
            size: theme.textTheme.labelLarge?.fontSize,
          ),
        ),
        Expanded(
          child: Text(
            "${widget.pet.distance.toStringAsFixed(1)} kms away",
            style: theme.textTheme.labelSmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _buildAgeString(PetModel pet) {
    final age = pet.age;
    final int months = age.inMonths;
    final double years = age.inYears;

    final bool isSingular = years == 1.0 || months == 1;
    final bool hasFractionDigits = years % 1 == 0;

    if (age.inYears < 1) {
      return isSingular ? "$months month old" : "$months months old";
    } else {
      return isSingular
          ? "${years.toInt()} year old"
          : "${hasFractionDigits ? years.toInt() : years.toStringAsFixed(1)}"
              " years old";
    }
  }
}

class _PetCardHeader extends StatelessWidget {
  const _PetCardHeader({
    Key? key,
    required this.theme,
    required this.pet,
  }) : super(key: key);

  final ThemeData theme;
  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          pet.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        Text(
          pet.breed,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: theme.textTheme.labelMedium?.copyWith(
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
