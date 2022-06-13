import 'dart:math';

import 'package:flutter/material.dart';

///This class have static methot which generate random color
class GenerateRandomColor {
  ///Initialize random
  static final Random random = Random();

  ///Function for generate random color
  static Color getColor() {
    final colorA = random.nextInt(256);
    final colorR = random.nextInt(256);
    final colorG = random.nextInt(256);
    final colorB = random.nextInt(256);
    final generateedColor = Color.fromARGB(
      colorA,
      colorR,
      colorG,
      colorB,
    );

    return generateedColor;
  }
}
