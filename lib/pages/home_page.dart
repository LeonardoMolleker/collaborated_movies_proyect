import 'package:flutter/material.dart';

import '../utils/string_constants.dart';
import '../bloc/trending_movies_bloc.dart';
import '../utils/measures_constants.dart';
import 'about_page.dart';
import 'home_body_content.dart';

class Home extends StatefulWidget {
  final TrendingMoviesBloc bloc;
  final String srcImage;

  const Home({
    Key? key,
    required this.bloc,
    this.srcImage = StringConstants.defaultLogo,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> pages = [];
  int index = 0;
  late bool _searchBarVisible;

  @override
  void initState() {
    super.initState();
    _searchBarVisible = true;
    widget.bloc.fetchTrendingMovies();
    pages.add(
      HomeBodyContent(
        bloc: widget.bloc,
      ),
    );
    pages.add(
      AboutPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  widget.srcImage,
                  height: MeasuresConstants.logoHeight,
                  width: MeasuresConstants.logoWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: MeasuresConstants.textFieldPaddingTop,
                  left: MeasuresConstants.textFieldPaddingLeft,
                ),
                child: Visibility(
                  visible: _searchBarVisible,
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
                        widget.bloc.searchMovies(value);
                      },
                    ),
                    width: MeasuresConstants.textFieldSizedBoxWidth,
                    height: MeasuresConstants.textFieldSizedBoxHeight,
                  ),
                ),
              )
            ],
          ),
        ),
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          unselectedItemColor: Colors.grey.shade400,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: StringConstants.homeText,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: StringConstants.aboutText,
            ),
          ],
          onTap: (i) {
            setState(() {
              index = i;
              _searchBarVisible = i == 0;
            });
          },
        ),
      ),
    );
  }
}
