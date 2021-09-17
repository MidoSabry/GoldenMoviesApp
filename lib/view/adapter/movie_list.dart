import 'package:movie_app/data/home/now_playing_respo.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<NowPlayResult> movieList;

  const MovieList({Key key, this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w342${movieList[index].poster_path}',
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
