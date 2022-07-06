import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/now_playing_response.dart';
import 'package:peliculas_app/models/popular_respose.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = "29f9d9475e2747482f25cafa58da6991";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    Uri url = Uri.https(
      _baseUrl,
      "3/movie/now_playing",
      {"api_key": _apiKey, "language": _language, "page": "1"},
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return print("error");
    }

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    Uri url = Uri.https(
      _baseUrl,
      "3/movie/popular",
      {"api_key": _apiKey, "language": _language, "page": "1"},
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return print("error");
    }

    final json = jsonDecode(response.body);

    final popularMoviesResponse = PopularResponse.fromJson(json);

    popularMovies = popularMoviesResponse.results ?? [];

    notifyListeners();
  }
}
