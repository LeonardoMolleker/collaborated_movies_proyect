import 'package:flutter/material.dart';
import '../constants/measures_constants.dart';
import '../bloc/trending_movies_bloc.dart';
import '../constants/string_constants.dart';

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
        return snapshot.hasData
            ? GridView.count(
                mainAxisSpacing: mainAxisSpacement,
                childAspectRatio: childAspectRatio,
                crossAxisCount: crossAxisCount,
                children: buildList(
                  snapshot,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  List<Widget> buildList(AsyncSnapshot snapshot) {
    return List.generate(snapshot.data.results.length, (index) {
      return Card(
        color: Colors.black,
        shadowColor: Colors.white,
        elevation: MeasuresConstants.cardElevation,
        child: FadeInImage.assetNetwork(
          placeholder: StringConstants.defaultPoster,
          image: snapshot.data.results[index].posterPath != null
              ? StringConstants.uriPosterImage +
                  snapshot.data.results[index].posterPath
              : StringConstants.defaultPoster,
          fit: BoxFit.cover,
        ),
      );
    });
  }
}
