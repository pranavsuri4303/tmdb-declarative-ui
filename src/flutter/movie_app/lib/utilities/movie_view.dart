import 'package:flutter/material.dart';
import 'package:movieapp/utilities/movie_view_model.dart';
import 'package:movieapp/utilities/movie_model.dart';
import 'package:movieapp/components/movie_big.dart';
import 'package:movieapp/components/movie_card.dart';

List<Widget> getPopularView(MovieListViewModel movies){
  List<Widget> popMovies = [];

  for(Movie movie in movies.movies){
    popMovies.add(MovieCard(movie));
  }
  return popMovies;
}

List<Widget> getPlayingView(MovieListViewModel movies){
  List<Widget> plaMovies = [];

  for(Movie movie in movies.movies){
    plaMovies.add(MovieBig(movie));
  }

  return plaMovies;
}