import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static Color getRandomColor() {
    Random random = Random();
    // Generate random values for red, green, and blue components
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);

    // Construct a color using the generated values and return it
    return Color(0xFF000000 + red * 0x10000 + green * 0x100 + blue);
  }
}