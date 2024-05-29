import 'package:flutter/material.dart';

class AppColors {
  static Color mainColor = const Color.fromRGBO(0, 50, 109, 1);

  static Color getColorByStatus(int status) {
    switch (status) {
      case 1:
        return const Color.fromRGBO(85, 139, 84, 1);
      case 2:
        return const Color.fromRGBO(240, 55, 55, 1);
      default:
        return const Color.fromRGBO(158, 158, 158, 1);
    }
  }
}
