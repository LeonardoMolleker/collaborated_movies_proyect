import 'package:flutter/material.dart';
import '../widgets/cached_network_widget.dart';
import '../utils/string_constants.dart';
import '../widgets/movie_detail_image.dart';
import '../widgets/movie_detail_back_button.dart';
import '../widgets/movie_details_actions.dart';
import '../widgets/movie_details_info.dart';
import '../widgets/movie_details_overview.dart';
import '../widgets/movie_details_title.dart';
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
              image: CachedNetworkWidget(
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
