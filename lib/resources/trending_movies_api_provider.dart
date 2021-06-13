import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/item_model.dart';

class TrendingMoviesApiProvider {
  final String _endpoint = "/trending/movie/week";

  Future<ItemModel> fetchTrendingMovies() async {
    final response = await http.get(
      Uri.parse(
        Constants.uri + _endpoint,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": Constants.apiToken,
      },
    );
    if (response.statusCode == 200) {
      return ItemModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception("Failed to get data");
    }
  }
}
