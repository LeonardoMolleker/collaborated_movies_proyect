import 'dart:async';
import '../resources/trending_movies_repository.dart';
import '../interfaces/ITrendingMoviesBloc.dart';
import '../models/movie_model.dart';

class TrendingMoviesBloc extends ITrendingMovies {
  final trendingMoviesRepository = TrendingMoviesRepository();
  StreamController<MovieModel> movieStream = StreamController();

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
  void initialize() {}

  @override
  Stream<MovieModel> get stream => movieStream.stream;
}
