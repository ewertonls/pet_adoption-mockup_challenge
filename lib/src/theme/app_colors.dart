import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const colorReelColors = <Color>[
    yellow,
    cyan,
    blue,
    orange,
    green,
    red,
  ];

  static Color colorReelColor(int index) {
    return colorReelColors[index % colorReelColors.length];
  }

  static const primary = red;
  static const primaryContainer = lightRed;

  static const surface = white;

  static const bodycolor = darkGray;
  static const lightText = lightGray;

  static const white = Color(0xFFFFFFFF);
  static const lighterGray = Color(0xFFF2F2F2);
  static const lightGray = Color(0xFFB5B5B5);
  static const grey = Color(0xFF6F6F6F);
  static const darkGray = Color(0xFF2F2E2C);
  static const yellow = Color(0xFFFEE46B);
  static const cyan = Color(0xFF89D3D2);
  static const blue = Color(0xFF7FC6E4);
  static const orange = Color(0xFFFFAA79);
  static const green = Color(0xFFB9D89E);
  static const red = Color(0xFFFF5F50);
  static const lightRed = Color(0xFFFFE6E3);
}
