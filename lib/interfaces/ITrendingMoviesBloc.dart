import '../models/item_model.dart';
import 'bloc.dart';

abstract class ITrendingMovies extends Bloc {
  Stream<ItemModel> get stream;

  void fetchTrendingMovies();
}
