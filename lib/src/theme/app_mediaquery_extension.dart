import 'package:flutter/material.dart';

extension AppMediaQuery on BuildContext {
  bool get isDesktop => _isDesktop(this);
  Size get appSize => MediaQuery.of(this).size;
  double get statusbarSize => MediaQuery.of(this).padding.top;
  double get spacing => verticalSpacing;
  double get horizontalSpacing => _horizontalSpacing(this);
  double get verticalSpacing => _verticalSpacing(this);
  double get radius => 16;
  double get maxParagraphWidth => 768;
}

bool _isDesktop(BuildContext context) {
  final appSize = MediaQuery.of(context).size;
  final bool isDesktop = appSize.width > 640;
  return isDesktop;
}

double _horizontalSpacing(BuildContext context) {
  final appSize = MediaQuery.of(context).size;
  final horizontalSpacing = appSize.width * 0.1;
  return horizontalSpacing;
}

double _verticalSpacing(BuildContext context) {
  final appSize = MediaQuery.of(context).size;
  final verticalSpacing = appSize.height * 0.03;
  return verticalSpacing;
}
