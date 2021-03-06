import 'package:flutter/material.dart';
import 'package:peliculas_app/screens/screens.dart';

class MainRouter {
  static const String initialRoute = "/home";

  static Map<String, Widget Function(BuildContext)> routes = {
    "/home": (BuildContext context) => const HomScreen(),
    "/details": (BuildContext context) => const DetailsScreen(),
  };
}
