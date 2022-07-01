import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = "29f9d9475e2747482f25cafa58da6991";
  String _baseUrl = "api.themoviedb.org";
  String _language = "es-ES";

  MoviesProvider() {
    print("MoviesProviders inicializado");
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    Uri url = Uri.https(
      this._baseUrl,
      "3/movie/now_playing",
      {"api_key": this._apiKey, "language": this._language, "page": "1"},
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return print("error");
    }

    final Map<String, dynamic> json = jsonDecode(response.body);

    print(json);
  }
}
