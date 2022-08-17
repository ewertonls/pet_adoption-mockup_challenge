import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'theme/app_theme.dart';

class PetAdoptionApp extends StatelessWidget {
  const PetAdoptionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const HomePage(),
    );
  }
}
