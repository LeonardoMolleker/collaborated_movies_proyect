import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/string_constants.dart';
import '../models/movie_model.dart';

class TrendingMoviesApiProvider {
  Future<MovieModel> fetchTrendingMovies() async {
    final response = await http.get(
      Uri.parse(
        StringConstants.uri + StringConstants.trendingMoviesEndpoint,
      ),
      headers: {
        "Content-Type": StringConstants.contentType,
        "Authorization": StringConstants.apiToken,
      },
    );
    if (response.statusCode == 200) {
      return MovieModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception("Failed to get data");
    }
  }
}
