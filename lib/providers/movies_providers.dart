import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/credits_response.dart';
import 'package:peliculas_app/models/now_playing_response.dart';
import 'package:peliculas_app/models/popular_respose.dart';
import 'package:peliculas_app/models/search_response.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = "29f9d9475e2747482f25cafa58da6991";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  bool fetchingNewPopularMovies = false;

  Map<int, List<Cast>> moviesCast = {};

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
    if (!fetchingNewPopularMovies) {
      fetchingNewPopularMovies = true;
      _popularPage++;

      final jsonData = await _getJsonData("popular", _popularPage);

      final json = jsonDecode(jsonData);

      final popularMoviesResponse = PopularResponse.fromJson(json);

      popularMovies = [
        ...popularMovies,
        ...popularMoviesResponse.results ?? []
      ];

      notifyListeners();
      fetchingNewPopularMovies = false;
    }
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) {
      return moviesCast[movieId]!;
    }

    final jsonData = await _getJsonData("$movieId/credits");

    final json = jsonDecode(jsonData);

    final creditsResponse = CreditsResponse.fromJson(json);

    moviesCast[movieId] = creditsResponse.cast!;

    return creditsResponse.cast!;
    //check map
  }

  Future<List<Movie>> searchMovie(String query) async {
    final Uri url = Uri.https(
      _baseUrl,
      "3/search/movie",
      {"api_key": _apiKey, "language": _language, "query": query},
    );

    final response = await http.get(url);

    final json = jsonDecode(response.body);
    final searchReponse = SearchResponse.fromJson(json);

    return searchReponse.results ?? [];
  }
}
