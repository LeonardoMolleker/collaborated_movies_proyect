import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_movies/utils/testing_constants.dart';
import '../lib/models/movie_result.dart';
import 'package:flutter/material.dart';
import '../lib/pages/movie_details_page.dart';
import '../lib/utils/string_constants.dart';
import 'build_widget.dart';

void main() {
  late MovieResult mockResult;
  setUp(
    () {
      mockResult = MovieResult(
        voteCount: TestingConstants.movieResultVoteCount,
        id: TestingConstants.movieResultId,
        video: TestingConstants.movieResultIsVideo,
        voteAverage: TestingConstants.movieResultAverage,
        title: TestingConstants.movieResultTitle,
        popularity: TestingConstants.movieResultPopularity,
        posterPath: TestingConstants.movieResultPosterPath,
        originalLanguage: TestingConstants.movieResultLanguage,
        originalTitle: TestingConstants.movieResultOriginalTitle,
        genreIds: TestingConstants.movieResultGenresId,
        adult: TestingConstants.movieResultIsForAdults,
        overview: TestingConstants.movieResultOverview,
        releaseDate: TestingConstants.movieResultDate,
      );
    },
  );

  testWidgets(
    TestingConstants.movieDetailTestDescription,
    (tester) async {
      await tester.pumpWidget(
        buildWidget(
          MovieDetailPage(
            result: mockResult,
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(
            Hero,
          ),
          matching: find.byType(
            CachedNetworkImage,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          mockResult.title,
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          StringConstants.movieDetailLanguage +
              mockResult.originalLanguage +
              StringConstants.movieDetailDate +
              mockResult.releaseDate +
              StringConstants.movieDetailRating +
              mockResult.voteAverage.toString(),
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          mockResult.overview,
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(
            Row,
          ),
          matching: find.byType(
            Icon,
          ),
        ),
        findsWidgets,
      );

      expect(
        find.byType(
          ElevatedButton,
        ),
        findsOneWidget,
      );
    },
  );
}
