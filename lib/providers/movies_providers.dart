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

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  //Make request
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    Uri url = Uri.https(
      _baseUrl,
      "3/movie/$endpoint",
      {"api_key": _apiKey, "language": _language, "page": "$page"},
    );

    final response = await http.get(url);

    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData("now_playing");

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    print("solitud");
    final jsonData = await _getJsonData("popular", _popularPage);

    final json = jsonDecode(jsonData);

    final popularMoviesResponse = PopularResponse.fromJson(json);

    popularMovies = popularMoviesResponse.results ?? [];

    notifyListeners();
  }
}
