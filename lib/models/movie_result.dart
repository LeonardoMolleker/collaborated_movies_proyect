import '../utils/string_constants.dart';

class MovieResult {
  late int voteCount;
  late int id;
  late bool video;
  late double voteAverage;
  late String title;
  late double popularity;
  late String posterPath;
  late String originalLanguage;
  late String originalTitle;
  late List<int> genreIds = [];
  String? backdropPath;
  late bool adult;
  late String overview;
  late String releaseDate;

  MovieResult({
    required this.voteCount,
    required this.id,
    required this.video,
    required this.voteAverage,
    required this.title,
    required this.popularity,
    required this.posterPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    this.backdropPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
  });

  factory MovieResult.fromJson(
    result,
  ) {
    List<int> genreId = [];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      genreId.add(result['genre_ids'][i]);
    }
    return MovieResult(
      voteCount: result["vote_count"],
      id: result["id"],
      video: result["video"],
      voteAverage: result['vote_average'].toDouble(),
      title: result['title'],
      popularity: result['popularity'].toDouble(),
      posterPath: (result['poster_path'] != null)
          ? StringConstants.uriPosterImage + result['poster_path']
          : StringConstants.emptyString,
      originalLanguage: result['original_language'],
      originalTitle: result['original_title'],
      genreIds: genreId,
      backdropPath: result['backdrop_path'],
      adult: result['adult'],
      overview: result['overview'],
      releaseDate: result['release_date'],
    );
  }
}
