import 'package:flutter/material.dart';

import 'constants.dart';

abstract class Styles {
  static final TextStyle cardTitleTextStyle = TextStyle(
    fontSize: Constants.cardTitleFontSize,
    letterSpacing: -0.5,
    wordSpacing: -2,
    fontWeight: FontWeight.w500,
    color: Colors.indigo.shade800,
  );
  static final TextStyle cardSubtitleTextStyle = TextStyle(
    fontSize: Constants.cardSubtitleFontSize,
    fontWeight: FontWeight.w400,
    color: Colors.indigo.shade700,
  );
  static final TextStyle cardSecondaryTextsTextStyle = TextStyle(
    fontSize: Constants.cardSecondaryTextsFontSize,
    fontWeight: FontWeight.w400,
    color: Colors.blue.shade700,
  );
}

final Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromRGBO(20, 212, 186, 10),
    Color.fromRGBO(0, 123, 205, 10),
  ],
).createShader(
  Rect.fromLTWH(0.0, 0.0, 400.0, 70.0),
);
