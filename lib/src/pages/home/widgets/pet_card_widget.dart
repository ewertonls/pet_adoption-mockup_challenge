import 'package:flutter/material.dart';

import '../../../common_widgets/app_favorite_button_widget.dart';
import '../../../pet/models/pet_model.dart';
import '../../../theme/app_icons.dart';
import '../../../theme/app_mediaquery_extension.dart';
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
  @override
  Widget build(BuildContext context) {
    final radius = context.radius;
    final spacing = context.spacing;

    return Material(
      type: MaterialType.card,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 130,
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              _PetMainPhoto(
                pet: widget.pet,
                imageBackgroundColor: widget.imageBackgroundColor,
              ),
              SizedBox.square(dimension: spacing / 2),
              _PetCardInfo(
                pet: widget.pet,
                onFavorite: widget.onFavorite,
                onTap: widget.onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PetCardInfo extends StatelessWidget {
  const _PetCardInfo({
    required this.pet,
    required this.onTap,
    required this.onFavorite,
  });

  final PetModel pet;
  final void Function() onTap;
  final void Function() onFavorite;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _PetCardHeader(
                  pet: pet,
                ),
              ),
              AppFavoriteButton(
                onTap: onFavorite,
                value: pet.isFavorite,
              ),
            ],
          ),
          _GenderAndAge(pet: pet),
          const Spacer(),
          _MapMarkerDistance(pet: pet),
        ],
      ),
    );
  }
}

class _PetMainPhoto extends StatelessWidget {
  const _PetMainPhoto({
    required this.pet,
    required this.imageBackgroundColor,
  });

  final PetModel pet;
  final Color imageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final radius = context.radius;

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: imageBackgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Transform.scale(
          scale: 1.2,
          alignment: Alignment.center,
          child: Image.asset(
            pet.photos[0],
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            filterQuality: FilterQuality.medium,
          ),
        ),
      ),
    );
  }
}

class _PetCardHeader extends StatelessWidget {
  const _PetCardHeader({
    required this.pet,
  });

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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

class _GenderAndAge extends StatelessWidget {
  const _GenderAndAge({required this.pet});

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      style: textTheme.labelSmall,
      TextSpan(
        children: [
          TextSpan(text: "${pet.gender}, "),
          TextSpan(
            text: _buildAgeString(pet),
          ),
        ],
      ),
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

class _MapMarkerDistance extends StatelessWidget {
  const _MapMarkerDistance({required this.pet});

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(-1, 0),
          child: Icon(
            AppIcons.mapMarker,
            color: colorScheme.primary,
            size: textTheme.labelLarge?.fontSize,
          ),
        ),
        Expanded(
          child: Text(
            "${pet.distance.toStringAsFixed(1)} kms away",
            style: textTheme.labelSmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
