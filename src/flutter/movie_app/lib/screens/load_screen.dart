import 'package:flutter/material.dart';
import 'package:movieapp/screens/main_screen.dart';
import 'package:movieapp/utilities/movie_view_model.dart';
import 'package:movieapp/utilities/network.dart';
import 'package:movieapp/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getMovieData() async {
    MovieListViewModel popularMovieList = await getMovies(kPopularAPI);
    MovieListViewModel playingMovieList = await getMovies(kPlayingAPI);

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MainScreen(popularMovies : popularMovieList, playingMovies: playingMovieList,);
      }
    ));
  }

  @override
  void initState(){
    super.initState();
    getMovieData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading..."),
      )
    );
  }
}
