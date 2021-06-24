import 'package:flutter/material.dart';
import '../utils/string_constants.dart';
import '../utils/measures_constants.dart';

class MovieDetailsOverview extends StatelessWidget {
  final String overview;

  const MovieDetailsOverview({
    Key? key,
    this.overview = StringConstants.defaultOverview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        MeasuresConstants.movieDetailOverviewLeftRightBottomPadding,
        MeasuresConstants.movieDetailOverviewTopPadding,
        MeasuresConstants.movieDetailOverviewLeftRightBottomPadding,
        MeasuresConstants.movieDetailOverviewLeftRightBottomPadding,
      ),
      child: Text(
        overview,
        style: TextStyle(
          color: Colors.white,
          fontSize: MeasuresConstants.movieDetailOverviewFontSize,
        ),
      ),
    );
  }
}
