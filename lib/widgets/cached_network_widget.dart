import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'default_image_widget.dart';

class CachedNetworkWidget extends StatelessWidget {
  final String posterPath;

  const CachedNetworkWidget({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => DefaultImageWidget(),
      imageUrl: posterPath,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => DefaultImageWidget(),
    );
  }
}
