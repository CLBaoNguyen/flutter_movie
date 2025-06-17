import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/core/ui/appbar_title_richtext.dart';
import 'package:flutter_movie/ui/favorite/view_models/favorite_viewmodel.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/ui/movie_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required this.viewModel});

  final FavoriteViewModel viewModel;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppbarTitleRichText(title: "Favorite")),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, _) {
          if (widget.viewModel.favorites.isEmpty) {
            return const Center(child: Text("No favorite movies found."));
          }

          return ListView.separated(
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemCount: widget.viewModel.favorites.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemBuilder: (context, index) {
              final movie = widget.viewModel.favorites[index];
              return Dismissible(
                key: ValueKey(movie.trackId),
                direction: DismissDirection.endToStart,
                confirmDismiss: (_) async {
                  widget.viewModel.onFavoriteToggle(movie);
                  return true;
                },
                background: Container(
                  color: Colors.grey.shade900,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.delete, color: Colors.redAccent,),
                      ),
                    ],
                  ),
                ),
                child: MovieItem(
                  movie: movie,
                  onFavorite: () {
                    widget.viewModel.onFavoriteToggle(movie);
                  },
                  onMovieClicked: () =>
                      context.push(Routes.detail, extra: movie),
                  isFavorite: widget.viewModel.favorites.contains(movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
