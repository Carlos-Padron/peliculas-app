import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/credits_response.dart';
import 'package:peliculas_app/providers/movies_providers.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 300),
            width: double.infinity,
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        } else {
          final cast = snapshot.data;

          return Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                final Cast actor = cast![index];

                return _CastCard(actor: actor);
              },
            ),
          );
        }
      },
    );

    /*  */
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 140,
              width: 100,
              fit: BoxFit.cover,
              placeholder: AssetImage(
                "assets/no-image.jpg",
              ),
              image: NetworkImage(actor.fullProfilePath!),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            actor.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
