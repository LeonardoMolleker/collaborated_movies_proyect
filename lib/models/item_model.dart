class ItemModel {
  int _page;
  int _totalPages;
  int _totalResults;
  List<Result> _results;

  ItemModel.fromJson(
    Map<String, dynamic> json,
  ) {
    _page = json["page"];
    _totalPages = json["total_pages"];
    _totalResults = json["total_results"];
    _results = [];
    for (var i = 0; i < json["results"].length; i++) {
      _results.add(
        Result(
          json["results"][i],
        ),
      );
    }
  }

  List<Result> get results => _results;

  int get totalResults => _totalResults;

  int get totalPages => _totalPages;

  int get page => _page;

  @override
  String toString() {
    return 'ItemModel{_page: $_page, _totalPages: $_totalPages, _totalResults: $_totalResults, _results: $_results}';
  }
}

class Result {
  int _voteCount;
  int _id;
  bool _video;
  double _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds = [];
  String _backdropPath;
  bool _adult;
  String _overview;
  String _releaseDate;

  Result(
    result,
  ) {
    _voteCount = result["vote_count"];
    _id = result["id"];
    _video = result["video"];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  double get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;

  @override
  String toString() {
    return 'Result{_voteCount: $_voteCount, _id: $_id, _video: $_video, _voteAverage: $_voteAverage, _title: $_title, _popularity: $_popularity, _posterPath: $_posterPath, _originalLanguage: $_originalLanguage, _originalTitle: $_originalTitle, _genreIds: $_genreIds, _backdropPath: $_backdropPath, _adult: $_adult, _overview: $_overview, _releaseDate: $_releaseDate}';
  }
}
