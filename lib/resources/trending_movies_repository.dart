import '../models/item_model.dart';
import 'trending_movies_api_provider.dart';

class TrendingMoviesRepository{
  final trendingMoviesApiProvider = TrendingMoviesApiProvider();

  Future<ItemModel> fetchTrendingMovies() => trendingMoviesApiProvider.fetchTrendingMovies();
}