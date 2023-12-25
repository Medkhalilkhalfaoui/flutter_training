import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';

class Utils {

  static  startLoading()  {
    showDialog(
        context: Constants.navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            SimpleDialog(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              children: [
                Container(
                    width: 100,
                    height: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    decoration: const BoxDecoration(color: Color(0xFFE9E3EC), borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Center(child: CircularProgressIndicator())),
              ],
            )
    );

  }

  static stopLoading()  {
    Navigator.pop(Constants.navigatorKey.currentContext!);
  }

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