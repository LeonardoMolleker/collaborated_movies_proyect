import 'package:exported_movie_widgets/exported_movie_widgets.dart';
import 'package:flutter/material.dart';
import '../utils/measures_constants.dart';
import '../utils/string_constants.dart';
import '../models/movie_result.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieResult result;

  MovieDetailPage({
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            MeasuresConstants.appBarHeight,
          ),
          child: Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.black,
                  ),
                ),
                icon: Icon(
                  Icons.arrow_back,
                  size: MeasuresConstants.arrowBackSize,
                ),
                label: Text(
                  StringConstants.emptyString,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: MeasuresConstants.logoPaddingTop,
                  left: MeasuresConstants.logoPaddingLeft,
                ),
                child: Image.asset(
                  StringConstants.defaultLogo,
                  height: MeasuresConstants.logoHeight,
                  width: MeasuresConstants.logoWidth,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MovieDetailImage(
                imagePath: result.posterPath,
                heroTag: StringConstants.heroMovieDetailTransitionTag +
                    result.id.toString(),
              ),
              MovieDetailsTitle(
                title: result.title,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MeasuresConstants.horizontalPadding,
                ),
                child: MovieDetailsInfo(
                  language: result.originalLanguage,
                  date: result.releaseDate,
                  rating: result.voteAverage.toString(),
                  fontSize: MeasuresConstants.movieDetailInfoFontSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MeasuresConstants.movieDetailOverviewPadding,
                ),
                child: MovieDetailsOverview(
                  overview: result.overview,
                  fontSize: MeasuresConstants.movieDetailOverviewFontSize,
                ),
              ),
              MovieDetailsActions(),
            ],
          ),
        ),
      ),
    );
  }
}
