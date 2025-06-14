import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/core/ui/movie_item.dart';

import '../../data/services/api/model/movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Detail")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MovieItem(movie: movie),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Divider(height: 1, color: Colors.grey[300]),
            ),

            Expanded(child: SingleChildScrollView(child: Text(movie.longDescription ?? "No description available."))),
          ],
        ),
      ),
    );
  }
}
