import 'package:flutter/material.dart';
import 'package:peliculas_app/routes/main_router.dart';
import 'package:peliculas_app/themes/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      initialRoute: MainRouter.initialRoute,
      routes: MainRouter.routes,
      theme: AppTheme.lightTheme,
    );
  }
}
