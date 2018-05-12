import 'package:flutter/material.dart';

class ShoeTheme {
  static TextStyle headerHeading() => new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
      );

  static TextStyle headerDescription() => new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        height: 1.06,
      );

  static TextStyle contentHeading({color = Colors.black}) => new TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      );

  static TextStyle contentSubHeading({color = Colors.grey}) => new TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
      );

  static TextStyle contentBadge({color = Colors.white}) => new TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
      );

  static TextStyle sizeHeading({color = Colors.black}) => new TextStyle(
        height: 1.0,
        color: color,
        fontWeight: FontWeight.w800,
        fontSize: 14.0,
      );

  static TextStyle colorHeading({color = Colors.black}) => new TextStyle(
        height: 1.0,
        color: color,
        fontWeight: FontWeight.w800,
        fontSize: 14.0,
      );
}
