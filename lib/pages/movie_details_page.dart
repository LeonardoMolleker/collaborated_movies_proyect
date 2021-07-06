import 'package:exported_movie_widgets/exported_movie_widgets.dart';
import 'package:flutter/material.dart';
import '../utils/string_constants.dart';
import '../models/movie_result.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieResult result;

  MovieDetailPage({
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            MovieDetailsInfo(
              language: result.originalLanguage,
              date: result.releaseDate,
              rating: result.voteAverage.toString(),
            ),
            MovieDetailsOverview(
              overview: result.overview,
            ),
            MovieDetailsActions(),
          ],
        ),
      ),
      bottomNavigationBar: MovieDetailBackButton(),
    );
  }
}
