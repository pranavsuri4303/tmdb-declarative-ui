


class Movie{
  String title;
  double rating;
  String date;
  String desc;
  String imgURL;

  Movie(var json){
    title = json["original_title"];
    rating = (json["vote_average"]).toDouble();
    date = json["release_date"];
    desc = json["overview"];
    imgURL = json["poster_path"];
  }
}