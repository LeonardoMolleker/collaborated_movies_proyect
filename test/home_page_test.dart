import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb_movies/bloc/trending_movies_bloc.dart';
import 'package:tmdb_movies/models/movie_model.dart';
import 'package:tmdb_movies/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movies/resources/trending_movies_repository.dart';
import 'package:tmdb_movies/utils/testing_constants.dart';
import 'build_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([
  TrendingMoviesBloc,
  TrendingMoviesRepository,
])
void main() {
  late TrendingMoviesBloc bloc;
  late MovieModel movie;
  late MockTrendingMoviesRepository repository;
  setUp(
    () {
      movie = MovieModel(
        page: TestingConstants.movieModelMockPages,
        totalPages: TestingConstants.movieModelMockTotalPages,
        totalResults: TestingConstants.movieModelMockTotalResults,
        results: TestingConstants.emptyList,
      );
      repository = MockTrendingMoviesRepository();
      bloc = TrendingMoviesBloc(
        trendingMoviesRepository: repository,
      );

      when(
        repository.fetchTrendingMovies(),
      ).thenAnswer(
        (_) async => movie,
      );
    },
  );
  testWidgets(
    TestingConstants.homePageTestDescription,
    (tester) async {
      await tester.runAsync(
        () async {
          await mockNetworkImagesFor(
            () => tester.pumpWidget(
              buildWidget(
                Home(
                  bloc: bloc,
                ),
              ),
            ),
          );
          bloc.fetchTrendingMovies();
        },
      );

      await tester.pump();

      expect(
        find.byType(
          Image,
        ),
        findsOneWidget,
      );

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
    },
  );
}
