import 'package:flutter/material.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(movie.artworkUrl100, height: 100, width: 67),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movie.trackName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movie.primaryGenreName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "${movie.trackPrice} ${movie.currency}",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.star),
        ],
      ),
    );
  }
}
