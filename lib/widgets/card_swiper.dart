import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: deviceSize.height * 0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: deviceSize.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: deviceSize.width * 0.6,
        itemHeight: deviceSize.width * 0.8,
        itemBuilder: (BuildContext context, int index) {
          final Movie movie = movies[index];

          movie.heroId = "swipper-${movie.id}";
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, "/details", arguments: movie),
            child: Hero(
              tag: movie.heroId ?? "",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage("assets/loading.gif"),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
