import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/providers/movies_providers.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Buscar película";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
          child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 130,
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(
            child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black38,
          size: 130,
        )),
      );
    }

    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: movieProvider.searchMovie(query),
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: const Center(
                  child: Icon(
                Icons.movie_creation_outlined,
                color: Colors.black38,
                size: 130,
              )),
            );
          }

          final movies = snapshot.data;

          return ListView.builder(
            itemCount: movies?.length ?? 0,
            itemBuilder: (_, int index) {
              final movie = movies![index];
              movie.heroId = "search-${movie.id}";

              return ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage("assets/no-image.jpg"),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: () =>
                    Navigator.pushNamed(context, "/details", arguments: movie),
              );
            },
          );
        });
  }
}
