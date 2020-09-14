import 'constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_view_model.dart';
import 'movie_model.dart';


Future<MovieListViewModel> getMovies(linkAPI) async {
  http.Response response = await http.get(linkAPI);
  String data = response.body;
  var decoded = jsonDecode(data)["results"];

  List<Movie> movies = [];

  for(var i in decoded){
    movies.add(Movie(i));
  }

  return MovieListViewModel(movies);
}

