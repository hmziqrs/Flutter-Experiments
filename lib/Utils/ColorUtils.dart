import 'package:flutter/material.dart';

class ColorUtils {
  static Color stringToInt(String color) {
    String parser = '0xFF${color.replaceAll(new RegExp(r'#'), '')}';
    return new Color(int.parse(parser));
  }
}
