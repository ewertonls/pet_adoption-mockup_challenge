import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

class AppStatusBarStyle extends AnnotatedRegion<SystemUiOverlayStyle> {
  AppStatusBarStyle({super.key, required super.child})
      : super(
          value: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppTheme.theme.colorScheme.surface,
          ),
        );
}
