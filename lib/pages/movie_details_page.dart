import 'package:flutter/material.dart';
import '../widgets/fade_image_widget.dart';
import '../constants/string_constants.dart';
import '../widgets/movie_detail_image.dart';
import '../widgets/movie_detail_play_button.dart';
import '../widgets/movie_details_actions.dart';
import '../widgets/movie_details_info.dart';
import '../widgets/movie_details_overview.dart';
import '../widgets/movie_details_title.dart';
import '../models/movie_result.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieResult result;

  MovieDetailPage({
    this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailImage(
              image: FadeImageWidget(
                posterPath: result.posterPath,
              ),
              heroTag: StringConstants.heroMovieDetailTransitionTag +
                  result.id.toString(),
            ),
            MovieDetailsTitle(
              title: result.title,
            ),
            MovieDetailsInfo(
              language: result.originalLanguage,
              date: result.releaseDate,
              rating: result.voteAverage.toString(),
            ),
            MovieDetailPlayButton(),
            MovieDetailsOverview(
              overview: result.overview,
            ),
            MovieDetailsActions(),
          ],
        ),
      ),
    );
  }
}
