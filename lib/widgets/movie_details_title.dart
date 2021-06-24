import 'package:flutter/material.dart';
import '../utils/string_constants.dart';
import '../utils/measures_constants.dart';

class MovieDetailsTitle extends StatelessWidget {
  final String title;

  const MovieDetailsTitle({
    Key? key,
    this.title = StringConstants.defaultTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MeasuresConstants.movieDetailTitleTopBottomPadding,
        bottom: MeasuresConstants.movieDetailTitleTopBottomPadding,
        left: MeasuresConstants.movieDetailTitleLeftPadding,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: MeasuresConstants.movieDetailTilteFontSize,
        ),
      ),
    );
  }
}
