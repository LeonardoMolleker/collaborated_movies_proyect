import '../utils/string_constants.dart';

class MovieResult {
  late int _voteCount;
  late int _id;
  late bool _video;
  late double _voteAverage;
  late String _title;
  late double _popularity;
  late String _posterPath;
  late String _originalLanguage;
  late String _originalTitle;
  late List<int> _genreIds = [];
  String? _backdropPath;
  late bool _adult;
  late String _overview;
  late String _releaseDate;

  MovieResult(
    result,
  ) {
    _voteCount = result["vote_count"];
    _id = result["id"];
    _video = result["video"];
    _voteAverage = result['vote_average'].toDouble();
    _title = result['title'];
    _popularity = result['popularity'].toDouble();
    _posterPath = (result['poster_path'] != null)
        ? result['poster_path']
        : StringConstants.defaultPoster;
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds?.add(result['genre_ids'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String? get backdropPath => _backdropPath;

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
