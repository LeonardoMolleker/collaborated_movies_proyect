import 'package:flutter/material.dart';
import '../models/movie_result.dart';
import '../constants/measures_constants.dart';
import '../constants/string_constants.dart';

class MovieDetailsInfo extends StatelessWidget {
  final String language;
  final String date;
  final String rating;

  const MovieDetailsInfo({
    Key key,
    this.language,
    this.date,
    this.rating,
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
