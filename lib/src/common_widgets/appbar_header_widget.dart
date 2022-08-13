import 'package:flutter/material.dart';

class AppbarHeader extends StatelessWidget {
  const AppbarHeader({
    super.key,
    this.titleLabel,
    this.title,
    this.leading,
    this.trailing,
  });

  final String? titleLabel;
  final String? title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(
    BuildContext context,
  ) {
    final double topPadding = MediaQuery.of(context).padding.top;
    final ThemeData theme = Theme.of(context);

    return Material(
      type: MaterialType.card,
      color: theme.colorScheme.background,
      child: IconTheme(
        data: theme.iconTheme.copyWith(
          color: theme.colorScheme.onBackground,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leading != null) leading! else const Spacer(),
              Expanded(
                flex: 2,
                child: _buildTitle(theme),
              ),
              if (trailing != null) trailing! else const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (titleLabel != null)
          Text(
            titleLabel!,
            style: theme.textTheme.labelSmall
                ?.copyWith(color: theme.colorScheme.onBackground),
            textAlign: TextAlign.center,
          ),
        if (title != null)
          Text(
            title!,
            style: theme.textTheme.titleSmall
                ?.copyWith(color: theme.colorScheme.onBackground),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
