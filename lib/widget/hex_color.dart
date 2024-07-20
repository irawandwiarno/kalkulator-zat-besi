import 'package:flutter/material.dart';

class HexColor {

  ///HexColor.code(FFB1B1) or
  ///HexColor.code(FFFFFF)
  static Color code(color) {
    var newCode = "0xFF$color";
    return Color(int.parse(newCode));
  }
}
