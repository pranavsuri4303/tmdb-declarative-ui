import 'package:flutter/material.dart';
import 'package:movieapp/utilities/movie_model.dart';
import 'package:movieapp/utilities/constants.dart';
import 'package:movieapp/screens/movie_screen.dart';

class MovieBig extends StatelessWidget {
  final Movie movie;

  MovieBig(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return MovieScreen(movie);
              }
          )),
          child: Image.network(
              kImgURL + movie.imgURL,
          ),
        ),
      ),
    );
  }
}
