import 'package:flutter/material.dart';
import '../data/userData.dart';
import '../utils/constants.dart';
import '../utils/Styles.dart';

class CardPageJP extends StatelessWidget {
  const CardPageJP({
    Key? key,
    this.photoLink = UserData.photoLink,
    this.name = UserData.name,
    this.job = UserData.job,
    this.mail = UserData.mail,
    this.linkedIn = UserData.linkedIn,
  }) : super(key: key);

  final String photoLink;
  final String photoFallbackLink = Constants.cardCircleAvatarFallbackPhotoLink;
  final String name;
  final String job;
  final String mail;
  final String linkedIn;

  Widget _createSecondaryTexts(
    IconData icon,
    String info,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: Constants.cardSecondaryTextsStartPadding,
          ),
          child: Icon(
            icon,
            color: Colors.blue.shade700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Constants.cardSecondaryTextsMediumPadding,
          ),
          child: Text(
            info,
            style: Styles.cardSecondaryTextsTextStyle,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Constants.cardElevation,
      color: Colors.amber.shade50,
      shadowColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Constants.cardBorderRadius,
        ),
      ),
      child: Container(
        width: Constants.cardContentContainerWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.cardPaddingLarge,
              ),
              child: CircleAvatar(
                radius: Constants.cardCircleAvatarRadius,
                backgroundImage: AssetImage(
                  this.photoFallbackLink,
                ),
                foregroundImage: AssetImage(
                  this.photoLink,
                ),
              ),
            ),
            Text(
              this.name,
              style: Styles.cardTitleTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Constants.cardPaddingMedium,
              ),
              child: Text(
                this.job,
                style: Styles.cardSubtitleTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Constants.cardPaddingSmall,
              ),
              child: Divider(
                thickness: Constants.cardDividerThickness,
                indent: Constants.cardDividerIndent,
                endIndent: Constants.cardDividerIndent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.cardPaddingSmall,
              ),
              child: _createSecondaryTexts(
                Icons.mail_outline,
                this.mail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: Constants.cardPaddingExtraLarge,
              ),
              child: _createSecondaryTexts(
                Icons.phone_android,
                this.linkedIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
