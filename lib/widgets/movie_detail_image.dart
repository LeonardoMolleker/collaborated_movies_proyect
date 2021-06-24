import 'package:flutter/material.dart';
import '../utils/measures_constants.dart';

class MovieDetailImage extends StatelessWidget {
  final Widget image;
  final String heroTag;

  const MovieDetailImage({
    Key? key,
    required this.image,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Container(
        height: MeasuresConstants.movieDetailContainerHeight,
        child: Center(
          child: image,
        ),
      ),
    );
  }
}
