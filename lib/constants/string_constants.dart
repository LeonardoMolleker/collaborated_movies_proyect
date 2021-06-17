abstract class StringConstants {
  static const String uri = "https://api.themoviedb.org/3/";
  static const String apiToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZTNjMTE5ZDU3YTNhMDYzZWYwZDVhZjJhNTg5N2E4MyIsInN1YiI6IjYwYzI1NTg1YzUxYWNkMDA0MTY0ZjE3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zwRWjmcAIc12aeCsdx8EQ6tmTzIOvNEGndybVv-T_FI";
  static const String contentType = "application/json";
  static const String trendingMoviesEndpoint = "/trending/movie/week";
  static const String searchMoviesEndpoint = "search/movie?query=";
  static const String uriPosterImage = "https://image.tmdb.org/t/p/original";
  static const String defaultLogo = "assets/tmdb_logo.png";
  static const String defaultPoster = "assets/default-thumb.png";
  static const String textFieldLabel = "Search movies";
  static const String exceptionText = "Failed to get data";
  static const String emptyString = "";
  static const String movieDetailLanguage = "Language: ";
  static const String movieDetailDate = " - Date: ";
  static const String movieDetailRating = " - Rating: ";
  static const String playButtonText = "Play";
  static const String heroMovieDetailTransitionTag = "movieImage";
}