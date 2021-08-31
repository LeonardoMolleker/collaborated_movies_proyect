import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/styles.dart';

void main() => runApp(SimpleBusinessCardJ());

class SimpleBusinessCardJ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Constants.cardElevation,
      color: Colors.blue.shade100,
      shadowColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Constants.cardBorderRadius,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/avatar.jpeg",
              ),
              backgroundColor: Colors.red,
              radius: Constants.radius,
            ),
            Text(
              'Juliana Dimeglio',
              style: TextStyle(
                fontSize: Constants.nameFontSize,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Flutter college trainee',
              style: TextStyle(
                fontSize: Constants.textFontSize,
                color: Colors.black,
                backgroundColor: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'juliana.dimeglio@globant.com',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                decorationColor: Colors.indigo.shade900,
                decorationThickness: 1.5,
                fontSize: Constants.emailFontSize,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
