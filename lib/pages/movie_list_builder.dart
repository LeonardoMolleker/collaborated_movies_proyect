import 'package:exported_movie_widgets/exported_movie_widgets.dart';
import 'package:flutter/material.dart';
import '../utils/measures_constants.dart';
import '../utils/string_constants.dart';
import 'movie_details_page.dart';

List<Widget> buildList(BuildContext context, AsyncSnapshot snapshot) {
  return List.generate(
    snapshot.data.results.length,
    (index) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (
                context,
              ) =>
                  MovieDetailPage(
                result: snapshot.data.results[index],
              ),
            ),
          );
        },
        child: Card(
          color: Colors.black,
          shadowColor: Colors.white,
          elevation: MeasuresConstants.cardElevation,
          child: MovieDetailImage(
            imagePath: snapshot.data.results[index].posterPath,
            heroTag: StringConstants.heroMovieDetailTransitionTag +
                snapshot.data.results[index].id.toString(),
          ),
        ),
      );
    },
  );
}
