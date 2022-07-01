import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_providers.dart';
import 'package:peliculas_app/routes/main_router.dart';
import 'package:peliculas_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

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
