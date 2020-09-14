import 'package:flutter/material.dart';
import 'package:movieapp/utilities/constants.dart';
import 'package:movieapp/utilities/movie_view.dart';

class MainScreen extends StatefulWidget {
  final popularMovies;
  final playingMovies;
  MainScreen({this.popularMovies, this.playingMovies});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> popMovies = [];
  List<Widget> nowMovies = [];

  @override

  void initState(){
    super.initState();
    popMovies = getPopularView(widget.popularMovies);
    nowMovies = getPlayingView(widget.playingMovies);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Now Playing", style: kHeader, textAlign: TextAlign.left,),
              ),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: nowMovies,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Popular", style: kHeader2, textAlign: TextAlign.left,),
              ),
              Expanded(
                child: ListView(
                  children: popMovies,
                ),
              ),
            ],
          ),
        ),
      );
  }
}

