import 'package:flutter/material.dart';
import '../utils/measures_constants.dart';
import '../bloc/trending_movies_bloc.dart';
import 'movie_list_builder.dart';

class HomeBodyContent extends StatelessWidget {
  final TrendingMoviesBloc bloc;
  final double childAspectRatio;
  final int crossAxisCount;
  final double mainAxisSpacement;

  const HomeBodyContent({
    Key? key,
    required this.bloc,
    this.childAspectRatio = MeasuresConstants.defaultChildAspectRatio,
    this.crossAxisCount = MeasuresConstants.defaultCrossAxisCount,
    this.mainAxisSpacement = MeasuresConstants.gridMainAxisSpacement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: bloc.stream,
      builder: (
        context,
        snapshot,
      ) {
        return snapshot.hasData
            ? GridView.count(
                mainAxisSpacing: mainAxisSpacement,
                childAspectRatio: childAspectRatio,
                crossAxisCount: crossAxisCount,
                children: buildList(
                  context,
                  snapshot,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
