import 'package:flutter/material.dart';
import '../../../theme/app_mediaquery_extension.dart';

class PetDetailsAbout extends StatelessWidget {
  const PetDetailsAbout({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: textTheme.titleMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 2,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          width: context.maxParagraphWidth,
          child: Text(
            content,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
