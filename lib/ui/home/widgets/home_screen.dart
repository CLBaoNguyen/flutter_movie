import 'package:easy_load_more/easy_load_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/data/services/api/api_client.dart';
import 'package:flutter_movie/ui/core/ui/appbar_title_richtext.dart';
import 'package:flutter_movie/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter_movie/ui/core/ui/movie_item.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitleRichText(title: "Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.push(Routes.search);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, child) {
            if (widget.viewModel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (widget.viewModel.load.error) {
              return Center(
                child: Text(
                  'Error while loading home',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            return child!;
          },
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, _) {
              return RefreshIndicator(
                onRefresh: () => widget.viewModel.load.execute("star"),
                child: EasyLoadMore(
                  isFinished: widget.viewModel.movies.length >= 200,
                  onLoadMore: () => widget.viewModel.onLoadMore(),
                  child: ListView.separated(
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemCount: widget.viewModel.movies.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) {
                      final movie = widget.viewModel.movies[index];
                      return MovieItem(
                        movie: movie,
                        onFavorite: () {
                          widget.viewModel.onFavoriteToggle(movie);
                        },
                        onMovieClicked: () =>
                            context.push(Routes.detail, extra: movie),
                        isFavorite: widget.viewModel.favorites.contains(movie),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
