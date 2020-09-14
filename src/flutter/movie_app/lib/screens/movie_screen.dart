import 'package:flutter/material.dart';
import 'package:movieapp/utilities/movie_model.dart';
import 'package:movieapp/utilities/constants.dart';
import 'poster_screen.dart';

class MovieScreen extends StatelessWidget {

  final Movie movie;

  MovieScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    double c_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PosterScreen(movie);
                    }
                  )),
                  child: Image.network(
                    kImgURL+ movie.imgURL,
                    fit: BoxFit.contain,
                    height: c_height*0.4,
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  color: Colors.black,
                  child: Container(
                    height: c_height*0.35,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movie.title,
                          style: kHeader,
                        ),
                        Text(
                          movie.desc,
                          style: kInfo,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Release Date",
                              style: kInfoB,
                            ),
                            Text(
                              movie.date,
                              style: kInfoB,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Average Rating",
                              style: kInfoB,
                            ),
                            Text(
                              movie.rating.toString(),
                              style: kInfoB,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
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
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
