import 'package:flutter/material.dart';
import '../constants/measures_constants.dart';
import '../bloc/trending_movies_bloc.dart';
import '../constants/uri_constants.dart';

class HomeBodyContent extends StatelessWidget {
  final TrendingMoviesBloc bloc;
  final double childAspectRatio;
  final int crossAxisCount;
  final double mainAxisSpacement;

  const HomeBodyContent({
    Key key,
    this.bloc,
    this.childAspectRatio = MeasuresConstants.defaultChildAspectRatio,
    this.crossAxisCount = MeasuresConstants.defaultCrossAxisCount,
    this.mainAxisSpacement = MeasuresConstants.gridMainAxisSpacement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.fetchTrendingMovies();
    return StreamBuilder(
      stream: bloc.stream,
      builder: (
        context,
        snapshot,
      ) {
        return Container(
          color: Colors.black,
          child: GridView.count(
            mainAxisSpacing: mainAxisSpacement,
            childAspectRatio: childAspectRatio,
            crossAxisCount: crossAxisCount,
            children: buildList(
              snapshot,
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildList(AsyncSnapshot snapshot) {
    return List.generate(snapshot.data.results.length, (index) {
      return Card(
        shadowColor: Colors.white,
        elevation: MeasuresConstants.cardElevation,
        child: Image.network(
          UriConstants.uriPosterImage + snapshot.data.results[index].posterPath,
          fit: BoxFit.cover,
        ),
      );
    });
  }
}
