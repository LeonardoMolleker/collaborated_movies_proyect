import 'package:flutter/material.dart';
import '../constants/measures_constants.dart';

class MovieDetailsActions extends StatelessWidget {
  final double spacerSize;
  final List<Icon> icons;

  const MovieDetailsActions({
    Key key,
    this.spacerSize = MeasuresConstants.movieDetailSixedBoxWidth,
    this.icons = const [
      Icon(
        Icons.share_outlined,
        color: Colors.white,
      ),
      Icon(
        Icons.favorite_border,
        color: Colors.white,
      ),
      Icon(
        Icons.add,
        color: Colors.white,
      ),
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: generateRow(
        icons,
      ),
    );
  }

  List<Widget> generateRow(List<Icon> icons) {
    List<Widget> row = [];
    for (var i = 0; i < icons.length; i++) {
      row.add(
        icons[i],
      );
      if (i != icons.length - 1) {
        row.add(
          SizedBox(
            width: spacerSize,
          ),
        );
      }
    }
    return row;
  }
}
