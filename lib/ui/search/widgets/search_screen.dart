import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/core/ui/movie_item.dart';
import 'package:flutter_movie/ui/search/view_models/search_viewmodel.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.searchViewModel});

  final SearchViewModel searchViewModel;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search for movies",
              ),
              onChanged: (value) {
                widget.searchViewModel.search(value);
              },
              controller: searchController,
            ),
          ),
          Expanded(
            child: ListenableBuilder(
                listenable: widget.searchViewModel.load, builder: (context, child) {
                  if (widget.searchViewModel.load.running) {
                    return Center(child: CircularProgressIndicator());
                  } else if (widget.searchViewModel.load.error) {
                    return Center(child: Text("Error: ${widget.searchViewModel.load.error}"));
                  } else {
                    return child!;
                  }
            },
            child: ListenableBuilder(listenable: widget.searchViewModel, builder: (context, _) {
              if (searchController.text.isEmpty) {
                return Text("Recent searches");
              } else if (widget.searchViewModel.movies.isEmpty) {
                return Center(child: Text("No results found"));
              } else {
                return ListView.separated(
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemCount: widget.searchViewModel.movies.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemBuilder: (context, index) {
                    final movie = widget.searchViewModel.movies[index];
                    return MovieItem(movie: movie, onFavorite: () {}, onMovieClicked: () => context.push(Routes.detail, extra: movie),);
                  },
                );
              }
            }),),
          )
        ],
      ),
    );
  }
}
