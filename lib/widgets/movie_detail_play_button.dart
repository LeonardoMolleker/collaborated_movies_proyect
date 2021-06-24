import 'package:flutter/material.dart';
import '../utils/measures_constants.dart';
import '../utils/string_constants.dart';

class MovieDetailPlayButton extends StatelessWidget {
  const MovieDetailPlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MeasuresConstants.playButtonHorizontalPadding,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (
              states,
            ) =>
                Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            Text(
              StringConstants.playButtonText,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
