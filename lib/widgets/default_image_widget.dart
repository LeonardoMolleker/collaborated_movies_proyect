import 'package:flutter/material.dart';
import '../utils/string_constants.dart';

class DefaultImageWidget extends StatelessWidget {
  const DefaultImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      StringConstants.defaultPoster,
      fit: BoxFit.cover,
    );
  }
}
