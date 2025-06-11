import 'package:flutter/material.dart';
import 'package:flutter_movie/data/services/api/api_client.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';
import 'package:flutter_movie/util/result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(future: apiClient.getMovies(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No movies found.'));
        } else {
          final Result<List<Movie>> movies = snapshot.data!;
          switch (movies) {
            case Ok<List<Movie>>():
              final movieList = movies.value;
              return ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  final Movie movie = movieList[index];
                  return ListTile(
                    title: Text(movie.trackName),
                    subtitle: Text(movie.longDescription),
                  );
                },
              );
            case Error<List<Movie>>():
              return Center(child: Text('Error fetching movies: ${movies.error}'));
          }
        }
      }),
    );
  }
}
