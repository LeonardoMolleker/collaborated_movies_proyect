import 'package:flutter/material.dart';
import '../utils/measures_constants.dart';
import '../utils/string_constants.dart';

class MovieDetailsInfo extends StatelessWidget {
  final String language;
  final String date;
  final String rating;

  const MovieDetailsInfo({
    Key? key,
    this.language = StringConstants.defaultLanguage,
    this.date = StringConstants.defaultDate,
    this.rating = StringConstants.defaultRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: MeasuresConstants.movieDetailInfoBottomPadding,
      ),
      child: Text(
        StringConstants.movieDetailLanguage +
            language +
            StringConstants.movieDetailDate +
            date +
            StringConstants.movieDetailRating +
            rating,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.white,
          wordSpacing: MeasuresConstants.movieDetailInfoWordSpacing,
          fontSize: MeasuresConstants.movieDetailInfoFontSize,
        ),
      ),
    );
  }
}
