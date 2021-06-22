import 'package:flutter/material.dart';
import '../constants/string_constants.dart';

class FadeImageWidget extends StatelessWidget {
  final String posterPath;
  final String defaultPath;

  const FadeImageWidget({
    Key key,
    this.posterPath,
    this.defaultPath = StringConstants.defaultPoster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: defaultPath,
      image: posterPath != null
          ? StringConstants.uriPosterImage + posterPath
          : defaultPath,
      fit: BoxFit.cover,
    );
  }
}
