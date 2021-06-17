import 'package:flutter/material.dart';
import '../pages/movie_details_page.dart';
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
                functionGetImage: getImage,
              ),
            ),
          );
        },
        child: Card(
          color: Colors.black,
          shadowColor: Colors.white,
          elevation: MeasuresConstants.cardElevation,
          child: Hero(
            tag: StringConstants.heroMovieDetailTransitionTag + snapshot.data.results[index].id.toString(),
            child: getImage(
              posterPath: snapshot.data.results[index].posterPath,
              id: snapshot.data.results[index].id.toString(),
            ),
          ),
        ),
      );
    });
  }

  FadeInImage getImage({
    String posterPath,
    String defaultPath = StringConstants.defaultPoster,
    String id,
  }) {
    return FadeInImage.assetNetwork(
      placeholder: defaultPath,
      image: posterPath != null
          ? StringConstants.uriPosterImage + posterPath
          : defaultPath,
      fit: BoxFit.cover,
    );
  }
}
