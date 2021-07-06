import 'dart:async';
import '../utils/string_constants.dart';
import '../resources/trending_movies_repository.dart';
import '../interfaces/ITrendingMoviesBloc.dart';
import '../models/movie_model.dart';

class TrendingMoviesBloc extends ITrendingMovies {
  final TrendingMoviesRepository trendingMoviesRepository;
  StreamController<MovieModel> movieStream = StreamController();

  TrendingMoviesBloc({TrendingMoviesRepository? trendingMoviesRepository})
      : trendingMoviesRepository =
            trendingMoviesRepository ?? TrendingMoviesRepository();

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

  void searchMovies(String query) async {
    switch (query) {
      case StringConstants.emptyString:
        fetchTrendingMovies();
        break;
      default:
        final movies = await trendingMoviesRepository.searchMovies(
          query,
        );
        movieStream.sink.add(
          movies,
        );
        break;
    }
  }

  @override
  void initialize() {}

  @override
  Stream<MovieModel> get stream => movieStream.stream;
}
