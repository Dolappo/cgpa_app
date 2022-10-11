import 'package:flutter/material.dart';

class EColor {
  static const primaryColor = Color(0xffffbbae);
  static const secPrimaryColor = Color(0xfffaa481);

  static const LinearGradient myGradient = LinearGradient(
    colors: [
      primaryColor,
      secPrimaryColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
