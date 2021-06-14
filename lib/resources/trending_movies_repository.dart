import '../models/movie_model.dart';
import 'trending_movies_api_provider.dart';

class TrendingMoviesRepository {
  final trendingMoviesApiProvider = TrendingMoviesApiProvider();

  Future<MovieModel> fetchTrendingMovies() =>
      trendingMoviesApiProvider.fetchTrendingMovies();
}
