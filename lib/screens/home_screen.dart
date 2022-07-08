import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_providers.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProviders = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pelíuclas en cine"),
        elevation: 0,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Tajetas principales
            CardSwiper(movies: moviesProviders.onDisplayMovies),
            //Slider Peliculas
            MovieSlider(
              movies: moviesProviders.popularMovies,
              title: "Populares!",
              onNextPage: moviesProviders.getPopularMovies,
            )
          ],
        ),
      ),
    );
  }
}
