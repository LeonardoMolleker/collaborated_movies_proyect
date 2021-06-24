import 'movie_result.dart';

class MovieModel {
  late int page;
  late int totalPages;
  late int totalResults;
  late List<MovieResult> results;

  MovieModel({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  factory MovieModel.fromJson(
    Map<String, dynamic> json,
  ) {
    List<MovieResult> results = [];
    for (int i = 0; i < json['results'].length; i++) {
      results.add(
        MovieResult.fromJson(
          json['results'][i],
        ),
      );
    }
    return MovieModel(
      page: json["page"],
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
      results: results,
    );
  }
}
