import 'dart:async';
import '../resources/trending_movies_repository.dart';
import '../interfaces/ITrendingMoviesBloc.dart';
import '../models/item_model.dart';

class TrendingMoviesBloc extends ITrendingMovies {
  final trendingMoviesRepository = TrendingMoviesRepository();
  StreamController<ItemModel> movieStream = StreamController();

  @override
  void dispose() {
    movieStream.close();
  }

  @override
  void fetchTrendingMovies() async {
    final trendingMovies = await trendingMoviesRepository.fetchTrendingMovies();
    movieStream.sink.add(
      trendingMovies,
    );
  }

  @override
  Future<void> initialize() {}

  @override
  Stream<ItemModel> get stream => movieStream.stream;
}
