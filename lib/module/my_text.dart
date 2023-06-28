import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MyText {
  final LARGETITLE = 34.0;
  final TITLE1 = 28.0;
  final TITLE2 = 22.0;
  final TITLE3 = 20.0;
  final BODY = 17.0;

  Widget normal(double size, String text, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontFamily: 'sunflower', color: color),
    );
  }

  Widget bold(double size, String text, Color color) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontFamily: 'sunflower',
          fontWeight: FontWeight.bold,
          color: color),
    );
  }

  Widget underline(double size, String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'sunflower',
        decoration: TextDecoration.underline,
      ),
    );
  }
}
