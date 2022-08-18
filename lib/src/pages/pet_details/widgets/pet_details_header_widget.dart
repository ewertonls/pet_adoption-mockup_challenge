import 'package:flutter/material.dart';

import '../../../pet/enums/gender_enum.dart';
import '../../../pet/models/pet_models.dart';
import '../../../theme/app_icons.dart';
import '../../../utils/calendar_duration.dart';

class PetDetailsHeader extends StatelessWidget {
  const PetDetailsHeader({
    super.key,
    required this.pet,
  });

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                pet.name,
                style: theme.textTheme.titleLarge?.copyWith(
                  height: 1.5,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Icon(
              pet.gender == Gender.male
                  ? AppIcons.genderMaleOutlined
                  : AppIcons.genderFemaleOutlined,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                pet.breed,
                style: theme.textTheme.titleSmall?.copyWith(
                  height: 2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                _buildAgeString(pet),
                style: theme.textTheme.titleSmall?.copyWith(
                  height: 2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(-2, 0),
              child: Icon(
                AppIcons.mapMarker,
                size: 20,
                color: theme.colorScheme.primary,
              ),
            ),
            Flexible(
              child: Text(
                "${pet.distance.toStringAsFixed(1)} kms away",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onInverseSurface,
                  height: 2.5,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
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
