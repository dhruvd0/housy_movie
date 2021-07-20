import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import 'movie.dart';

Future<List<Movie>> fetchMovies() async {
  try {
    List<Movie> movies = [];
    Response response = await post(Uri.parse("https://hoblist.com/movieList"),
        body: {
          "category": "movies",
          "language": "hindi",
          "genre": "all",
          "sort": "voting"
        });
    var jsonMap = jsonDecode(response.body);
    (jsonMap["result"] as List).forEach((element) {
      movies.add(Movie.fromJSON(element));
    });
    print(movies);
    return movies;
  } on SocketException {
    Fluttertoast.showToast(msg: "No internet");
    return [];
  }
}
