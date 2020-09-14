import 'package:flutter/material.dart';



const kHeader = TextStyle(
  fontSize: 35,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const kHeader2 = TextStyle(
  fontSize: 30,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);




const kInfo = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w200,
);

const kInfoB = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

const String kImgURL = "https://image.tmdb.org/t/p/w185_and_h278_bestv2";
const String kPlayingAPI = "https://api.themoviedb.org/3/movie/now_playing?api_key=4a01a777bc601f84dc9c862d70bea3fb";
const String kPopularAPI = "https://api.themoviedb.org/3/discover/movie?api_key=4a01a777bc601f84dc9c862d70bea3fb&sort_by=popularity.desc";