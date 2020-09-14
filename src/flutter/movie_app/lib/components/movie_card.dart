import 'package:flutter/material.dart';
import 'package:movieapp/utilities/constants.dart';
import 'package:movieapp/utilities/movie_model.dart';
import 'package:movieapp/screens/movie_screen.dart';


class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {

    List<Widget> l = [];

    for(int i = 0; i < movie.rating ~/ 2; i++){
       l.add(Icon(Icons.star));
    }

    if(movie.rating.toInt() % 2 == 1){
      l.add(Icon(Icons.star_half));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return MovieScreen(movie);
              }
          )),
          focusColor: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  kImgURL + movie.imgURL,
                  height: 150,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(movie.title, style: kInfoB,),
                      width: MediaQuery.of(context).size.width*0.6,
                    ),
                    Text(movie.date, style: kInfo,),
                    //Text((movie.rating*10).toInt().toString() + "%", style: kInfo,),
                    Row(
                      children: l,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
