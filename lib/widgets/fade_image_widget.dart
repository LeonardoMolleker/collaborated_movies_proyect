import 'package:flutter/material.dart';
import '../utils/string_constants.dart';

class FadeImageWidget extends StatelessWidget {
  final String posterPath;

  const FadeImageWidget({
    Key? key,
    this.posterPath = StringConstants.defaultPoster,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: StringConstants.defaultPoster,
      image: posterPath,
      fit: BoxFit.cover,
    );
  }
}
