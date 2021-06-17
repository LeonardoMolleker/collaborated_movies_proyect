import 'package:flutter/material.dart';
import 'package:tmdb_movies/constants/string_constants.dart';
import '../constants/measures_constants.dart';

class MovieDetailImage extends StatelessWidget {
  final String posterPath;
  final String defaultPath;
  final String heroTag;

  const MovieDetailImage({
    Key key,
    this.posterPath,
    this.defaultPath = StringConstants.defaultPoster,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Container(
        height: MeasuresConstants.movieDetailContainerHeight,
        child: Center(
          child: FadeInImage.assetNetwork(
            placeholder: defaultPath,
            image: posterPath != null
                ? StringConstants.uriPosterImage + posterPath
                : defaultPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
