import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/core/ui/appbar_title_richtext.dart';
import 'package:flutter_movie/ui/core/ui/movie_item.dart';

import '../../data/services/api/model/movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppbarTitleRichText(title: "Detail")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            MovieItem(movie: movie),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Divider(height: 1, color: Colors.amberAccent),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  movie.longDescription ?? "No description available.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
