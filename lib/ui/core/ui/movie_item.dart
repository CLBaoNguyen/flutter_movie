import 'package:flutter/material.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
    this.onFavorite,
    this.onMovieClicked,
    this.isFavorite = false,
  });

  final Movie movie;
  final bool isFavorite;
  final VoidCallback? onFavorite;
  final VoidCallback? onMovieClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onMovieClicked?.call();
      },
      child: SizedBox(
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      movie.artistName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
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
            onFavorite != null
                ? IconButton(
                    icon: isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                    onPressed: onFavorite,
                    color: isFavorite ? Colors.amberAccent : Colors.white,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
