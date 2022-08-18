import 'package:flutter/material.dart';

class PetDetailsAbout extends StatelessWidget {
  const PetDetailsAbout({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 2,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          width: 768,
          child: Text(
            content,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
