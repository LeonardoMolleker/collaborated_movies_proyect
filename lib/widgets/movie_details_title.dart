import 'package:flutter/material.dart';
import '../constants/measures_constants.dart';

class MovieDetailsTitle extends StatelessWidget {
  final String title;

  const MovieDetailsTitle({
    Key key,
    this.title,
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
