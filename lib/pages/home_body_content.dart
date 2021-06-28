import 'package:flutter/material.dart';
import 'movie_details_page.dart';
import '../utils/measures_constants.dart';
import '../bloc/trending_movies_bloc.dart';
import '../utils/string_constants.dart';
import 'package:exported_movie_widgets/src/movie_widgets.dart';

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

  List<Widget> buildList(BuildContext context, AsyncSnapshot snapshot) {
    return List.generate(snapshot.data.results.length, (index) {
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
    });
  }
}
