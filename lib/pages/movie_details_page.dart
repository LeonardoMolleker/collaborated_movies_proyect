import 'package:flutter/material.dart';
import '../constants/measures_constants.dart';
import '../constants/string_constants.dart';
import '../models/movie_result.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieResult result;
  final Function functionGetImage;

  MovieDetailPage({
    this.result,
    this.functionGetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: MeasuresConstants.movieDetailContainerHeight,
            child: Center(
              child: functionGetImage(
                result,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: MeasuresConstants.movieDetailTitleTopBottomPadding,
              bottom: MeasuresConstants.movieDetailTitleTopBottomPadding,
              left: MeasuresConstants.movieDetailTitleLeftPadding,
            ),
            child: Text(
              result.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MeasuresConstants.movieDetailTilteFontSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: MeasuresConstants.movieDetailInfoBottomPadding,
            ),
            child: Text(
              StringConstants.movieDetailLanguage +
                  result.originalLanguage +
                  StringConstants.movieDetailDate +
                  result.releaseDate +
                  StringConstants.movieDetailRating +
                  result.voteAverage.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                wordSpacing: MeasuresConstants.movieDetailInfoWordSpacing,
                fontSize: MeasuresConstants.movieDetailInfoFontSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: MeasuresConstants.playButtonLeftRightPadding,
              right: MeasuresConstants.playButtonLeftRightPadding,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (
                    states,
                  ) =>
                      Colors.white,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  Text(
                    StringConstants.playButtonText,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: MeasuresConstants.movieDetailOverviewTopPadding,
              left: MeasuresConstants.movieDetailOverviewLeftRightBottomPadding,
              right:
                  MeasuresConstants.movieDetailOverviewLeftRightBottomPadding,
              bottom:
                  MeasuresConstants.movieDetailOverviewLeftRightBottomPadding,
            ),
            child: Text(
              result.overview,
              style: TextStyle(
                color: Colors.white,
                fontSize: MeasuresConstants.movieDetailOverviewFontSize,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.share_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: MeasuresConstants.movieDetailSixedBoxWidth,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              SizedBox(
                width: MeasuresConstants.movieDetailSixedBoxWidth,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
