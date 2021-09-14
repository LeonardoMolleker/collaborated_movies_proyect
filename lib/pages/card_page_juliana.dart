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
                Constants.userImage,
              ),
              backgroundColor: Colors.red,
              radius: Constants.radius,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.padding,
              ),
              child: Text(
                Constants.userName,
                style: TextStyle(
                  fontSize: Constants.nameFontSize,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              Constants.userJob,
              style: TextStyle(
                fontSize: Constants.textFontSize,
                color: Colors.black,
                backgroundColor: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              Constants.userEmail,
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                decorationColor: Colors.indigo.shade900,
                fontSize: Constants.emailFontSize,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.padding,
              ),
              child: Text(
                Constants.userLinkedIn,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Constants.cardFontSize,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
