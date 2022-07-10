import 'dart:convert';

import 'package:peliculas_app/models/movie.dart';

class SearchResponse {
  int? _page;
  List<Movie>? _results;
  int? _totalPages;
  int? _totalResults;

  SearchResponse(
      {int? page, List<Movie>? results, int? totalPages, int? totalResults}) {
    if (page != null) {
      this._page = page;
    }
    if (results != null) {
      this._results = results;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
    if (totalResults != null) {
      this._totalResults = totalResults;
    }
  }

  int? get page => _page;
  set page(int? page) => _page = page;
  List<Movie>? get results => _results;
  set results(List<Movie>? results) => _results = results;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalResults => _totalResults;
  set totalResults(int? totalResults) => _totalResults = totalResults;

  SearchResponse.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = <Movie>[];
      json['results'].forEach((v) {
        _results!.add(new Movie.fromJson(jsonEncode(v)));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
}
