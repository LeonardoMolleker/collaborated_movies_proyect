import '../models/movie_model.dart';
import 'bloc.dart';

abstract class ITrendingMovies extends Bloc {
  Stream<MovieModel> get stream;

  void fetchTrendingMovies();
}
