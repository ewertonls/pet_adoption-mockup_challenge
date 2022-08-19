import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'theme/app_sys_ui_overlay_style.dart';
import 'theme/app_theme.dart';

class PetAdoptionApp extends StatelessWidget {
  const PetAdoptionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Adoption',
      color: AppTheme.theme.colorScheme.primary,
      theme: AppTheme.theme,
      home: AppStatusBarStyle(child: const SafeArea(child: HomePage())),
    );
  }
}
