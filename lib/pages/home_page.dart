import 'package:flutter/material.dart';
import '../constants/string_constants.dart';
import '../bloc/trending_movies_bloc.dart';
import '../constants/measures_constants.dart';
import '../widgets/home_body_content.dart';

class Home extends StatelessWidget {
  final TrendingMoviesBloc bloc;
  final String srcImage;

  const Home({
    Key key,
    this.bloc,
    this.srcImage = StringConstants.defaultLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MeasuresConstants.appBarHeight,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: MeasuresConstants.logoPaddingTop,
          ),
          child: Image.asset(
            srcImage,
            height: MeasuresConstants.logoHeight,
            width: MeasuresConstants.logoWidth,
          ),
        ),
      ),
      body: HomeBodyContent(
        bloc: bloc,
      ),
    );
  }
}
