import 'package:flutter/material.dart';
import 'package:movieapp/utilities/movie_model.dart';
import 'package:movieapp/utilities/constants.dart';

class PosterScreen extends StatelessWidget {

  final Movie movie;

  PosterScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.network(
                kImgURL+movie.imgURL,
                //height: double.infinity,
                //width: double.infinity,
                fit: BoxFit.contain,
                //alignment: Alignment.center,
              ),
            ),
            Container(
              width: double.infinity,
              color: Color(0xFF3B3B3B),
              child: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Back"),
                ),
              ),
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}
