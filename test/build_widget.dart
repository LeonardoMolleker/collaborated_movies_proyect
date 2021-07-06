import 'package:flutter/material.dart';

Widget buildWidget(Widget child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: child,
  );
}
