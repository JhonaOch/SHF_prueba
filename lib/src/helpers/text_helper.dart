import 'package:flutter/material.dart';

TextStyle? getStyle(
    {double fontSize = 28.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    TextDecoration? lineText}) {
  TextStyle? txtStyle;
  txtStyle = TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    fontFamily: 'Poppins',
    color: color,
    decoration: lineText,
  );
  return txtStyle;
}
