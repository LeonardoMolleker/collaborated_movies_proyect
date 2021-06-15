import 'package:flutter/material.dart';
import '../bloc/trending_movies_bloc.dart';
import '../constants/measures_constants.dart';
import '../widgets/home_body_content.dart';
import '../widgets/home_appbar_content.dart';

class Home extends StatelessWidget {
  final TrendingMoviesBloc bloc;

  const Home({
    Key key,
    this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MeasuresConstants.appBarHeight,
        ),
        child: Container(
          color: Colors.black,
          child: HomeAppBarContent(),
        ),
      ),
      body: HomeBodyContent(
        bloc: bloc,
      ),
    );
  }
}
