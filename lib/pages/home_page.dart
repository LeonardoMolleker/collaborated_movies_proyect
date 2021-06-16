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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: MeasuresConstants.logoPaddingTop,
              ),
              child: Image.asset(
                srcImage,
                height: MeasuresConstants.logoHeight,
                width: MeasuresConstants.logoWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: MeasuresConstants.textFieldPaddingTop,
                left: MeasuresConstants.textFieldPaddingLeft,
              ),
              child: SizedBox(
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        right: MeasuresConstants.rightPaddingTexFieldIcon,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                    bloc.searchMovies(value);
                  },
                ),
                width: MeasuresConstants.textFieldSixedBoxWidth,
                height: MeasuresConstants.textFieldSixedBoxHeight,
              ),
            )
          ],
        ),
      ),
      body: HomeBodyContent(
        bloc: bloc,
      ),
    );
  }
}
