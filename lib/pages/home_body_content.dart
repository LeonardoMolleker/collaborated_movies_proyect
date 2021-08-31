import 'package:flutter/material.dart';

import '../utils/measures_constants.dart';
import '../bloc/trending_movies_bloc.dart';
import 'movie_list_builder.dart';

class HomeBodyContent extends StatefulWidget {
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
  _HomeBodyContentState createState() => _HomeBodyContentState();
}

class _HomeBodyContentState extends State<HomeBodyContent> {
  @override
  void initState() {
    super.initState();
    widget.bloc.fetchTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: widget.bloc.stream,
      builder: (
        context,
        snapshot,
      ) {
        return snapshot.hasData
            ? GridView.count(
                mainAxisSpacing: widget.mainAxisSpacement,
                childAspectRatio: widget.childAspectRatio,
                crossAxisCount: widget.crossAxisCount,
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
