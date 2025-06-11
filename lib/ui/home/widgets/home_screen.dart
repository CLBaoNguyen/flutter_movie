import 'package:flutter/material.dart';
import 'package:flutter_movie/data/services/api/api_client.dart';
import 'package:flutter_movie/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter_movie/ui/home/widgets/movie_item.dart';

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
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              widget.viewModel.load.execute();
            },
          ),
        ],
      ),
      body: SafeArea(child: ListenableBuilder(listenable: widget.viewModel.load, builder: (context, child) {
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

        return ListView.separated(
          separatorBuilder: (_, _) => const SizedBox(height: 8,),
          itemCount: widget.viewModel.movies.length,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemBuilder: (context, index) {
            final movie = widget.viewModel.movies[index];
            return MovieItem(movie: movie);
          },
        );
      })),
    );
  }
}
