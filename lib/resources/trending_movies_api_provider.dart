import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/uri_constants.dart';
import '../models/movie_model.dart';

class TrendingMoviesApiProvider {
  Future<MovieModel> fetchTrendingMovies() async {
    final response = await http.get(
      Uri.parse(
        UriConstants.uri + UriConstants.trendingMoviesEndpoint,
      ),
      headers: {
        "Content-Type": UriConstants.contentType,
        "Authorization": UriConstants.apiToken,
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
