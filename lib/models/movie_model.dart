import 'movie_result.dart';

class MovieModel {
  int _page;
  int _totalPages;
  int _totalResults;
  List<MovieResult> _results;

  MovieModel.fromJson(
    Map<String, dynamic> json,
  ) {
    _page = json["page"];
    _totalPages = json["total_pages"];
    _totalResults = json["total_results"];
    _results = [];
    for (var i = 0; i < json["results"].length; i++) {
      _results.add(
        MovieResult(
          json["results"][i],
        ),
      );
    }
  }

  List<MovieResult> get results => _results;

  int get totalResults => _totalResults;

  int get totalPages => _totalPages;

  int get page => _page;

  @override
  String toString() {
    return 'ItemModel{_page: $_page, _totalPages: $_totalPages, _totalResults: $_totalResults, _results: $_results}';
  }
}
