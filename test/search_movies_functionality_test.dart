import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb_movies/bloc/trending_movies_bloc.dart';
import 'package:tmdb_movies/models/movie_model.dart';
import 'package:tmdb_movies/pages/home_page.dart';
import 'package:tmdb_movies/utils/testing_constants.dart';
import 'build_widget.dart';
import 'home_page_test.mocks.dart';

void main() {
  late TrendingMoviesBloc bloc;
  late MockTrendingMoviesRepository repository;
  late MovieModel movie;
  setUp(
    () {
      repository = MockTrendingMoviesRepository();
      bloc = TrendingMoviesBloc(trendingMoviesRepository: repository);
      movie = MovieModel(
        page: TestingConstants.movieModelMockPages,
        totalPages: TestingConstants.movieModelMockTotalPages,
        totalResults: TestingConstants.movieModelMockTotalResults,
        results: TestingConstants.emptyList,
      );

      when(
        repository.fetchTrendingMovies(),
      ).thenAnswer(
        (_) async => movie,
      );

      when(
        repository.searchMovies(
          TestingConstants.queryOfRequest,
        ),
      ).thenAnswer(
        (_) async => movie,
      );
    },
  );
  testWidgets(
    "description",
    (tester) async {
      await tester.runAsync(
        () async => {
          await tester.pumpWidget(
            buildWidget(
              Home(
                bloc: bloc,
              ),
            ),
          )
        },
      );

      await tester.pump();

      expect(
        find.byType(
          TextField,
        ),
        findsOneWidget,
      );

      expect(
        find.byType(
          GridView,
        ),
        findsOneWidget,
      );

      await tester.tap(
        find.byType(
          TextField,
        ),
      );

      await tester.enterText(
        find.byType(
          TextField,
        ),
        TestingConstants.queryOfRequest,
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(
        find.byType(
          GridView,
        ),
        findsOneWidget,
      );
    },
  );
}
