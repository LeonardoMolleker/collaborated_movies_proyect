import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CardPageL extends StatelessWidget {
  final String name;
  final String position;
  final String srcImage;
  final String mail;
  final String linkedIn;

  CardPageL({
    this.name = "Leonardo Molleker",
    this.position = "College Trainee",
    this.srcImage = "assets/images/profile.jpg",
    this.mail = "lmolleker.development@gmail.com",
    this.linkedIn = 'www.linkedin.com/in/leonardo-molleker',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.principalContainerHeight,
      width: Constants.principalContainerWidth,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: Constants.gradientRadius,
          colors: [
            Colors.purple,
            Colors.deepPurple,
          ],
        ),
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(
          Constants.borderRadius,
        ),
        border: Border.all(
          color: Colors.deepPurple,
          width: Constants.borderWidth,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: Constants.circleAvatarPaddingTop,
            ),
            child: CircleAvatar(
              radius: Constants.circleAvatarRadius,
              backgroundImage: AssetImage(
                srcImage,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Constants.containerPaddingTop,
            ),
            child: Container(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: Constants.fontSize,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Constants.paddingPosition,
            ),
            child: Container(
              child: Text(
                position,
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: Constants.fontSize,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Constants.containerPaddingTop,
            ),
            child: Divider(
              color: Colors.deepPurpleAccent,
              thickness: Constants.dividerThickness,
            ),
          ),
          Card(
            elevation: Constants.cardElevation,
            color: Colors.purple,
            child: ListTile(
              leading: Icon(
                Icons.phone_android,
                color: Colors.yellowAccent,
              ),
              title: Text(
                linkedIn,
                style: TextStyle(
                  fontSize: Constants.cardFontSize,
                  color: Colors.yellowAccent,
                ),
              ),
              subtitle: Text(
                Constants.subtitleCardLinkedIn,
                style: TextStyle(
                  fontSize: Constants.cardFontSize,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
          ),
          Card(
            elevation: Constants.cardElevation,
            color: Colors.purple,
            child: ListTile(
              leading: Icon(
                Icons.mail_outline_outlined,
                color: Colors.yellowAccent,
              ),
              title: Text(
                mail,
                style: TextStyle(
                  fontSize: Constants.cardFontSize,
                  color: Colors.yellowAccent,
                ),
              ),
              subtitle: Text(
                Constants.subtitleCardMail,
                style: TextStyle(
                  fontSize: Constants.cardFontSize,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
