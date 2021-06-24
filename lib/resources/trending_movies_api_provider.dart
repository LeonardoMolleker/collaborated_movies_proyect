import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/measures_constants.dart';
import '../utils/string_constants.dart';
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
    if (response.statusCode == MeasuresConstants.statusCodeOk) {
      return MovieModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(StringConstants.exceptionText);
    }
  }

  Future<MovieModel> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse(
        StringConstants.uri + StringConstants.searchMoviesEndpoint + query,
      ),
      headers: {
        "Content-Type": StringConstants.contentType,
        "Authorization": StringConstants.apiToken,
      },
    );
    if (response.statusCode == MeasuresConstants.statusCodeOk) {
      return MovieModel.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else{
      throw Exception(StringConstants.exceptionText);
    }
  }
}
