import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_movies/utils/testing_constants.dart';
import '../lib/models/movie_model.dart';
import '../lib/resources/trending_movies_api_provider.dart';
import '../lib/utils/string_constants.dart';

void main() {
  late TrendingMoviesApiProvider mockApiProvider;
  setUp(() {
    mockApiProvider = TrendingMoviesApiProvider();
  });
  group("fetchMovies", () {
    test(TestingConstants.fetchTrendingMoviesDescription, () async {
      MovieModel movie = await mockApiProvider.fetchTrendingMovies();
      expect(movie.results, isNotEmpty);
    });

    test(TestingConstants.fetchMoviesByQueryDescription, () async {
      MovieModel movie = await mockApiProvider.searchMovies(
        StringConstants.exampleQuery,
      );
      expect(movie.results, isNotEmpty);
    });
  });
}
