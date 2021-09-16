import 'package:flutter/material.dart';
import '../utils/string_constants.dart';
import '../utils/measures_constants.dart';
import '../bloc/trending_movies_bloc.dart';
import 'movie_list_builder.dart';

class HomeBodyContent extends StatefulWidget {
  final TrendingMoviesBloc bloc;
  final double childAspectRatio;
  final int crossAxisCount;
  final double mainAxisSpace;

  const HomeBodyContent({
    Key? key,
    required this.bloc,
    this.childAspectRatio = MeasuresConstants.defaultChildAspectRatio,
    this.crossAxisCount = MeasuresConstants.defaultCrossAxisCount,
    this.mainAxisSpace = MeasuresConstants.gridMainAxisSpacing,
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
        AsyncSnapshot snapshot,
      ) {
        return snapshot.hasData
            ? snapshot.data.results.isNotEmpty
                ? GridView.count(
                    mainAxisSpacing: widget.mainAxisSpace,
                    childAspectRatio: widget.childAspectRatio,
                    crossAxisCount: widget.crossAxisCount,
                    children: buildList(
                      context,
                      snapshot,
                    ),
                  )
                : SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Center(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              StringConstants.imageSearchNotFound,
                            ),
                          ),
                          Text(
                            StringConstants.textSearchNotFound,
                            style: TextStyle(
                              color: Colors.indigoAccent,
                              fontSize:
                                  MeasuresConstants.fontSizeSearchNotFound,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
