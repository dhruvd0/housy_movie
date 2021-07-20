import 'dart:convert';

import 'package:flutter/material.dart';

class Movie {
  String movie, genre, director, starring;
  int votes, views,releaseDate;
  String lang;
  String poster;
  Movie(
      {required this.releaseDate,
      required this.views,
      required this.votes,
      required this.genre,
      required this.director,
      required this.starring,
      required this.lang,
      required this.poster,
      required this.movie});
  factory Movie.fromJSON(var json) {
    return Movie(
        releaseDate: json["releasedDate"],
        views: json["pageViews"],
        votes: json["totalVoted"],
        genre: json["genre"],
        lang: json["language"].split(",").first,
        poster: json["poster"],
        director: (json["director"]).first as String,
        starring: (json["stars"]).first.toString().split(",").take(1).join(","),
        movie: json["title"]);
  }
}
