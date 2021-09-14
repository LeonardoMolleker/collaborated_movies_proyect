import 'package:flutter/material.dart';

import 'card_page_juan_pablo.dart';
import 'card_page_leonardo.dart';
import 'card_page_juliana.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CardPageJP(),
          SimpleBusinessCardJ(),
          CardPageL(),
        ],
      ),
    );
  }
}
