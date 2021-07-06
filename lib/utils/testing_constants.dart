import '../models/movie_result.dart';

abstract class TestingConstants {
  static const int movieModelMockPages = 1;
  static const int movieModelMockTotalPages = 7;
  static const int movieModelMockTotalResults = 3;
  static const List<MovieResult> emptyList = [];
  static const String homePageTestDescription =
      "Should display a logo, a search bar and a gridview of movies";
  static const String fetchTrendingMoviesDescription =
      "Should return trending movies";
  static const String fetchMoviesByQueryDescription =
      "Should return movies based on a query";
  static const String movieDetailTestDescription =
      "Should display a detail of a movie";
  static const int movieResultVoteCount = 13;
  static const int movieResultId = 3;
  static const bool movieResultIsVideo = true;
  static const double movieResultAverage = 7.8;
  static const String movieResultTitle = "Default Title";
  static const double movieResultPopularity = 6.0;
  static const String movieResultPosterPath =
      "/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg";
  static const String movieResultLanguage = "en-US";
  static const String movieResultOriginalTitle = "No title";
  static const List<int> movieResultGenresId = [1, 5, 7];
  static const bool movieResultIsForAdults = false;
  static const String movieResultOverview = "Generic overview";
  static const String movieResultDate = "2020-03-15";
  static const String queryOfRequest = "cru";
}
