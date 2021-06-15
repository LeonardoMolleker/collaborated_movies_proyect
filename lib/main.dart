import 'package:flutter/material.dart';
import 'bloc/trending_movies_bloc.dart';
import 'interfaces/bloc.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _blocs = <Bloc>[];

  @override
  void initState() {
    super.initState();
    _blocs.add(
      TrendingMoviesBloc(),
    );
    _blocs.forEach((bloc) {
      bloc.initialize();
    });
  }

  @override
  void dispose() {
    _blocs.forEach((bloc) {
      bloc.dispose();
    });
    super.dispose();
  }

  T getDesireBloc<T extends Bloc>() {
    return _blocs.firstWhere(
      (bloc) {
        return (bloc is T);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(
        bloc: getDesireBloc<TrendingMoviesBloc>(),
      ),
    );
  }
}
